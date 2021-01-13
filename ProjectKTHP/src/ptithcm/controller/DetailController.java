package ptithcm.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.PhongTroInfo;
import ptithcm.entity.PhongTro;
import ptithcm.service.CTHinhAnhService;
import ptithcm.service.PhongTroService;

@Transactional
@Controller
public class DetailController {

	@Autowired
	private PhongTroService phongTroService;
	@Autowired
	private CTHinhAnhService ctHinhAnhService;
	
	@RequestMapping(value = "detail-id-{maPhong}")
	public String detail(ModelMap modelMap, @PathVariable Integer maPhong) {
		PhongTro phongTro = phongTroService.getPhongTroById(maPhong);
		System.out.println(phongTro);
		modelMap.addAttribute("detail", phongTroService.getPhongTroById(maPhong));
		modelMap.addAttribute("detailImgs", ctHinhAnhService.getall(maPhong));
		modelMap.addAttribute("command", new PhongTroInfo());
		return "pages/chi-tiet-phong";
	}
}
