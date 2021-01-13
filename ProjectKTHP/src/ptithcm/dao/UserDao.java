package ptithcm.dao;

import java.util.List;

import ptithcm.entity.TaiKhoan;

public interface UserDao {

	public boolean register(TaiKhoan user);
	
	public boolean updateUser(TaiKhoan user);
	
	public TaiKhoan loginByUname(String uname, String pass);
	
	public TaiKhoan loginBySdt(String sdt, String pass);
	
	public TaiKhoan forgotPass(String Email);
	
	public boolean findbysdt(String sdt);
	
	public boolean findbyEmail(String email);
	
	public boolean findbyUserName(String userName);
	
	public TaiKhoan getbysdt(String sdt);
}
