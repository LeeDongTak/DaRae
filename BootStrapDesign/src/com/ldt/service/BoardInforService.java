package com.ldt.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.ldt.common.MBUtils;
import com.ldt.dao.BoardDAO;
import com.ldt.dto.Board;

public class BoardInforService implements Service {
	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO 게시판의 모든 자료를 읽어 화면에 출력하고
		// 선택하여 게시글을 볼수 있게 하는 서비스
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		SqlSession sqlSession  = MBUtils.getSession(); 
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<Board> data =  dao.selectAll();
		sqlSession.close();
		session.setAttribute("boardList",data);
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("/board/boardDisplay.jsp");
		dispatcher.forward(request, response);
		return true;
	}
}