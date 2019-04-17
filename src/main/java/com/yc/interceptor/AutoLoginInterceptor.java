package com.yc.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yc.dao.UserMapper;
import com.yc.po.User;
/**
 * 自动登录的拦截器
 * @author Administrator
 *
 */
public class AutoLoginInterceptor extends HandlerInterceptorAdapter{
	
	//业务对象
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 在执行目标方法之前执行
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//获取cookie信息
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for (Cookie cookie : cookies) {
				if("usercode".equals(cookie.getName())){
					//获取用户编号
					String usercode = cookie.getValue();
					System.out.println(usercode);
					//查询用户信息
					User user = userMapper.SelectByUserCode(usercode);
					System.out.println(user);
					if(user != null){
						request.getSession(true).setAttribute("user",user);
						System.out.println(3);
						response.sendRedirect(request.getContextPath()+"/user/frame");
						return false;
					}
				}
			}
		}
		return true;
	}
	
	/**
	 * 这个方法在DispatcherServlet完全处理请求后执行，可以用来一个资源清理的操作
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	/**
	 * 在执行目标方法之后与渲染视图之前执行
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
