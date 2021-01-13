package ptithcm.dao;


import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import ptithcm.entity.PhongTro;
import ptithcm.entity.TaiKhoan;



@Transactional
@Repository
public class PhongTroDaoImpl implements PhongTroDao{

	@Autowired
	SessionFactory factory;
	
	List<PhongTro> list;
	
	@Override
	public List<PhongTro> getListByType(String loai) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM PhongTro WHERE Loai = :loai";
		Query query = session.createQuery(hql);
        query.setString("loai", loai);
        list = query.list();
        return list;
	}
	@Override
	public List<PhongTro> getListByDuong(String maDuong) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM PhongTro WHERE MaDuong = :maDuong";
		Query query = session.createQuery(hql);
        query.setString("maDuong", maDuong);
        list = query.list();
        return list;
	}

	@Override
	public List<PhongTro> getListByPrice(int gia) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM PhongTro WHERE GiaThue BETWEEN :min AND :max";
		Query query = session.createQuery(hql);
        switch(gia)
        {
        	case 1:
        	{
        		query.setFloat("min", (float) 0.5);
        		query.setFloat("max", 2);
        		break;
        	}
        	case 2:
        	{
        		query.setFloat("min", 2);
        		query.setFloat("max", 5);
        		break;
        	}
        	case 3:
        	{
        		query.setFloat("min", 5);
        		query.setFloat("max", 10);
        		break;
        	}
        	case 4:
        	{
        		query.setFloat("min", 10);
        		query.setFloat("max", 100);
        		break;
        	}
        }
        list = query.list();
        return list;
	}

	@Override
	public List<PhongTro> getListByDienTich(int dienTich) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM PhongTro WHERE DienTich BETWEEN :min AND :max";
		Query query = session.createQuery(hql);
		switch(dienTich)
        {
        	case 1:
        	{
        		query.setInteger("min", 5);
        		query.setInteger("max", 20);
        		System.out.println("dientich: 5-20");
        		break;
        	}
        	case 2:
        	{
        		query.setInteger("min", 20);
        		query.setInteger("max", 50);
        		break;
        	}
        	case 3:
        	{
        		query.setInteger("min", 50);
        		query.setInteger("max", 70);
        		break;
        	}
        	case 4:
        	{
        		query.setInteger("min", 70);
        		query.setInteger("max", 1000);
        		break;
        	}
        }
        list = query.list();
        return list;
	}
	
	@Override
	public List<PhongTro> getListByUser(TaiKhoan User) {
		// TODO Auto-generated method stub
		int maUser = User.getMaUser();
		Session session =factory.getCurrentSession();
		String hql = "FROM PhongTro WHERE MaUser = :maUser ORDER BY MaPhong DESC";
		Query query = session.createQuery(hql);
		query.setInteger("maUser", maUser);
        list = query.list();
        return list;
	}
	
	@Override
	public List<PhongTro> getAll() {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM PhongTro";
		Query query = session.createQuery(hql);
        list = query.list();
        return list;
	}
	
	@Override
	public List<PhongTro> getAllLimit() {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM PhongTro";
		Query query = session.createQuery(hql);
		query.setMaxResults(10);
        list = query.list();
        return list;
	}
	
	@Override
	public List<PhongTro> getListByQuery(String loai, String maDuong, int gia, int dienTich) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM PhongTro WHERE Loai = :loai AND MaDuong = :maDuong AND GiaThue BETWEEN :minG AND :maxG AND DienTich BETWEEN :minD AND :maxD";
		Query query = session.createQuery(hql);
		query.setString("loai", loai);
        query.setString("maDuong", maDuong);
        switch(gia)
        {
        	case 1:
        	{
        		query.setFloat("minG", (float) 0.5);
        		query.setFloat("maxG", 2);
        		break;
        	}
        	case 2:
        	{
        		query.setFloat("minG", 2);
        		query.setFloat("maxG", 5);
        		break;
        	}
        	case 3:
        	{
        		query.setFloat("minG", 5);
        		query.setFloat("maxG", 10);
        		break;
        	}
        	case 4:
        	{
        		query.setFloat("minG", 10);
        		query.setFloat("maxG", 100);
        		break;
        	}
        }
        switch(dienTich)
        {
        	case 1:
        	{
        		query.setInteger("minD", 5);
        		query.setInteger("maxD", 20);
        		System.out.println("dientich: 5-20");
        		break;
        	}
        	case 2:
        	{
        		query.setInteger("minD", 20);
        		query.setInteger("maxD", 50);
        		break;
        	}
        	case 3:
        	{
        		query.setInteger("minD", 50);
        		query.setInteger("maxD", 70);
        		break;
        	}
        	case 4:
        	{
        		query.setInteger("minD", 70);
        		query.setInteger("maxD", 1000);
        		break;
        	}
        }
        list = query.list();
        return list;
	}
	@Override
	public PhongTro getPhongTroById(Integer id) {
		Session session =factory.getCurrentSession();
		String hql = "FROM PhongTro WHERE MaPhong = :id";
		Query query = session.createQuery(hql);
		query.setInteger("id", id);
		PhongTro obj = (PhongTro) query.uniqueResult();
        return obj;
	}
	@Override
	public boolean saveDetail(PhongTro phongTro) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        session.save(phongTro);
		        t.commit();
		        return true;
		    } catch (Exception ex) {
		        if (t != null) {
		            t.rollback();
		        }
		        ex.printStackTrace();
		    } finally {
		        session.flush();
		        session.close();
		    }
		return false;
	}
	@Override
	public boolean updateDetail(PhongTro phongTro) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        session.update(phongTro);
		        t.commit();
		        return true;
		    } catch (Exception ex) {
		        if (t != null) {
		            t.rollback();
		        }
		        ex.printStackTrace();
		    } finally {
		        session.flush();
		        session.close();
		    }
		return false;
	}
	@Override
	public boolean deleteDetail(PhongTro phongTro) {
		// TODO Auto-generated method stub
		System.out.println("doDelete");
		Session session = null;
//		session = factory.openSession();
//		Transaction t = null;
//		try {
//		        t = session.beginTransaction();
//		        session.delete(phongTro);
//		        t.commit();
//		        return true;
//		    } catch (Exception ex) {
//		        if (t != null) {
//		            t.rollback();
//		        }
//		        ex.printStackTrace();
//		    } finally {
//		        session.flush();
//		        session.close();
//		    }
//		return false;
		try {
			session = factory.getCurrentSession();
			session.delete(phongTro);
			return true;
		}
		catch(Exception ex){
			  ex.printStackTrace();
		}
		finally {
	        session.flush();
	        session.clear();
	    }
		return false;
	}
	

}
