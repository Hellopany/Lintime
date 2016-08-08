package cn.kepu.ability.common.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.common.dao.StaticsDao;
import cn.kepu.ability.common.dao.TransMessageDao;
import cn.kepu.base.dao.DaoSupport;
import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.bean.Statics;

@Repository("staticsDao")
public class StaticsDaoImpl extends DaoSupport<Statics> implements StaticsDao {
	
	@SuppressWarnings("unchecked")
	@Override
	public List getDataHql(int pageNo,int pageSize,String schoolid,String careertype,String year) {
		final int start = (pageNo-1)*pageSize;
		int end = start+pageSize;
		final int len = pageSize;
		String hql = "SELECT s.id,s.name FROM Student s";
		if (careertype!=null&&!careertype.equals("")){
			hql += ",StudentCareer sc";
		}
		if (year!=null&&!year.equals("")){
			hql += ",StudentSchoolRoll ss";
		}
		hql += " WHERE 1=1 ";  
		if (careertype!=null&&!careertype.equals("")){
			hql += " and s.id=sc.studentid and sc.careertype='"+careertype+"'";
		}
		if (year!=null&&!year.equals("")){
			String syear =year+"-01-01"; 
			hql += " and s.id=ss.studentid AND ss.freedate>='"+syear+"'";
			String eyear =year+"-12-31"; 
			hql += " AND ss.freedate<='"+eyear+"'";
		}
		if(schoolid!=null&&!schoolid.equals("")){
			hql += " AND s.schoolid="+schoolid;
		}
		hql += " order by s.id";
		final String newhql = hql;
		List<Object> list =  (List<Object>) (getTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
			throws HibernateException, SQLException {
				Query query = session.createQuery(newhql);
				query.setFirstResult(start);
				query.setMaxResults(len);
				return query.list();
			}
		}));
		
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public long getDataHqlCount(int pageNo,int pageSize,String schoolid,String careertype,String year) {

		String hql = "SELECT count(*) FROM Student s";
		if (careertype!=null&&!careertype.equals("")){
			hql += ",StudentCareer sc";
		}
		if (year!=null&&!year.equals("")){
			hql += ",StudentSchoolRoll ss";
		}
		hql += " WHERE 1=1 ";  
		if (careertype!=null&&!careertype.equals("")){
			hql += " and s.id=sc.studentid and sc.careertype='"+careertype+"'";
		}
		if (year!=null&&!year.equals("")){
			String syear =year+"-01-01"; 
			hql += " and s.id=ss.studentid AND ss.freedate>='"+syear+"'";
			String eyear =year+"-12-31"; 
			hql += " AND ss.freedate<='"+eyear+"'";
		}
		if(schoolid!=null&&!schoolid.equals("")){
			hql += " AND s.schoolid="+schoolid;
		}
		hql += " order by s.id ";
		final String newhql = hql;
		long count =  getTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
			throws HibernateException, SQLException {
				Query query = session.createQuery(newhql);
				return query.list().get(0);
			}
		});
		
		return count;
	}

	@Override
	public List getSchoolStudents(String schoolid,String careertype, String year) {
		String hql = "SELECT ssr.school,count(*) FROM StudentSchoolRoll ssr ";

		if (careertype!=null&&!careertype.equals("")){
			hql += " ,StudentCareer sc ";
		}
		hql += " WHERE 1=1 ";  
		if (year!=null&&!year.equals("")){
			String syear =year+"-01-01"; 
			hql += " AND ssr.freedate>='"+syear+"'";
			String eyear =year+"-12-31"; 
			hql += " AND ssr.freedate<='"+eyear+"'";
		}
		if(schoolid!=null&&!schoolid.equals("")){
			hql += " AND ssr.school="+schoolid;
		}
		if (careertype!=null&&!careertype.equals("")){
			hql += " and sc.studentid=ssr.studentid and sc.careertype='"+careertype+"'";
		}
		hql += " group by ssr.school order by ssr.school";
		final String newhql = hql;
		List<Object> list =  (List<Object>) (getTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
			throws HibernateException, SQLException {
				Query query = session.createQuery(newhql);
				return query.list();
			}
		}));
		
		return list;
	}

	@Override
	public List getStudentsWorkTypes(String schoolid, String careertype,
			String year) {
		String hql = "SELECT ss.id,sc.careertype,sc.corporationname,count(*) FROM Student s,StudentCareer sc,School ss ";

		if (year!=null&&!year.equals("")){
			hql += ",StudentSchoolRoll ssr ";
		}
		hql += " WHERE s.schoolid=ss.id and s.id=sc.studentid ";  
		if (year!=null&&!year.equals("")){
			String syear =year+"-01-01"; 
			hql += "  and s.id=ssr.studentid  AND ssr.freedate>='"+syear+"'";
			String eyear =year+"-12-31"; 
			hql += " AND ssr.freedate<='"+eyear+"'";
		}
		if (careertype!=null&&!careertype.equals("")){
			hql += " and sc.careertype='"+careertype+"'";
		}
		if(schoolid!=null&&!schoolid.equals("")){
			hql += " AND ssr.school="+schoolid;
		}
		hql += " group by ss.id,sc.careertype,sc.corporationname order by ss.id";
		final String newhql = hql;
		List<Object> list =  (List<Object>) (getTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
			throws HibernateException, SQLException {
				Query query = session.createQuery(newhql);
				return query.list();
			}
		}));
		
		return list;
	}
	
	
}
