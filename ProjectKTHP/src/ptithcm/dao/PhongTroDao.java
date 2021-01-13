package ptithcm.dao;

import java.util.List;
import ptithcm.entity.PhongTro;
import ptithcm.entity.TaiKhoan;

public interface PhongTroDao {
	
	// load list theo Loai
    public List<PhongTro> getListByType(String loai);
    // load list theo DuongPho
    public List<PhongTro> getListByDuong(String maDuong);
    // load list theo Gia
    public List<PhongTro> getListByPrice(int gia);
    // load list theo DienTich
    public List<PhongTro> getListByDienTich(int dienTich);
    // load list theo tat ca lua chon
    public List<PhongTro> getListByQuery(String loai, String maDuong, int gia, int dienTich);
    // load list theo maUser
    public List<PhongTro> getListByUser(TaiKhoan User);
    // load list
    public List<PhongTro> getAll();
    // load list limit
    public List<PhongTro> getAllLimit();
    
    //load chi tiet
    public PhongTro getPhongTroById(Integer id);
    
    //xu ly save, update, delete
    public boolean saveDetail(PhongTro phongTro);
    
    public boolean updateDetail(PhongTro phongTro);
    
    public boolean deleteDetail(PhongTro phongTro);
}
