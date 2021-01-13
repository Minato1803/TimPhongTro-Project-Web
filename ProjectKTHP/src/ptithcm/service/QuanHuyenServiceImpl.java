package ptithcm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.QuanHuyenDao;
import ptithcm.entity.QuanHuyen;

@Service
public class QuanHuyenServiceImpl implements QuanHuyenService{

	@Autowired
	private QuanHuyenDao quanHuyenDao;
	
	@Override
	public QuanHuyen findById(String maQuan) {
		// TODO Auto-generated method stub
		return quanHuyenDao.findById(maQuan);
	}

	@Override
	public List<QuanHuyen> getListByTP(String maTP) {
		// TODO Auto-generated method stub
		return quanHuyenDao.getListByTP(maTP);
	}

	@Override
	public List<QuanHuyen> getAll() {
		// TODO Auto-generated method stub
		return quanHuyenDao.getAll();
	}

}
