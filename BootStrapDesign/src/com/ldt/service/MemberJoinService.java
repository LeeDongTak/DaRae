package com.ldt.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.ldt.common.MBUtils;
import com.ldt.dao.BMemberDAO;
import com.ldt.dto.BMember;

public class MemberJoinService implements Service {

	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("회원 가입정보를 등록합니다.....");
		request.setCharacterEncoding("UTF-8"); 
		String id = request.getParameter("mid"); 
		// 아이디 중복 체크
		SqlSession sqlSession = MBUtils.getSession();
		BMemberDAO dao = sqlSession.getMapper(BMemberDAO.class);
		BMember vo = dao.selectById(id); 
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter writer = response.getWriter(); 
		if(vo!=null) {
			writer.print(
				"<script><h1>중복된 아이디 입니다.</h1><a href='member	Join.jsp'>되돌아가기</a>"				
			);
		}else {
			try {
				vo = new BMember(); 
				vo.setMid(request.getParameter("mid")); 
				vo.setMname(request.getParameter("mname"));
				String pwd1 = request.getParameter("mpassword");
				String pwd2 = request.getParameter("mpassword2");
				if(pwd1.equals(pwd2)) {
					vo.setMpassword(pwd1); 
				}else {
					writer.print(
					"<script><h1>패스워드를 다시 입력하세요.</h1><a href='memberJoin.jsp'>되돌아가기</a>"
					);
				}
				vo.setMphone(request.getParameter("mphone"));
				vo.setMjoinDate(request.getParameter("mjoinDate")); 
				//dao = sqlSession.getMapper(BMemberDAO.class);
				dao.insert(vo);
				sqlSession.commit();// 빠트리지 마시압!
				sqlSession.close();
				// 다른 페이지로 넘길 정보를 session객체에 수록 
				HttpSession session = request.getSession(); 
				session.setAttribute("joinVo", vo);
				//----------------------------------------------------------
				//writer.print("<h1>축하합니다. 회원가입 되셨습니다.</h1>");
				writer.println("<script>alert('축하합니다. 회원가입 되셨습니다');</script>");
				//writer.print("<a href='memberJoin.jsp'>가입화면</a><br>");
				//writer.print("<a href='joinConfirm.do'>가입확인</a><hr>");
				response.sendRedirect("../index.jsp");
				
			} catch(Exception e) {
				e.printStackTrace();
				writer.println("<script>alert('회원가입에 실패하였습니다.');</script>");
				response.sendRedirect("../memberJoin.jsp");
				return false; 
			}
			
		}
		
		
		return true;
	}

}
