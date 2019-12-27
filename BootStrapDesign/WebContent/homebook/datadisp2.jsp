<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ldt.dto.HomeBook"%>
	<%@ page import="com.ldt.dao.*"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="org.apache.ibatis.session.SqlSession"%>
	<%@ page import="com.ldt.common.MBUtils"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>가계부 입력</title>
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
	
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/datatables.bootstrap4.min.css">

<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>

<%
	//request.setCharacterEncoding("UTF-8");
	//response.setContentType("text/html;charset=UTF-8");
	String name = (String)session.getAttribute("name");
	SqlSession sqlSession = MBUtils.getSession();
	HomeBookDAO dao = sqlSession.getMapper(HomeBookDAO.class);
	// selectAll 메소드 수행결과를 담을 자료구조
	List<HomeBook> memList = null;
	try {
		memList = dao.selectAllById(id);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	sqlSession.close();// 마이바티스 작업 종료
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

			<h1 class="text-center"><%=name%>님 입력자료 목록
	</h1>
	<div align="right">
		<button type="button" class="btn btn-default" onclick="location.href='form_homebook.jsp'">
			뒤로</a>
	</div>
	<hr>
	<c:set var="mlist" value="<%=memList%>" />
	<table id="example" class="table table-striped table-bordered"
		style="width: 100%">
		<thead>
			<tr>
				<th>관리번호</th>
				<th>일자</th>
				<th>구분</th>
				<th>계정과목</th>
				<th>적요</th>
				<th>차변</th>
				<th>대변</th>
				<th>사용자ID</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="x" items="${mlist}">
				<tr>
					<td>${x.getSerialno()}</td>
					<td>${x.getDay()}</td>
					<td>${x.getSection()}</td>
					<td>${x.getAccountTitle()}</td>
					<td>${x.getRemark()}</td>
					<td>${x.getRevenue()}</td>
					<td>${x.getExpense()}</td>
					<td>${x.getUserId()}</td>
					<td><button type="button" class="btn btn-default"
					onclick="location.href='homebookAdjust.do?no=${x.getSerialno()}'">수정${x.getSerialno()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			
			
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