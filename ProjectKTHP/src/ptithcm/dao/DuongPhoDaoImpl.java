package ptithcm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.DuongPho;


@Transactional
@Repository
public class DuongPhoDaoImpl implements DuongPhoDao{

	@Autowired
	SessionFactory factory;
	List<DuongPho> list;
	
	@Override
	public DuongPho findById(String maDuong) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM DuongPho WHERE MaDuong = :maDuong";
		Query query = session.createQuery(hql);
		query.setString("maDuong", maDuong);
        DuongPho obj = (DuongPho) query.uniqueResult();
        return obj;
	}

	@Override
	public List<DuongPho> getListByQuan(String maQuan) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM DuongPho WHERE MaQuan = :maQuan";
		Query query = session.createQuery(hql);
        query.setString("maQuan", maQuan);
        list = query.list();
        return list;
	}

	@Override
	public List<DuongPho> getAll() {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM DuongPho";
		Query query = session.createQuery(hql);
        list = query.list();
        return list;
	}

}
