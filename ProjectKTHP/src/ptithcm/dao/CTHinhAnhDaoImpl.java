package ptithcm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.CT_HinhAnh;

@Transactional
@Repository
public class CTHinhAnhDaoImpl implements CTHinhAnhDao{

	@Autowired
	SessionFactory factory;
	
	List<CT_HinhAnh> list;
	
	@Override
	public List<CT_HinhAnh> getall(Integer id) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM CT_HinhAnh WHERE MaPhong = :id";
		Query query = session.createQuery(hql);
		query.setInteger("id", id);
        list = query.list();
        return list;
	}

	@Override
	public boolean saveImg(CT_HinhAnh ctImg) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        session.save(ctImg);
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
	public boolean updateImg(CT_HinhAnh ctImg) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        session.update(ctImg);
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
	public boolean deleteImg(CT_HinhAnh ctImg) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        session.delete(ctImg);
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

}
