package ptithcm.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.CT_HinhAnh;
import ptithcm.entity.DuongPho;
import ptithcm.entity.PhongTro;
import ptithcm.entity.QuanHuyen;
import ptithcm.entity.TaiKhoan;
import ptithcm.entity.ThanhPho;
import ptithcm.service.CTHinhAnhService;
import ptithcm.service.DuongPhoService;
import ptithcm.service.PhongTroService;
import ptithcm.service.QuanHuyenService;
import ptithcm.service.ThanhPhoService;

@Transactional
@Controller
public class PostDetailController {

	@Autowired
	private PhongTroService phongTroService;
	@Autowired
	public ThanhPhoService thanhPhoService;
	@Autowired
	private QuanHuyenService quanHuyenService;
	@Autowired
	private DuongPhoService duongPhoService;
	@Autowired
	private CTHinhAnhService ctHinhAnhService;
	@Autowired
	ServletContext context;
	
	@ModelAttribute("listThanhPho")
	public List<ThanhPho> getThanhPho()
	{
		List<ThanhPho> listThanhPho = thanhPhoService.getAll();
		return listThanhPho;
	}
	@ModelAttribute("listQuanHuyen")
	public List<QuanHuyen> getQuan()
	{
		List<QuanHuyen> listQuanHuyen = quanHuyenService.getAll();
		return listQuanHuyen;
	}
	@ModelAttribute("listDuongPho")
	public List<DuongPho> getDuong()
	{
		List<DuongPho> listDuongPho = duongPhoService.getAll();
		return listDuongPho;
	}
	
	@ModelAttribute("loaiHinh")
	public Map<String,String> getloai()
	{
		Map<String,String> loaiHinh = new HashMap<>();
		loaiHinh.put("1","Cho thuê phòng trọ");
		loaiHinh.put("2","Cho thuê căn hộ");
		loaiHinh.put("3","Cho thuê nhà nguyên căn");
		loaiHinh.put("4","Tìm người ở ghép");
		return loaiHinh;
	}
	//==controller==//
	@RequestMapping(value = "dang-tin")
	public String frmDetail(ModelMap model, HttpSession session)
	{
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
        if (user == null) {
            return "redirect:dang-nhap.htm";
        }
		model.addAttribute("detail", new PhongTro());
		return "managers/dang-tin";
	}
	
	@RequestMapping(value = "dang-tin", method = RequestMethod.POST)
	public String doPostDetail(ModelMap modelMap, @Validated @ModelAttribute("detail") PhongTro detail, BindingResult errors,HttpSession session, @RequestParam("files") MultipartFile[] files)
	{
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
		detail.setSdt(user.getSdt());
//		System.out.println(detail.getSdt());
		Long totalSize = 0L;
		if(files.length > 0)
		{
			for(MultipartFile file : files)
			{
				if(file.getContentType().toLowerCase().contains("gif"))
				{
					modelMap.addAttribute("message", "Không được upload ảnh gif");
					return "managers/dang-tin";
				}
				else if(file.getContentType().toLowerCase().contains("pdf") || file.getContentType().toLowerCase().contains("document"))
				{
					modelMap.addAttribute("message", "Sai định dạng ảnh!");
					return "managers/dang-tin";
				}
				totalSize +=file.getSize();
			}
			if(files.length>3)
			{
				modelMap.addAttribute("message", "Không được đăng quá 3 ảnh!");
				return "managers/dang-tin";
			}
			else if(totalSize>6291456){
				modelMap.addAttribute("message", "Tập ảnh không quá 6MB!");
				return "managers/dang-tin";
			}
		}

		if(errors.hasErrors())
		{
			System.out.println(detail.getMaDuong().getMaDuong().isEmpty() + " test " + detail.getMaDuong().getMaDuong());
			System.out.println(errors.getFieldError());
			modelMap.addAttribute("message", errors.getFieldError().getDefaultMessage());
			return "managers/dang-tin";
		}
		else
		{
			System.out.println("post-ok");
			detail.setMaUser((TaiKhoan) session.getAttribute("userInfo"));
			phongTroService.saveDetail(detail);
			user.getPhongTro().clear();
			user.setPhongTro(phongTroService.getListByUser(user));
			if(files.length > 0)
			{
				System.out.println(files.length);
				for(MultipartFile file : files) 
				{
					if(file.isEmpty())
						break;
					String fileName = saveImage(file);
					CT_HinhAnh ctImg = new CT_HinhAnh();
					ctImg.setMaPhong(detail);
					ctImg.setUrlHinhAnh(fileName);
					ctHinhAnhService.saveImg(ctImg);
				}
			}
			return "redirect:quan-ly-tin.htm";
		}
	}
	
	@RequestMapping(value = "sua-tin-id-{maPhong}")
	public String frmEditDetail(ModelMap modelMap,HttpSession session, @PathVariable Integer maPhong)
	{
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
        if (user == null) {
            return "redirect:dang-nhap.htm";
        }
        if(user.getMaUser() != phongTroService.getPhongTroById(maPhong).getMaUser().getMaUser())
        {
        	return "pages/not-found-404";
        }
		modelMap.addAttribute("detail", phongTroService.getPhongTroById(maPhong));
		session.setAttribute("detail", phongTroService.getPhongTroById(maPhong));
		modelMap.addAttribute("detailImgs", ctHinhAnhService.getall(maPhong));
		return "managers/sua-tin";
	}
	
	@RequestMapping(value = "sua-tin", method= RequestMethod.POST)
	public String saveEditDetail(ModelMap modelMap, @Validated @ModelAttribute("detail") PhongTro detail, BindingResult errors,HttpSession session, @RequestParam("files") MultipartFile[] files)
	{
		
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
		detail.setSdt(user.getSdt());
		detail.setLienHe(user.getFullName());
//		System.out.println(detail.getSdt());
		
		if(errors.hasErrors())
		{
			System.out.println(errors.getFieldError());
			modelMap.addAttribute("message", errors.getFieldError().getDefaultMessage());
			return "managers/sua-tin";
		}
		else
		{
			System.out.println("update-ok");
			System.out.println("files");
			PhongTro phongTro = (PhongTro) session.getAttribute("detail");
			detail.setMaPhong(phongTro.getMaPhong());
			System.out.println("bug edit id: " +detail.getMaPhong());
			System.out.println("info edit: " + detail.getTieuDe() + " " + detail.getLienHe() + " " + detail.getSdt() +" "+ detail.getDiaChi());
			List<CT_HinhAnh> listImgs = ctHinhAnhService.getall(phongTro.getMaPhong());
			if(listImgs.size() != 0)
			{
				for(CT_HinhAnh x : listImgs)
				{
					ctHinhAnhService.deleteImg(x);
				}	
			}
			detail.setMaUser(user);
			phongTroService.updateDetail(detail);
			if(files.length>0)
			{
				for(MultipartFile file : files) 
				{
					String fileName = saveImage(file);
					CT_HinhAnh ctImg = new CT_HinhAnh();
					ctImg.setMaPhong(phongTro);
					ctImg.setUrlHinhAnh(fileName);
					ctHinhAnhService.saveImg(ctImg);
				}				
			}
			session.setAttribute("detail", new PhongTro());
			return "redirect:quan-ly-tin.htm";
		
		}
	}
	
	@RequestMapping(value = "xoa-tin-id-{maPhong}")
	public String frmDeleteDetail(ModelMap modelMap,HttpSession session, @PathVariable Integer maPhong)
	{
		
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
        if (user == null) {
            return "redirect:dang-nhap.htm";
        }
        if(user.getMaUser() != phongTroService.getPhongTroById(maPhong).getMaUser().getMaUser())
        {
        	return "pages/not-found-404";
        }
		PhongTro phongTro = phongTroService.getPhongTroById(maPhong);
		System.out.println("item delete: " + phongTro);
		List<CT_HinhAnh> listImgs = ctHinhAnhService.getall(phongTro.getMaPhong());
		if(listImgs.size()!=0)
		{
			for(CT_HinhAnh x : listImgs)
			{
				ctHinhAnhService.deleteImg(x);
			}			
		}
		user.getPhongTro().clear();
		System.out.println("bug after delete img");
		phongTroService.deleteDetail(phongTro);
		user.setPhongTro(phongTroService.getListByUser((TaiKhoan) session.getAttribute("userInfo")));
		return "redirect:quan-ly-tin.htm";
	}
	
	private String saveImage(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths.get(context.getRealPath("/files/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		} catch (IOException e) {
			return null;
		}
	}
}
