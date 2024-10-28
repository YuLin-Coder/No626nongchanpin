package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


/**
 * A data access object (DAO) providing persistence and search support for Txl
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 数据库公共管理类
 * @see com.cz.entity.Txl
 * @author MyEclipse Persistence Tools
 */

public class CommonDAO extends HibernateDaoSupport {
	//获取日志对象
	private static final Log log = LogFactory.getLog(CommonDAO.class);
	
	protected void initDao() {
		// do nothing
	}
//保存对象
	public void save(Object transientInstance) {
		try {
			//调用模板对象保存实体对象
			getHibernateTemplate().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}
//删除对象
	public void delete(Object persistentInstance) {
		try {
			getHibernateTemplate().delete(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}
//通过id查询对象
	public Object findById(int id,String entity) {
		try {
			Object instance =  getHibernateTemplate().get("com.model."+entity, id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	//通过id查询对象
	public Object findById(String id,String entity) {
		try {
			Object instance =  getHibernateTemplate().get("com.model."+entity, Integer.parseInt(id) );
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}


	
	//查询对象
	public List findByHql(String hql) {
	try {
			return getHibernateTemplate().find(hql);
		} catch (RuntimeException re) {
			throw re;
		}
	}
	//查询分页对象
	public List findByHql(String hql,int dpage,int rows) {
		try {
			List list = getHibernateTemplate().find(hql);
			List mlist=new ArrayList();
			try{
				int min = (dpage-1)*rows;
				int max = dpage*rows;
				
				for(int i=0;i<list.size();i++)
				{
					
					if(!(i<min||i>(max-1)))
					{
					mlist.add(list.get(i));
					}
				}
			}catch(RuntimeException re){
				re.printStackTrace();
				throw re;
			}
			return mlist;
		} catch (RuntimeException re) {
			throw re;
		}
	}
//修改对象信息
	public Object update(Object detachedInstance) {
		try {
			 getHibernateTemplate().merge(detachedInstance);
			return null;
		} catch (RuntimeException re) {
			throw re;
		}
	}
//根据id删除
	public void delete(int id,String entity) {
		System.out.println("cc="+id);
		try {
			getHibernateTemplate().delete(getHibernateTemplate().get("com.model."+entity, id));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	//根据id删除
	public void delete(String  id,String entity) {
		System.out.println("cc="+id);
		try {
			getHibernateTemplate().delete(getHibernateTemplate().get("com.model."+entity, Integer.parseInt(id) ));
		} catch (RuntimeException re) {
			throw re;
		}
	}


	public static CommonDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CommonDAO) ctx.getBean("CommonDAO");
	}
}