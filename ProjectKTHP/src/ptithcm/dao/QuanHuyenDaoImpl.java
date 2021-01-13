package ptithcm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.QuanHuyen;

@Transactional
@Repository
public class QuanHuyenDaoImpl implements QuanHuyenDao{

	@Autowired
	SessionFactory factory;
	List<QuanHuyen> list;
	
	@Override
	public QuanHuyen findById(String maQuan) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM QuanHuyen WHERE MaQuan = :maQuan";
		Query query = session.createQuery(hql);
		query.setString("maQuan", maQuan);
        QuanHuyen obj = (QuanHuyen) query.uniqueResult();
        return obj;
	}

	@Override
	public List<QuanHuyen> getListByTP(String maTP) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM QuanHuyen WHERE MaTP = :maTP";
		Query query = session.createQuery(hql);
        query.setString("maTP", maTP);
        list = query.list();
        return list;
	}

	@Override
	public List<QuanHuyen> getAll() {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM QuanHuyen";
		Query query = session.createQuery(hql);
        list = query.list();
        return list;
	}
}
