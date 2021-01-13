package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.PhongTroInfo;
import ptithcm.entity.DuongPho;
import ptithcm.entity.PhongTro;
import ptithcm.entity.QuanHuyen;
import ptithcm.service.CTHinhAnhService;
import ptithcm.service.DuongPhoService;
import ptithcm.service.PhongTroService;
import ptithcm.service.QuanHuyenService;
import ptithcm.service.ThanhPhoService;

@Transactional
@Controller
public class SearchingController {
	
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
	
	@RequestMapping(value="searching")
	public String listSearching(ModelMap model,@ModelAttribute("command") PhongTroInfo phongTroInfo)
	{
		System.out.println("loai: " + phongTroInfo.getLoai());
		// chia 3 trường hợp cơ bản: chỉ 1 lựa chọn, tất cả lựa chọn hoặc ko chọn gì cả
		String loaiValue = phongTroInfo.getLoai();
		String tp = phongTroInfo.getTP();
		String quan = phongTroInfo.getQuan();
		String duong= phongTroInfo.getDuong();
		List<DuongPho> listDuong = new ArrayList<>();
		List<QuanHuyen> listQ = new ArrayList<>();
		System.out.println("search option: " +tp + " "+quan + " " + duong);
		List<PhongTro> list = new ArrayList<>();
		
		
		if(tp.length()>0)
		{
			if(quan.length()>0 && duong.length()>0)
			{
				listDuong = duongPhoService.getListByQuan(quan);
			}
			else if(quan.length()>0)
			{
				listDuong = duongPhoService.getListByQuan(quan);
			}
			else
			{
				listQ = quanHuyenService.getListByTP(tp);
				for(QuanHuyen Q : listQ)
				{
					listDuong = duongPhoService.getListByQuan(Q.getMaQuan());
				}
				
			}
		}
		int giaValue = Integer.parseInt(phongTroInfo.getGia());
		int dienTichValue =  Integer.parseInt(phongTroInfo.getDienTich());
		
		System.out.println("search option: " +giaValue + " "+dienTichValue);
		
		if(loaiValue.length()>0 || tp.length()>0 || giaValue!=0 || dienTichValue!=0) // có lựa chọn
		{
			System.out.println("co lua chon");
			if(loaiValue.length()>0 && tp.length()>0 && giaValue!=0 && dienTichValue!=0) //lựa chọn đầy đủ
			{
				System.out.println("day-du");
				if(duong.length()>0)
				{
					list = phongTroService.getListByQuery(loaiValue, duong, giaValue, dienTichValue);
					for(PhongTro x: list)
					{
						x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
					}

					model.addAttribute("listP", list);
				}
				else
				{
					List<PhongTro> phongTro = new ArrayList<>();
					for(int i = 0;i<listDuong.size();i++)
					{
						phongTro.addAll(phongTroService.getListByQuery(loaiValue, listDuong.get(i).getMaDuong(), giaValue, dienTichValue));
						for(PhongTro x: phongTro)
						{
							x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
						}
					}
					model.addAttribute("listP",phongTro);
				}
			}
			else // lựa chọn một
			{
				System.out.println("lua-chon-mot dt:"+ dienTichValue +" gia:"+ giaValue + " loai: " + loaiValue.length());
				if(giaValue!=0)
				{
					list = phongTroService.getListByPrice(giaValue);
					for(PhongTro x: list)
					{
						x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
					}

					model.addAttribute("listP", list);
				}
				else if(dienTichValue!=0)
				{
					System.out.println("lua-chon-dien-tich");
					list = phongTroService.getListByDienTich(dienTichValue);
					for(PhongTro x: list)
					{
						x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
					}

					model.addAttribute("listP", list);
				}
				else if(loaiValue.length()>0)
				{
					list = phongTroService.getListByType(loaiValue);
					for(PhongTro x: list)
					{
						x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
					}

					model.addAttribute("listP", list);
				}
				else if(tp.length()>0)
				{
					if(quan.length()>0 && duong.length()>0)
					{
						list = phongTroService.getListByDuong(duong);
						for(PhongTro x: list)
						{
							x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
						}

						model.addAttribute("listP", list);
					}
					else if(quan.length()>0)
					{
						List<PhongTro> phongTro = new ArrayList<>();
						for(int i = 0;i<listDuong.size();i++)
						{
							phongTro.addAll(phongTroService.getListByDuong(listDuong.get(i).getMaDuong()));
							for(PhongTro x: phongTro)
							{
								x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
							}
						}
						model.addAttribute("listP",phongTro);
					}
					else
					{
						List<PhongTro> phongTro = new ArrayList<>();
						for(int j = 0;j<listDuong.size();j++)
						{
							phongTro.addAll(phongTroService.getListByDuong(listDuong.get(j).getMaDuong()));
							for(PhongTro x: phongTro)
							{
								x.setCtHinhAnh(ctHinhAnhService.getall(x.getMaPhong()));
							}
						}
						model.addAttribute("listP",phongTro);
					}
				}
				
			}
		}
		else // không lựa chọn
		{
			model.addAttribute("listP", phongTroService.getAll());
		}
		return "pages/danhSachPhong";
	}
}
