package ptithcm.bean;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class AccountInfo {

	@NotBlank(message="Không được để trống tên user!")
	@Length(max = 50, message="Độ dài tên không quá 50 kí tự!")
	private String userName;
	@NotBlank(message="Không được để trống mật khẩu!")
	@Length(min = 6, max = 50,message="Độ dài mật khẩu từ 6-50 kí tự!")
	private String passWord;
	@NotBlank(message="Không được để trống mật khẩu!")
	@Length(min = 6, max = 50,message="Độ dài mật khẩu từ 6-50 kí tự!")
	private String confirmPass;
	@Pattern(regexp="\\d{10}",message="Số điện thoại không hợp lệ!")
	private String std;
	
	public AccountInfo()
	{
		super();
	}
	public AccountInfo(String userName, String passWord, String confirmPass, String std) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.confirmPass = confirmPass;
		this.std = std;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getConfirmPass() {
		return confirmPass;
	}
	public void setConfirmPass(String confirmPass) {
		this.confirmPass = confirmPass;
	}
	public String getStd() {
		return std;
	}
	public void setStd(String std) {
		this.std = std;
	}
	
	
	
}
