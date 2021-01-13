package ptithcm.dao;

import java.util.List;

import ptithcm.entity.QuanHuyen;


public interface QuanHuyenDao {

	// find by id
    public QuanHuyen findById(String maQuan);

    // load list theo TP
    public List<QuanHuyen> getListByTP(String maTP);
    
    // load all
    public List<QuanHuyen> getAll();
}
