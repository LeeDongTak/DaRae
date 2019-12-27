package com.ldt.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.ldt.common.MBUtils;
import com.ldt.dao.BMemberDAO;
import com.ldt.dto.BMember;
public class LoginService implements Service {
	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8"); 
		String id = request.getParameter("id"); 
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		SqlSession sqlSession = MBUtils.getSession();
		BMemberDAO dao = sqlSession.getMapper(BMemberDAO.class);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		BMember mem = null; 
		try {
			mem = dao.selectById(id);
			if(mem.getMpassword().equals(password)) {
				writer.print("로그인 성공");
				session.setAttribute("id",id); 
				session.setAttribute("name",mem.getMname()); 
				session.setAttribute("pw",password); 
				session.setAttribute("loginOk","ok"); 
				String main = request.getContextPath(); 
				response.sendRedirect("../index.jsp");
			}else {
				writer.println("<script>alert('로그인 실패!!');</script>");
				writer.println("<script>location.href='formLogin.jsp';</script>");	
				System.out.println("로그인 실패");
			}
		}catch(Exception e) {
			writer.println("<script>alert('로그인 실패!!');</script>");
			writer.println("<script>location.href='formLogin.jsp';</script>");	
			System.out.println("로그인 실패");
		}
		
		return true;
	}

}
