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

public class BoardReadService implements Service {
	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO 조회수 증가시키는 작업 
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		Long bno = Long.parseLong(request.getParameter("bno"));
		SqlSession sqlSession  = MBUtils.getSession(); 
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Board vo =  dao.selectById(bno);
		int bhit = vo.getBhit();
		String bdate = vo.getBdate().substring(0,10);
		vo.setBhit(bhit+1);
		vo.setBdate(bdate);
		dao.update(vo);
		sqlSession.commit();
		sqlSession.close();
		//
		return true;
	}
}