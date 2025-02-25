/**
 * 2012-03-16
 */
package com.dcits.platform.listener;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;


/**
 * <ul>
 * 	<li> Session Listener </li>
 *  <li> 监测用户Session是否超时,超时自动销毁Session </li>
 * </ul>
 * @author
 * @date 
 */
public class UserSessionListener implements HttpSessionListener {

	private Logger logger = LoggerFactory.getLogger(UserSessionListener.class);
	
	/**
	 * Default constructor.
	 */
	public UserSessionListener() {

	}

	/**
	 * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
	 */
	public void sessionCreated(HttpSessionEvent event) {

	}

	/**
	 * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
	 */
	public void sessionDestroyed(HttpSessionEvent event) {
		Session session = Jurisdiction.getSession();
		synchronized(session){
			User user = (User) session.getAttribute(Const.SESSION_USER);
			logger.debug("====>User Session:[" + user + "]<====");
			try{
				if (user != null) {
					String USERID = user.getUSER_ID();
					session.removeAttribute(USERID+Const.SESSION_LoginInfo);
					session.removeAttribute(Const.SESSION_USER);
					session.removeAttribute(USERID+Const.SESSION_ORG);
			    	session.removeAttribute(USERID+Const.SESSION_ORGS);
					session.removeAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
					session.removeAttribute(USERID+Const.SESSION_menuList);
					session.removeAttribute(USERID+Const.SESSION_QX);
					session.removeAttribute(USERID+Const.SESSION_userpds);
					session.removeAttribute(USERID+Const.SESSION_USERNAME);
					session.removeAttribute(USERID+Const.SESSION_USERROL);
					session.removeAttribute("changeMenu");
					//shiro销毁登录
					Subject subject = SecurityUtils.getSubject(); 
					subject.logout();

//					String userCode = userSession.getUser().getUserCode();
//
//					logger.debug("====>User Session Listener UserCode:[" + userCode + "]<====");
//					Map<String, HttpSession> sessionMap = sc.getSessionMap();
//					Map<String, String> sessionIdMap = sc.getSessionIdMap();
//					if(sessionIdMap.containsKey(userCode)){
//						String sessionId = sessionIdMap.get(userCode);
//						logger.debug("====>SessionIdMap SessionId:["+sessionId+"]<====");
//						logger.debug("====>HttpSession SessionId:["+session.getId()+"]<====");
//						//session = sessionMap.get(sessionId);
//						sessionMap.remove(sessionId);
//						sessionIdMap.remove(userCode);
//						Map<String, String> map = new HashMap<String, String>();
//						map.put("userCode", userCode);
//						if(session != null){
//							session.removeAttribute("userInfo");
//							session = null;
//						}
//					}
					
					logger.debug("====>Remove User Session Success !!!<====");
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		logger.debug("====>User Session Destroyed !!!<====");
	}
}
