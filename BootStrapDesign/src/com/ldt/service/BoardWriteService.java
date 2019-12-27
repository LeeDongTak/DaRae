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

public class BoardWriteService implements Service {
	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO 게시글 등록하는 작업  
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		SqlSession sqlSession  = MBUtils.getSession(); 
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Board vo =  new Board();
		/*
			private long bno;//게시판번호
			private String mid;//등록회원 아이디
			private String btitle;//게시글 제목
			private String bcontent;//게시글 내용
			private String bdate;// 게시일자
			private int bhit;// 조회수
			private int bgroup;// 게시글 그룹
			private int bstep;// 댓글 스탭(게시순서)
			private int bindent; // 들여쓰기 정보 
		*/
		vo.setMid(request.getParameter("mid"));
		vo.setBtitle(request.getParameter("btitle"));
		vo.setBcontent(request.getParameter("bcontent"));
		vo.setBdate(request.getParameter("bdate").substring(0,10));
		vo.setBhit(0);
		//vo.setBgroup(); // 좀있다가 정함 먼저 본글이 등록된 후 그 글번호를 읽어와야함 
		vo.setBstep(0);//그룹에서 제일 먼져 출력 
		vo.setBindent(0);// 본글이어서 들여 쓰기 없음 
		dao.insert(vo);
		long bno =  dao.maxIdNum();
		vo = dao.selectById(bno);
		vo.setBdate(vo.getBdate().substring(0,10));
		vo.setBgroup((int)bno);
		dao.update(vo);
		sqlSession.commit();
		sqlSession.close();
				
		response.sendRedirect("./boardRead.jsp?bno=" + bno);
		return true;
	}
}