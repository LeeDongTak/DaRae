package com.ldt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ldt.service.AllHomeBookListService;
import com.ldt.service.AllMemberListService;
import com.ldt.service.BoardInforService;
import com.ldt.service.BoardReadService;
import com.ldt.service.BoardWriteService;
import com.ldt.service.HomeBookAdjustService;
import com.ldt.service.HomeBookInforService;
import com.ldt.service.HomeBookInsertService;
import com.ldt.service.JoinConfirmService;
import com.ldt.service.LoginService;
import com.ldt.service.LogoutService;
import com.ldt.service.MainService;
import com.ldt.service.MemberInforAdjustService;
import com.ldt.service.MemberInforService;
import com.ldt.service.MemberJoinService;
import com.ldt.service.Service;

@WebServlet("*.do")
public class MainControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public MainControl() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.request = request;
		this.response = response;
		actionDo();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.request = request;
		this.response = response;
		actionDo();
	}

	protected void actionDo() throws ServletException, IOException {
		System.out.println("Action do.......");
		String uri = request.getRequestURI();
		System.out.println(uri);
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		String command = uri.substring(contextPath.length());
		System.out.println(command);
		Service service = null;// 우리가 만든 인터페이스
		PrintWriter out = null;
		String id = (String) request.getSession().getAttribute("id");
		if (id == null) {
			id = "guest";
		}

		switch (command) {
		case "/login/login.do":
			System.out.println("formLogin.jsp에서 전달온 정보로\n" + "login.do를 처리합니다.");
			service = new LoginService();
			exe(service);
			break;

		case "/login/logout.do":
			System.out.println("logout.do를 처리합니다.");
			service = new LogoutService();
			exe(service);
			break;

		case "/mymember/memberjoin.do":
			System.out.println("memberJoin.jsp에서 전달온 정보로\n" + "memberjoin.do를 처리합니다.");
			service = new MemberJoinService();
			exe(service);
			break;

		case "/mymember/joinConfirm.do":
			System.out.println("joinConfirm.do를 처리합니다.");
			// 가입정보를 보여주고, 수정할게 있으면 수정하게
			// 그렇치 않으면 확인 버튼을 눌러 로그인 화면으로 넘어가게 하는 서비스
			service = new JoinConfirmService();
			exe(service);
			break;

		case "/main.do":
			System.out.println("main.do를 처리합니다.");
			service = new MainService();
			exe(service);
			break;
		case "/mymember/allMember.do":

			if (id.equals("admin")) {
				System.out.println("allMember.do를 처리합니다.");
				service = new AllMemberListService();
				exe(service);
			} else {
				response.setContentType("text/html;charset=UTF-8");
				out = response.getWriter();
				out.print("관리자만 볼 수 있습니다.<br>");
				out.print("<a href='../main.do'>메인</a>");
			}
			break;
		case "/homebook/homebook.do":
			System.out.println("homebook.do를 처리합니다.");
			service = new HomeBookInsertService();
			exe(service);
			break;
		case "/mymember/memberInfor.do":
			System.out.println("memberInfor.do를 처리합니다.");
			service = new MemberInforService();
			exe(service);
			break;

		case "/mymember/memberInforAdjust.do":
			System.out.println("memberInforAdjust.do를 처리합니다.");
			service = new MemberInforAdjustService();
			exe(service);
			break;

		case "/homebook/HomeBookInfor.do":
			System.out.println("HomeBookInfor.do를 처리합니다.");
			service = new HomeBookInforService();
			exe(service);
			break;

		case "/homebook/homebookAdjust.do":
			long no = Long.parseLong(request.getParameter("no"));
			System.out.println("homebookAdjust.do를 처리합니다." + no + "번");
			response.sendRedirect("./form_homebookAdjust.jsp?serialno=" + no);
			break;

		case "/homebook/adujustProc.do":
			System.out.println("깍꿍");
			service = new HomeBookAdjustService();
			exe(service);
			break;

		case "/homebook/allBook.do":
			if (id.equals("admin")) {
				System.out.println("allBook.do를 처리합니다.");
				service = new AllHomeBookListService();
				exe(service);
			} else {
				response.setContentType("text/html;charset=UTF-8");
				out = response.getWriter();
				out.print("관리자만 볼 수 있습니다.<br>");
				out.print("<a href='../main.do'>메인</a>");
			}
			break;
		case "/board/boardList.do":
			System.out.println(">>>>> 접속된 id >>>> :" + id);
			if (id == null || id.equals("guest")) {
				response.setContentType("text/html;charset=UTF-8");
				out = response.getWriter();
				out.print("로그인 후에 볼 수 있습니다.<br>");
				out.print("<a href='../login/formLogin.jsp'>로그인</a><br>");
				out.print("<a href='../mymember/memberJoin.jsp'>회원가입</a>");

			} else {
				System.out.println("boardList.do를 처리합니다.");
				service = new BoardInforService();
				exe(service);
			}

			break;
		case "/board/boardRead.do":
			long bno = Long.parseLong(request.getParameter("bno"));
			System.out.println("boardRead.do를 처리합니다." + bno + "번");
			service = new BoardReadService();// hit수 증가
			exe(service);

			response.sendRedirect("./boardRead.jsp?bno=" + bno);
			break;

		case "/board/boardWrite.do":
			System.out.println("boardWrite.do를 처리합니다.");
			service = new BoardWriteService();
			exe(service);

			break;

		}
	}

	private void exe(Service service) {
		try {
			service.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
