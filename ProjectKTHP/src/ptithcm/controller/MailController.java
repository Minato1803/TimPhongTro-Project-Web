package ptithcm.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Mailer;
import ptithcm.entity.TaiKhoan;
import ptithcm.service.UserService;

@Controller
public class MailController {

	@Autowired
	Mailer mailer;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "quen-mat-khau")
	public String forgotPass(ModelMap modelMap)
	{
		return "managers/quen-mk";
	}
	
	@RequestMapping(value = "quen-mat-khau", method = RequestMethod.POST)
	public String sendMail(ModelMap modelMap, @RequestParam("to") String to)
	{
		if(to.isEmpty())
		{
			modelMap.addAttribute("message", "Vui lòng nhập Email!");
			return "managers/quen-mk";
		}
		else if(!isValidEmailAddress(to))
		{
			modelMap.addAttribute("message", "Sai cú pháp Email!");
			return "managers/quen-mk";
		}
		else if(!userService.findbyEmail(to))
		{
			modelMap.addAttribute("message", "Email này chưa liên kết với tài khoản nào!");
			return "managers/quen-mk";
		}
		else
		{
			try
			{
				String randomPass = generatePassword();
				System.out.println(randomPass);
				TaiKhoan userInfo = userService.forgotPass(to);
				userInfo.setPassWord(randomPass);
				userService.updateUser(userInfo);
				mailer.send("laptrinhweb.ndk@gmail.com",to,"Đặt lại mật khẩu","Mật khẩu mới của bạn là " + randomPass + ".Vui lòng đăng nhập và đổi mật khẩu để đảm bảo an toàn!");
				
				modelMap.addAttribute("message", "Gửi email thành công!");
				
			} catch (Exception e) {
				// TODO: handle exception
				modelMap.addAttribute("message", "Gửi email thất bại!");
			}
			return "redirect:dang-nhap.htm";
		}
		
	}
	
	private boolean isValidEmailAddress(String email) 
	{
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);
        return m.matches();
	}
	
	private String generatePassword() 
	{
      String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
      String specialCharacters = "!@#$";
      String numbers = "1234567890";
      String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
      Random random = new Random();
      String password = "";
   
      for(int i = 0; i< 6 ; i++) {
         password += combinedChars.charAt(random.nextInt(combinedChars.length()));
      }
      return password;
	}
}
