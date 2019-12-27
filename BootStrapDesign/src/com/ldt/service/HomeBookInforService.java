package com.ldt.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;

import com.ldt.common.MBUtils;
import com.ldt.dao.HomeBookDAO;
import com.ldt.dto.HomeBook;

public class HomeBookInforService implements Service {

	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RequestDispatcher dispatcher = 
			request.getRequestDispatcher("/homebook/datadisp2.jsp"); 
		dispatcher.forward(request,response);
		return true;
	}

}
