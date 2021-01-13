package ptithcm.entity;


import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "TaiKhoan")
public class TaiKhoan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer maUser;
	
	@NotBlank(message="Không được để trống tên user!")
	@Length(max = 50, message="Độ dài tên không quá 50 kí tự!")
	private String userName;

//	@NotBlank(message="Không được để trống mật khẩu!")
//	@Length(min = 6, max = 50,message="Độ dài mật khẩu từ 6-50 kí tự!")
	private String passWord;
	
	@NotBlank(message="Không được để trống tên user!")
	@Length(max = 50, message="Độ dài tên không quá 50 kí tự!")
	private String fullName;
	
	@Pattern(regexp="\\d{10}",message="Số điện thoại không hợp lệ!")
	private String sdt;
	
	@Email(message="Email không hợp lệ!")
	private String emailLienHe;
	
	private String diaChi;
	
	@OneToMany(mappedBy = "maUser", fetch = FetchType.EAGER)
	private Collection<PhongTro> phongTro;

	public Integer getMaUser() {
		return maUser;
	}

	public void setMaUser(Integer maUser) {
		this.maUser = maUser;
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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getEmailLienHe() {
		return emailLienHe;
	}

	public void setEmailLienHe(String emailLienHe) {
		this.emailLienHe = emailLienHe;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Collection<PhongTro> getPhongTro() {
		return phongTro;
	}

	public void setPhongTro(Collection<PhongTro> phongTro) {
		this.phongTro = phongTro;
	}

	
	
	
}
