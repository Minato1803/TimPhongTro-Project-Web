package ptithcm.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.PhongTroInfo;
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
import ptithcm.service.UserService;

@Transactional
@Controller
@RequestMapping("")
public class HomeController {
	@Autowired
	public ThanhPhoService thanhPhoService;
	@Autowired
	private QuanHuyenService quanHuyenService;
	@Autowired
	private DuongPhoService duongPhoService;
	@Autowired
	private PhongTroService phongTroService;
	@Autowired
	private CTHinhAnhService ctHinhAnhService;
	@Autowired
	private UserService userService;
	@Autowired
	TaiKhoan userInfo;
	
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
	@ModelAttribute("giaCa")
	public Map<String,String> getGia()
	{
		Map<String,String> giaCa = new HashMap<>();
		giaCa.put("1", "Dưới 2 triệu");
		giaCa.put("2","2 triệu - 5 triệu");
		giaCa.put("3","5 triệu - 10 triệu");
		giaCa.put("4","trên 10 triệu");
		return giaCa;
	}
	@ModelAttribute("dienTichDat")
	public Map<String,String> getdienTich()
	{
		Map<String,String> dienTichDat = new HashMap<>();
		dienTichDat.put("1","Dưới 20 m2");
		dienTichDat.put("2","20 m2 - 50 m2 ");
		dienTichDat.put("3","50 m2 - 70 m2");
		dienTichDat.put("4","Trên 70 m2");
		return dienTichDat;
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
	
	//====controller==//
	
	@RequestMapping(value = "home")
	public String viewHome(ModelMap model, HttpSession session)
	{
//		List<ThanhPho> listThanhPho = thanhPhoService.getAll();
//		
//		for(ThanhPho tp : listThanhPho)
//		{
//			List<QuanHuyen> listQ = (quanHuyenService.getListByTP(tp.getMaTP()));
//			tp.setQuanHuyen(listQ);
//			for(QuanHuyen Q : listQ)
//			{
//				Q.setDuongPho(duongPhoService.getListByQuan(Q.getMaQuan()));
//			}
//		}
//		session.getAttribute("listTP", listThanhPho);
		defaultSession(session);
		model.addAttribute("command", new PhongTroInfo());
		List<PhongTro> list = phongTroService.getAllLimit();
		for(PhongTro x: list)
		{
			x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
		}
		model.addAttribute("listP", list);
		 return "pages/index";
	}
	
	@RequestMapping(value = "dang-nhap", method = RequestMethod.POST)
	public String formDN(ModelMap modelMap, HttpSession session, @ModelAttribute("user") TaiKhoan user)
	{
		System.out.println("user-login: " + user.getUserName() + " "+ user.getPassWord());
		TaiKhoan userInfo = userService.loginByUname(user.getUserName(), user.getPassWord());
			if(userInfo == null)
			{				
				userInfo = userService.loginBySdt(user.getUserName(), user.getPassWord());
				if(userInfo == null)
				{
					modelMap.addAttribute("userInfo", new TaiKhoan());
					modelMap.addAttribute("message", "Tên tài khoản hoặc mật khẩu không đúng!");
					return "managers/dang-nhap";
				}
				
			}
			userInfo.setPhongTro(phongTroService.getListByUser(userInfo));
			System.out.println(userInfo.getPhongTro());
			session.setAttribute("userInfo", userInfo);
			return "redirect:home.htm";
	}
	@RequestMapping(value = "thoat")
	public String logOut(HttpSession session)
	{
		session.invalidate();
		return "redirect:home.htm";
	}
	
	
	
	@RequestMapping(value="cho-thue-phong-tro")
	public String listCTPT(ModelMap model,@ModelAttribute("command") PhongTroInfo phongTroInfo)
	{
		phongTroInfo.setLoai("1");
		List<PhongTro> list = phongTroService.getListByType("1");
		for(PhongTro x: list)
		{
			x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
		}
		model.addAttribute("listP", list);
		return "pages/danhSachPhong";
	}
	
	@RequestMapping(value="cho-thue-can-ho")
	public String listCTCH(ModelMap model,@ModelAttribute("command") PhongTroInfo phongTroInfo)
	{
		phongTroInfo.setLoai("2");
		List<PhongTro> list = phongTroService.getListByType("2");
		for(PhongTro x: list)
		{
			x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
		}
		model.addAttribute("listP", list);
		return "pages/danhSachPhong";
	}
	
	@RequestMapping(value="cho-thue-nha-nguyen-can")
	public String listCTNNC(ModelMap model,@ModelAttribute("command") PhongTroInfo phongTroInfo)
	{
		phongTroInfo.setLoai("3");
		List<PhongTro> list = phongTroService.getListByType("3");
		for(PhongTro x: list)
		{
			x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
		}
		model.addAttribute("listP", list);
		return "pages/danhSachPhong";
	}
	
	@RequestMapping(value="tim-nguoi-o-ghep")
	public String listTNOG(ModelMap model,@ModelAttribute("command") PhongTroInfo phongTroInfo)
	{
		phongTroInfo.setLoai("4");
		List<PhongTro> list = phongTroService.getListByType("4");
		for(PhongTro x: list)
		{
			x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
		}
		model.addAttribute("listP", list);
		return "pages/danhSachPhong";
	}
	
	public void defaultSession(HttpSession session)
	{
		List<ThanhPho> listThanhPho = thanhPhoService.getAll();
		session.setAttribute("listTP", listThanhPho);
		
		List<QuanHuyen> listQuanHuyen = quanHuyenService.getAll();
		session.setAttribute("listQ", listQuanHuyen);
		
		List<DuongPho> listDuongPho = duongPhoService.getAll();
		session.setAttribute("listD", listDuongPho);
		
		Map<String,String> giaCa = new HashMap<>();
		giaCa.put("1", "Dưới 2 triệu");
		giaCa.put("2","2 triệu - 5 triệu");
		giaCa.put("3","5 triệu - 10 triệu");
		giaCa.put("4","trên 10 triệu");
		session.setAttribute("listPrice", giaCa);
		
		Map<String,String> dienTichDat = new HashMap<>();
		dienTichDat.put("1","Dưới 20 m2");
		dienTichDat.put("2","20 m2 - 50 m2 ");
		dienTichDat.put("3","50 m2 - 70 m2");
		dienTichDat.put("4","Trên 70 m2");
		session.setAttribute("listArea", dienTichDat);
		
		Map<String,String> loaiHinh = new HashMap<>();
		loaiHinh.put("1","Cho thuê phòng trọ");
		loaiHinh.put("2","Cho thuê căn hộ");
		loaiHinh.put("3","Cho thuê nhà nguyên căn");
		loaiHinh.put("4","Tìm người ở ghép");
		session.setAttribute("listType", loaiHinh);
	}
}
