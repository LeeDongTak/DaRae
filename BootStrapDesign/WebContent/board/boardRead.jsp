<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ldt.dto.*" %>
<%@ page import="com.ldt.dao.*" %>
<%@ page import="com.ldt.common.*" %>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="../css/resume.min.css">
	
	
	<!-- Bootstrap core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom fonts for this template -->
	<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../vndor/devicons/css/devicons.min.css" rel="stylesheet">
	<link href="../vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="../css/resume.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">

	<%
		session.setAttribute("homebookroot", "../homebook/");
		session.setAttribute("imageroot", "../img/");
		session.setAttribute("loginroot", "../login/");
		session.setAttribute("memberroot","../mymember/");
		session.setAttribute("boardroot","../board/");
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		String loginroot=(String)session.getAttribute("loginroot");
		String homebookroot=(String)session.getAttribute("homebookroot");
		String memberroot=(String)session.getAttribute("memberroot");
		String imageroot = (String)session.getAttribute("imageroot");
		String boardroot = (String)session.getAttribute("boardroot");
		if (id == null) {
			id = "GUEST";
		}
	%>
</head>

<body id="page-top">
	
	<style type="text/css">
		.navbar-brand{
			margin-top: 0px;
		}
		.qq{
			width: auto;
			height: auto;
			margin-bottom:-450px;
		}
		.btn{
			color: #f5f5dc;
			background-image: url("../img/navbg.png");
			border:1px solid #f5f5dc;
		}
		.btn:hover{
			background: #f5f5dc
		}
	
	</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
	<div class="qq"></div>
		<a class="navbar-brand js-scroll-trigger" href="../main.do">
			<span class="d-none d-lg-block">
				<img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="<%=imageroot%>logoimg.png" alt="">
			</span>
		</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav">
			<li class="nav-item" height="70">
				<p class="top" align="center" width="200"><h3 class="y"  style="color: #f5f5dc"><%=id%>님</h3>
					<%
					if(id.equals("GUEST")){
					%>
						<a class="btn" href='<%=loginroot%>formLogin.jsp'>로그인</a>
						<a class="btn" href='./mymember/password.jsp'>비밀번호 찾기</a>
					<%
					}else{
					%>
						<a class="btn" href='<%=loginroot%>logout.do'>로그아웃</a>	
					<%
					}
					%>
				</p>
			</li>
		</ul>
	</div>
</nav>
	<style>
		.container>h1{
			margin:100px;
		}
		.navbar-form{
			width:100%;
		}
		.table{
			width:80%;
			text-align: center;
		}
		.btn-default:hover{
			background:#f5f5dc;
			color:#424242;
			border:1px solid #424242;
		}
	</style>
<div class="container-fluid p-0">
	<section class="resume-section p-3 p-lg-5 d-flex d-column" id="about" style="background-color: #f5f5dc">
		<div class="container">

			<h1 class="text-center">게시글 읽기</h1>
			<div align="right">
				<button class="btn btn-default" type="button" onclick="location.href='../main.do'">메인</button>
				<button class="btn btn-default" type="button" onclick="history.go(-1)">뒤로</button>
			</div>
			<hr>
			<form class="navbar-form" name="login_form" action="../writeSentense.do" method="POST">
				<%
					long bno = Long.parseLong(request.getParameter("bno"));
					SqlSession sqlSession = MBUtils.getSession();
					BoardDAO dao = sqlSession.getMapper(BoardDAO.class); 
					Board vo = (Board)dao.selectById(bno);
				%>
				<table class="table">
					<tr><th>게시글번호</th><td><%=vo.getBno()%></td></tr>
					<tr><th>게시자아이디</th><td><%=vo.getMid()%>	</td></tr>
					<tr><th>제목</th><td><%=vo.getBtitle() %></td></tr>
					<tr><th>글내용</th><td><%=vo.getBcontent() %></td></tr> 
					<tr><th>게시일자</th><td><%=vo.getBdate() %></td></tr> 
					<tr><th>조회수</th><td><%=vo.getBhit() %></td></tr> 
					<tr><th>그룹/스탭/들여쓰기</th><td>
						<%=vo.getBgroup() %>/<%=vo.getBstep() %>/<%=vo.getBindent() %>
					</td></tr> 
					<tr><td colspan="2" align="right">
						<button type="button" class="btn btn-default" onclick="location.href='boardList.do'">목록보기</button>
						<input type="submit" class="btn btn-default" value="댓글달기">
					</td></tr>
				</table>
				<a href = "../main.do">메인화면</a>
				</form> 
		</div>
	</section>


	<footer style="background-color: #000; color: #fff">
		<div class="container">
			<br>
			<div class="row" >
				<div class="col-sm-4" style="text-align:center; color: #fff"><p style="color: #fff; font-size: 20px;">Copyright &copy; 2017</p><p style="color: #fff; font-size: 20px;">HomeBook 웹가계부</p></div>
				<div class="col-sm-4"><p style="color: #fff; font-size: 20px;">홈페이지 소개 소개</p><p style="color: #fff; font-size: 15px;">HomeBook 웹가계부를 통해 나만의 가계부를 작성해 보세요.</p></div>
				<div class="col-sm-2" style="text-align:center; margin-bottom: 30px;"><p style="color: #fff; font-size: 20px;">네비게이션</p>
					<div class="list-group">
						<a href="index.jsp" class="list-group-item">메인</a>
						<a href="instructor.html" class="list-group-item">가계부 입력</a>
						<a href="lecture.html" class="list-group-item">게시판</a>
					</div>
				</div>
	
				<div class="col-sm-2"><p style="text-align: center;  color: #fff; font-size: 20px;"><span class="glyphicon glyphicon-ok" style="color: #fff"></span>&nbsp;by HomeBook</p></div>
			</div>
		</div>
	</footer>
</div>
    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="../js/resume.min.js"></script>

</body>
</html>