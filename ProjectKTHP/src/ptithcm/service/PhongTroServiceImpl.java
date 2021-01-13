package ptithcm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.PhongTroDao;
import ptithcm.entity.PhongTro;
import ptithcm.entity.TaiKhoan;

@Service
public class PhongTroServiceImpl implements PhongTroService{

	@Autowired
	private PhongTroDao phongTroDao;
	@Override
	public List<PhongTro> getListByType(String loai) {
		// TODO Auto-generated method stub
		return phongTroDao.getListByType(loai);
	}

	@Override
	public List<PhongTro> getListByDuong(String maDuong) {
		// TODO Auto-generated method stub
		return phongTroDao.getListByDuong(maDuong);
	}

	@Override
	public List<PhongTro> getListByPrice(int gia) {
		// TODO Auto-generated method stub
		return phongTroDao.getListByPrice(gia);
	}

	@Override
	public List<PhongTro> getListByDienTich(int dienTich) {
		// TODO Auto-generated method stub
		return phongTroDao.getListByDienTich(dienTich);
	}

	@Override
	public List<PhongTro> getAll() {
		// TODO Auto-generated method stub
		return phongTroDao.getAll();
	}

	@Override
	public List<PhongTro> getAllLimit() {
		// TODO Auto-generated method stub
		return phongTroDao.getAllLimit();
	}
	@Override
	public List<PhongTro> getListByQuery(String loai, String maDuong, int gia, int dienTich) {
		// TODO Auto-generated method stub
		return phongTroDao.getListByQuery(loai, maDuong, gia, dienTich);
	}

	@Override
	public PhongTro getPhongTroById(Integer id) {
		// TODO Auto-generated method stub
		return phongTroDao.getPhongTroById(id);
	}

	@Override
	public boolean saveDetail(PhongTro phongTro) {
		// TODO Auto-generated method stub
		return phongTroDao.saveDetail(phongTro);
	}

	@Override
	public boolean updateDetail(PhongTro phongTro) {
		// TODO Auto-generated method stub
		return phongTroDao.updateDetail(phongTro);
	}

	@Override
	public boolean deleteDetail(PhongTro phongTro) {
		// TODO Auto-generated method stub
		return phongTroDao.deleteDetail(phongTro);
	}

	@Override
	public List<PhongTro> getListByUser(TaiKhoan User) {
		// TODO Auto-generated method stub
		return phongTroDao.getListByUser(User);
	}

	

}
