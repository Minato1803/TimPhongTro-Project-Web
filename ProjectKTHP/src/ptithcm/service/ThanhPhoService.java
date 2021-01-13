package ptithcm.service;

import java.util.List;

import ptithcm.entity.ThanhPho;

public interface ThanhPhoService {
	
	//tìm theo ID
	public ThanhPho findById(String maTP);
	//load list
	public List<ThanhPho> getAll();
	
}
