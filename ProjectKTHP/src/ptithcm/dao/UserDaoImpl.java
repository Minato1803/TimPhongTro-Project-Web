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
public class UserDaoImpl implements UserDao{

	@Autowired
	SessionFactory factory;
	List<TaiKhoan> list;
	
	@Override
	public boolean register(TaiKhoan user) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        session.save(user);
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
	public TaiKhoan loginByUname(String uname, String pass) {
		// TODO Auto-generated method stub
        Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        String hql = "FROM TaiKhoan WHERE Username = :uname AND Password = :pass";
				Query query = session.createQuery(hql);
		        query.setString("uname", uname);
		        query.setString("pass", pass);
		        TaiKhoan obj = (TaiKhoan) query.uniqueResult();
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
	public TaiKhoan loginBySdt(String sdt, String pass) {
		// TODO Auto-generated method stub
        Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        String hql = "FROM TaiKhoan WHERE SDT = :sdt AND Password = :pass";
				Query query = session.createQuery(hql);
		        query.setString("sdt", sdt);
		        query.setString("pass", pass);
		        TaiKhoan obj = (TaiKhoan) query.uniqueResult();
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
	public TaiKhoan forgotPass(String email) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        String hql = "FROM TaiKhoan WHERE EmailLienHe = :email";
				Query query = session.createQuery(hql);
		        query.setString("email", email);
		        TaiKhoan obj = (TaiKhoan) query.uniqueResult();
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
	public boolean updateUser(TaiKhoan user) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = null;
		try {
		        t = session.beginTransaction();
		        session.update(user);
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
	public boolean findbysdt(String sdt) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM TaiKhoan WHERE SDT = :sdt";
		Query query = session.createQuery(hql);
        query.setString("sdt", sdt);
        list = query.list();
        if(list.size()!= 0)
        {
        	return true;
        }
        else
        {
        	return false;
        }
	}

	@Override
	public TaiKhoan getbysdt(String sdt) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM TaiKhoan WHERE SDT = :sdt";
		Query query = session.createQuery(hql);
        query.setString("sdt", sdt);
        TaiKhoan obj = (TaiKhoan) query.uniqueResult();
        return obj;
	}

	@Override
	public boolean findbyEmail(String email) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM TaiKhoan WHERE EmailLienHe = :email";
		Query query = session.createQuery(hql);
        query.setString("email", email);
        list = query.list();
        if(list.size()!= 0)
        	return true;
        else
        	return false;
	}

	@Override
	public boolean findbyUserName(String userName) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		String hql = "FROM TaiKhoan WHERE Username = :userName";
		Query query = session.createQuery(hql);
        query.setString("userName", userName);
        list = query.list();
        if(list.size()!= 0)
        	return true;
        else
        	return false;
	}

}
