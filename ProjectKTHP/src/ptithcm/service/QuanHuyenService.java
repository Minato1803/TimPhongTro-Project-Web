package ptithcm.service;

import java.util.List;

import ptithcm.entity.QuanHuyen;

public interface QuanHuyenService {
	
		//tìm theo ID
		public QuanHuyen findById(String maQuan);
		//load list theo TP
		public List<QuanHuyen> getListByTP(String maTP);
		//load all
		public List<QuanHuyen> getAll();
}
