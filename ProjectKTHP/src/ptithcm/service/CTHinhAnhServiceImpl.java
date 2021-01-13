package ptithcm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.CTHinhAnhDao;
import ptithcm.entity.CT_HinhAnh;

@Service
public class CTHinhAnhServiceImpl implements CTHinhAnhService{

	
	@Autowired
	private CTHinhAnhDao ctHinhAnhDao;
	
	@Override
	public List<CT_HinhAnh> getall(Integer id) {
		// TODO Auto-generated method stub
		return ctHinhAnhDao.getall(id);
	}

	@Override
	public boolean saveImg(CT_HinhAnh ctImg) {
		// TODO Auto-generated method stub
		return ctHinhAnhDao.saveImg(ctImg);
	}

	@Override
	public boolean updateImg(CT_HinhAnh ctImg) {
		// TODO Auto-generated method stub
		return ctHinhAnhDao.updateImg(ctImg);
	}

	@Override
	public boolean deleteImg(CT_HinhAnh ctImg) {
		// TODO Auto-generated method stub
		return ctHinhAnhDao.deleteImg(ctImg);
	}

	
}
