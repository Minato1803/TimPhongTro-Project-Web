package ptithcm.controller;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.AccountInfo;
import ptithcm.entity.TaiKhoan;
import ptithcm.service.PhongTroService;
import ptithcm.service.UserService;

@Transactional
@Controller
public class AccountController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PhongTroService phongTroService;
//	@Autowired
//	TaiKhoan userInfo;

	//====Đăng nhập tài khoản==//
	@RequestMapping(value = "dang-nhap")
	public String showlogin(ModelMap modelMap, HttpSession session)
	{
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
        if (user != null) {
            return "redirect:tai-khoan.htm";
        }
		modelMap.addAttribute("user", new TaiKhoan());
		return "managers/dang-nhap";
	}

	//====Đăng kí tài khoản==//
	@RequestMapping(value = "dang-ky")
	public String formDK(ModelMap modelMap, HttpSession session)
	{
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
        if (user != null) {
            return "redirect:tai-khoan.htm";
        }
		modelMap.addAttribute("user", new AccountInfo());
		return "managers/dang-ky";
	}
	
	@RequestMapping(value = "dang-ky", method = RequestMethod.POST)
	public String signUp(ModelMap modelMap,@Validated @ModelAttribute("user") AccountInfo user, BindingResult errors) 
	{
		if(errors.hasErrors())
		{
			modelMap.addAttribute("message", errors.getFieldError().getDefaultMessage());
			return "managers/dang-ky";
		}
		else if(userService.findbyUserName(user.getUserName().trim()))
		{
			modelMap.addAttribute("message", "Tên tài khoản đã tồn tại!");
			return "managers/dang-ky";
		}
		else if(!user.getPassWord().trim().equals(user.getConfirmPass().trim())){
			modelMap.addAttribute("message", "Mật khẩu không khớp!");
			return "managers/dang-ky";
		}
		else if(userService.findbysdt(user.getStd())){
			modelMap.addAttribute("message", "Số điện thoại này đã đăng kí!");
			return "managers/dang-ky";
		}
		else {
			TaiKhoan dbUser = new TaiKhoan();
			dbUser.setUserName(user.getUserName());
			dbUser.setPassWord(user.getPassWord());
			dbUser.setFullName(user.getUserName());
			dbUser.setSdt(user.getStd());
			userService.register(dbUser);
			modelMap.addAttribute("userInfo", dbUser);
			return "managers/tai-khoan";
		}
		
	}
	
	//====Quản lý tài khoản==//
	
	@RequestMapping(value = "tai-khoan")
	public String showInfo(ModelMap modelMap, HttpSession session)
	{
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
        if (user == null) {
            return "redirect:dang-nhap.htm";
        }
		modelMap.addAttribute("userInfo", (TaiKhoan) session.getAttribute("userInfo"));
		return "managers/tai-khoan";
	}
	
	@RequestMapping(value = "tai-khoan", method = RequestMethod.POST)
	public String updateInfo(ModelMap modelMap, HttpSession session, @Validated @ModelAttribute("userInfo") TaiKhoan userInfo, BindingResult errors)
	{
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
		userInfo.setMaUser(userService.getbysdt(user.getSdt()).getMaUser());
		userInfo.setPassWord(userService.getbysdt(user.getSdt()).getPassWord());
		
		if(errors.hasErrors())
		{
			System.out.println("bug pass: " + userInfo.getMaUser());
			System.out.println("bug pass: " + userInfo.getPassWord());
			System.out.println("bug username: " + userInfo.getUserName());
			System.out.println("bug fullname: " + userInfo.getFullName());
			System.out.println("bug sdt: " + userInfo.getSdt());
			System.out.println("bug email: " + userInfo.getEmailLienHe());
			System.out.println("bug dia chi: " + userInfo.getDiaChi());
			System.out.println("bug: " + errors.getFieldError());
			modelMap.addAttribute("message", errors.getFieldError().getDefaultMessage());
			return "managers/tai-khoan";
		}
		else if(userService.findbyUserName(userInfo.getUserName()) && userInfo.getUserName().equals(user.getUserName()) == false)
		{
			modelMap.addAttribute("message", "Tên tài khoản này đã có người đăng kí!");
			return "managers/tai-khoan";
		}
		else if(userService.findbysdt(userInfo.getSdt()) && userInfo.getSdt().equals(user.getSdt()) == false)
		{
			modelMap.addAttribute("message", "Số điện thoại này đã có người đăng kí!");
			return "managers/tai-khoan";
		}
		else if(userService.findbyEmail(userInfo.getEmailLienHe()) && userInfo.getEmailLienHe().equals(user.getEmailLienHe()) == false)
		{
			modelMap.addAttribute("message", "Email này đã có người đăng kí!");
			return "managers/tai-khoan";
		}
		else
		{
			System.out.println("update-user-ok");
			userService.updateUser(userInfo);
			session.setAttribute("userInfo", userInfo);
			modelMap.addAttribute("userInfo", userInfo);
			return "redirect:tai-khoan.htm";
		}
	}
	//====Quản lý mật khẩu==//
	
	
	@RequestMapping(value = "doi-mat-khau")
	public String changePass(ModelMap modelMap, HttpSession session)
	{
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
        if (user == null) {
            return "redirect:dang-nhap.htm";
        }
		modelMap.addAttribute("userInfo", (TaiKhoan) session.getAttribute("userInfo"));
		return "managers/doi-mat-khau";
	}
	
	@RequestMapping(value = "doi-mat-khau", method = RequestMethod.POST)
	public String changePass(ModelMap modelMap, HttpSession session, @RequestParam("oldPass") String oldPass,
																	 @RequestParam("newPass") String newPass,
																	 @RequestParam("confirmPass") String confirmPass)
	{
		TaiKhoan userInfo = (TaiKhoan) session.getAttribute("userInfo");
		if(oldPass.isEmpty() || newPass.isEmpty() || confirmPass.isEmpty())
		{
			modelMap.addAttribute("message", "Vui lòng không để trống thông tin nhập!");
			return "managers/doi-mat-khau";
		}
		else if(userInfo.getPassWord().equals(oldPass.trim()) == false)
		{
			modelMap.addAttribute("message", "Mật khẩu cũ không đúng!");
			return "managers/doi-mat-khau";
		}
		else if(newPass.trim().equals(confirmPass.trim()) == false)
		{
			modelMap.addAttribute("message", "Mật khẩu nhập lại không khớp!");
			return "managers/doi-mat-khau";
		}
		else if(newPass.trim().length()<6 || newPass.trim().length()>50)
		{
			modelMap.addAttribute("message", "Mật khẩu độ dài từ 6-50");
			return "managers/doi-mat-khau";
		}
		else
		{
			userInfo.setPassWord(newPass);
			userService.updateUser(userInfo);
			session.setAttribute("userInfo", userInfo);
			return "redirect:tai-khoan.htm";
		}
	}
	//== Quản lý tin==//
	@RequestMapping(value = "quan-ly-tin")
	public String managerDetail(ModelMap model, HttpSession session)
	{
		TaiKhoan user = (TaiKhoan) session.getAttribute("userInfo");
        if (user == null) {
            return "redirect:dang-nhap.htm";
        }
		model.addAttribute("listP",phongTroService.getListByUser((TaiKhoan) session.getAttribute("userInfo")));		
		return "managers/quan-ly-tin";
	}
	 
}
