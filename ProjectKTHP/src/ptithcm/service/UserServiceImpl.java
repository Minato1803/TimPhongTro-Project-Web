package ptithcm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.UserDao;
import ptithcm.entity.TaiKhoan;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private  UserDao userDao;

	@Override
	public boolean register(TaiKhoan user) {
		// TODO Auto-generated method stub
		return userDao.register(user);
	}

	@Override
	public TaiKhoan loginByUname(String uname, String pass) {
		// TODO Auto-generated method stub
		return userDao.loginByUname(uname, pass);
	}

	@Override
	public TaiKhoan loginBySdt(String sdt, String pass) {
		// TODO Auto-generated method stub
		return userDao.loginBySdt(sdt, pass);
	}
	
	@Override
	public TaiKhoan forgotPass(String email) {
		// TODO Auto-generated method stub
		return userDao.forgotPass(email);
	}

	@Override
	public boolean updateUser(TaiKhoan user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	@Override
	public boolean findbysdt(String sdt) {
		// TODO Auto-generated method stub
		return userDao.findbysdt(sdt);
	}

	@Override
	public TaiKhoan getbysdt(String sdt) {
		// TODO Auto-generated method stub
		return userDao.getbysdt(sdt);
	}

	@Override
	public boolean findbyEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.findbyEmail(email);
	}

	@Override
	public boolean findbyUserName(String userName) {
		// TODO Auto-generated method stub
		return userDao.findbyUserName(userName);
	}


}
