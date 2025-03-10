//package com.dcits.common;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.apache.ibatis.session.ExecutorType;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.dcits.platform.dao.DAO;
///**
// * @author meng.chunxia  
// * @since 20170208
// */
//@Repository("daoSupportcip")
//public class DaoSupportcip implements DAO {
//
//	@Resource(name = "sqlSessionTemplate_cip")
//	private SqlSessionTemplate sqlSessionTemplatecip;
//	
//	/**
//	 * 保存对象
//	 * @param str
//	 * @param obj
//	 * @return
//	 * @throws Exception
//	 */
//	public Object save(String str, Object obj) throws Exception {
//		return sqlSessionTemplatecip.insert(str, obj);
//	}
//	
//	/**
//	 * 批量更新
//	 * @param str
//	 * @param obj
//	 * @return
//	 * @throws Exception
//	 */
//	public Object batchSave(String str, List objs )throws Exception{
//		return sqlSessionTemplatecip.insert(str, objs);
//	}
//	
//	/**
//	 * 修改对象
//	 * @param str
//	 * @param obj
//	 * @return
//	 * @throws Exception
//	 */
//	public Object update(String str, Object obj) throws Exception {
//		return sqlSessionTemplatecip.update(str, obj);
//	}
//
//	/**
//	 * 批量更新
//	 * @param str
//	 * @param obj
//	 * @return
//	 * @throws Exception
//	 */
//	public void batchUpdate(String str, List objs )throws Exception{
//		SqlSessionFactory sqlSessionFactory = sqlSessionTemplatecip.getSqlSessionFactory();
//		//批量执行器
//		SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH,false);
//		try{
//			if(objs!=null){
//				for(int i=0,size=objs.size();i<size;i++){
//					sqlSession.update(str, objs.get(i));
//				}
//				sqlSession.flushStatements();
//				sqlSession.commit();
//				sqlSession.clearCache();
//			}
//		}finally{
//			sqlSession.close();
//		}
//	}
//	
//	/**
//	 * 批量删除
//	 * @param str
//	 * @param obj
//	 * @return
//	 * @throws Exception
//	 */
//	public Object batchDelete(String str, List objs )throws Exception{
//		return sqlSessionTemplatecip.delete(str, objs);
//	}
//	
//	/**
//	 * 删除对象 
//	 * @param str
//	 * @param obj
//	 * @return
//	 * @throws Exception
//	 */
//	public Object delete(String str, Object obj) throws Exception {
//		return sqlSessionTemplatecip.delete(str, obj);
//	}
//	 
//	/**
//	 * 查找对象
//	 * @param str
//	 * @param obj
//	 * @return
//	 * @throws Exception
//	 */
//	public Object findForObject(String str, Object obj) throws Exception {
//		return sqlSessionTemplatecip.selectOne(str, obj);
//	}
//
//	/**
//	 * 查找对象
//	 * @param str
//	 * @param obj
//	 * @return
//	 * @throws Exception
//	 */
//	public Object findForList(String str, Object obj) throws Exception {
//		return sqlSessionTemplatecip.selectList(str, obj);
//	}
//	/**
//	 * 查找对象
//	 * @param str
//	 * @return
//	 * @throws Exception
//	 */
//	public Object findForList(String str) throws Exception {
//		return sqlSessionTemplatecip.selectList(str);
//	}
//	/**
//	 * 查找对象
//	 * @param str
//	 * @param obj
//	 * @param key
//	 * @param value
//	 * @return
//	 * @throws Exception
//	 */
//	public Object findForMap(String str, Object obj, String key, String value) throws Exception {
//		return sqlSessionTemplatecip.selectMap(str, obj, key);
//	}
//}
//
//
