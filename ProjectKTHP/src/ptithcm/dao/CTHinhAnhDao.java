package ptithcm.dao;

import java.util.List;

import ptithcm.entity.CT_HinhAnh;

public interface CTHinhAnhDao {
	 
	public List<CT_HinhAnh> getall(Integer id);
	    
	public boolean saveImg(CT_HinhAnh ctImg);
	    
	public boolean updateImg(CT_HinhAnh ctImg);
	    
	public boolean deleteImg(CT_HinhAnh ctImg);
}
