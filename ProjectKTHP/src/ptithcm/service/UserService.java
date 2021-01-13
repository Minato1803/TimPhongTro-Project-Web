package ptithcm.service;

import java.util.List;

import ptithcm.entity.TaiKhoan;

public interface UserService {
	
	public boolean register(TaiKhoan user);
	
	public TaiKhoan loginByUname(String uname, String pass);
	
	public TaiKhoan loginBySdt(String sdt, String pass);
	
	public TaiKhoan forgotPass(String email);
	
	public boolean updateUser(TaiKhoan user);
	
	public boolean findbysdt(String sdt);
	
	public boolean findbyEmail(String email);
	
	public boolean findbyUserName(String userName);
	
	public TaiKhoan getbysdt(String sdt);
}
