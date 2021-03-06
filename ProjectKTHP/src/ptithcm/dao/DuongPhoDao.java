package ptithcm.dao;

import java.util.List;

import ptithcm.entity.DuongPho;

public interface DuongPhoDao {
	// find by id
    public DuongPho findById(String maDuong);

    // load list theo Quan
    public List<DuongPho> getListByQuan(String maQuan);
    
    // load all
    public List<DuongPho> getAll();
}
