package ptithcm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.DuongPhoDao;
import ptithcm.entity.DuongPho;

@Service
public class DuongPhoServiceImpl implements DuongPhoService{

	@Autowired
	private DuongPhoDao duongPhoDao;
	@Override
	public DuongPho findById(String maDuong) {
		// TODO Auto-generated method stub
		return duongPhoDao.findById(maDuong);
	}

	@Override
	public List<DuongPho> getListByQuan(String maQuan) {
		// TODO Auto-generated method stub
		return duongPhoDao.getListByQuan(maQuan);
	}

	@Override
	public List<DuongPho> getAll() {
		// TODO Auto-generated method stub
		return duongPhoDao.getAll();
	}

}
