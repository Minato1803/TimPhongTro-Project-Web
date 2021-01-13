package ptithcm.dao;

import java.util.List;

import ptithcm.entity.ThanhPho;

public interface ThanhPhoDao {
	
	//tìm theo ID
	public ThanhPho findById(String maTP);
	//load list
	public List<ThanhPho> getAll();

}
