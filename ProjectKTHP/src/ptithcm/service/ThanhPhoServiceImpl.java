package ptithcm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.ThanhPhoDao;
import ptithcm.entity.ThanhPho;

@Service
public class ThanhPhoServiceImpl implements ThanhPhoService{

	@Autowired
	private ThanhPhoDao thanhPhoDao;
	
	@Override
	public ThanhPho findById(String maTP) {
		// TODO Auto-generated method stub
		return thanhPhoDao.findById(maTP);
	}

	@Override
	public List<ThanhPho> getAll() {
		// TODO Auto-generated method stub
		return thanhPhoDao.getAll();
	}
	
}
