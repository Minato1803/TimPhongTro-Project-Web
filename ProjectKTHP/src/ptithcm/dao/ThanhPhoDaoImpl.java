package ptithcm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.ThanhPho;

@Transactional
@Repository
public class ThanhPhoDaoImpl implements ThanhPhoDao{

	@Autowired
	SessionFactory factory;
	List<ThanhPho> list;
	
	@Override
	public ThanhPho findById(String maTP) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        Query query = session.createQuery("FROM ThanhPho WHERE MaTP = :maTP");
		        query.setString("maTP", maTP);
		        ThanhPho obj = (ThanhPho) query.uniqueResult();
		        t.commit();
		        return obj;
		    } catch (Exception ex) {
		        if (t != null) {
		            t.rollback();
		        }
		        ex.printStackTrace();
		    } finally {
		        session.flush();
		        session.close();
		    }
		return null;
	}

	@Override
	public List<ThanhPho> getAll() {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM ThanhPho";
		Query query = session.createQuery(hql);
		list =  query.list();
            return list;
	}

}
