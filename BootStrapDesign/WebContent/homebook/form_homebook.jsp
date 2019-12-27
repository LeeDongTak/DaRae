<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		String id = null ;
		id = (String) session.getAttribute("id");
		String loginroot=(String)session.getAttribute("loginroot");
		String homebookroot=(String)session.getAttribute("homebookroot");
		String memberroot=(String)session.getAttribute("memberroot");
		String imageroot = (String)session.getAttribute("imageroot");
		String boardroot = (String)session.getAttribute("boardroot");
		if (id == null) {
			id = "GUEST";
		}
	%>
<script>
	// 클라이언트에서 미리 체크할껀 체크하고 서버로 전송
	// 그래야만 서버프로그램의 부하를 줄일 수 있다. 
	function formCheck(frm) {
		if (frm.id.value == "") {
			alert("회원의 아이디는 반드시 넣어야 합니다.");
			frm.id.focus();
			return false;
		}

		if (frm.section.value == "수입" && frm.expense.value != 0) {
			alert("지출금액은 0이라야 합니다.");
			frm.expense.focus();
			return false;
		}

		if (frm.section.value == "지출" && frm.revenue.value != 0) {
			alert("수입금액은 0이라야 합니다.");
			frm.revenue.focus();
			return false;
		}
		// 서버에 리퀘스트를 보내는 작업 (get이나 post방식으로)
		if (id ==null){	
			alert('로그인을 하세요.');
		} 
		document.getElementById('homebook_input').submit();
	} 
</script>
	
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
			margin-left:10%;
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

			<h1 align="center">나만의 가계부를 만들어 보세요</h1>
			<div align="right">
				<button class="btn btn-default" type="button" onclick="location.href='../main.do'">메인</button>
				<button class="btn btn-default" type="button" onclick="history.go(-1)">뒤로</button>
			</div>
			<hr>
			
			<form class="navbar-form" id="homebook_input" onsubmit="return formCheck(this)"
			method="post" action="homebook.do">
				<table class="table">
					<tr>
						<%
							try{
								id = (String)session.getAttribute("id");
							}catch(Exception e){
								System.out.println("form_homebook.jsp 46라인 에러");			
							}
						%>
						<%if (id !=null){%>	
							<td>
								<input class="form-control" type="hidden" name="userId" value="<%=id%>">
								<%=id %>
							</td>
						<%} else{ %>
							<td>
								<input class="form-control" type="text" name="userId" placeholder="ID">
							</td>
						<%} %>
					</tr>
					<tr>
						<td>
							<input class="form-control" type="text" name="serialno" value="자동">
						</td>
					</tr>
					<tr>
						<td>
							<input class="form-control" type="date" name="day" placeholder="날짜">
						</td>
					</tr>
					<tr>
						<td>
							<input type="radio" name="section" style="font-size:17px; width:23px;height:23px" value="수입">수입
							<input type="radio" name="section" style="font-size:17px; width:23px;height:23px" value="지출" checked>지출
						</td>
					</tr>
					<tr>
						<td>
							<select name="accountTitle" class="form-control">
								<optgroup label="수입항목">
									<option class="form-control" value="월급">월급</option>
									<option class="form-control" value="상여금">상여금</option>
									<option class="form-control" value="잡수입">잡수입</option>
								</optgroup>
								
								<optgroup label="지출항목">
									<option class="form-control" value="피복비">피복비</option>
									<option class="form-control" value="외식비">외식비</option>
									<option class="form-control" value="식재료비">식재료비</option>
									<option class="form-control" value="공과금">공과금</option>
									<option class="form-control" value="자산매입">자산매입</option>
									<option class="form-control" value="소모품비">소모품비</option>
									<option class="form-control" value="차량유지비">차량유지비</option>
									<option class="form-control" value="접대비">접대비</option>
									<option class="form-control" value="모임회비">모임회비</option>
									<option class="form-control" value="기타잡비">기타잡비</option>
								</optgroup>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<input class="form-control" type="text" name="remark" placeholder="수지내역">
			
						</td>
																<tr>
						<td>
							<input class="form-control" type="text" name="revenue" placeholder="수입" value="0">
						</td>
																<tr>
						<td>
							<input class="form-control" type="text" name="expense" placeholder="수입" value="0">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right;">
							<input class="btn btn-default" type="submit" value="자료입력">
							<input class="btn btn-default" type="reset" value="다시입력">
							<button type="button" class="btn btn-default" onsubmit="return formCheck2(this)" onclick="location.href='datadisp2.jsp'">입력자료출력</button>	
						</td>
					</tr>
				</table>
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