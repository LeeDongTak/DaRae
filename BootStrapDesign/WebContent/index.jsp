<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>WelCome HoemBook!</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resume.min.css">
	
	
	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom fonts for this template -->
	<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="vndor/devicons/css/devicons.min.css" rel="stylesheet">
	<link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="css/resume.min.css" rel="stylesheet">

	<style type="text/css">
		.navbar-brand{
			margin-top: 0px;
		}
	</style>
	<%
		session.setAttribute("homebookroot", "homebook/");
		session.setAttribute("imageroot", "img/");
		session.setAttribute("loginroot", "login/");
		session.setAttribute("memberroot","mymember/");
		session.setAttribute("boardroot","board/");
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
	
	<style>
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
      <a class="navbar-brand js-scroll-trigger" href="main.do">
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
		
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">Intro</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#experience">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#education">How to use</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#skills">service</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#interests">Event</a>
          </li>
        </ul>
      </div>
    </nav>
   
<div class="container-fluid p-0">
<section class="resume-section p-3 p-lg-5 d-flex d-column" id="about" style="background-color: #f5f5dc">
	<div class="my-auto">
		<h1 class="mb-0">HomeBook
			<span class="text-primary">웹가계부</span>
		</h1>
		<div class="subheading mb-5">
			나만의 웹가계부를 만들어 보세요.
		</div>
		<p class="mb-5">제테크의 기본은 습관에서 사작됩니다. HomeBook으로 시작하세요.</p>
		<ul class="list-inline list-social-icons mb-0">
			<li class="list-inline-item">
				<a href="#">
					<span class="fa-stack fa-lg">
						<i class="fa fa-circle fa-stack-2x"></i>
						<i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
					</span>
				</a>
			</li>
			<li class="list-inline-item">
				<a href="#">
					<span class="fa-stack fa-lg">
						<i class="fa fa-circle fa-stack-2x"></i>
						<i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
					</span>
				</a>
			</li>
			<li class="list-inline-item">
				<a href="#">
					<span class="fa-stack fa-lg">
						<i class="fa fa-circle fa-stack-2x"></i>
						<i class="fa fa-linkedin fa-stack-1x fa-inverse"></i>
					</span>
				</a>
			</li>
			<li class="list-inline-item">
				<a href="#">
					<span class="fa-stack fa-lg">
						<i class="fa fa-circle fa-stack-2x"></i>
						<i class="fa fa-github fa-stack-1x fa-inverse"></i>
					</span>
				</a>
			</li>
		</ul>
	</div>
</section>

<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="experience" style="background-color: #f5f5dc">
	<div class="my-auto">
		<h2 class="mb-5">About</h2>

		<div class="resume-item d-flex flex-column flex-md-row mb-5">
			<div class="resume-content mr-auto">
				<h3 class="mb-0">HomeBook 이란?</h3>
				<br>	
				<p>나만의 가계부를 작성하여 어렵고 함들게만 느껴졌던 제테크를 쉽고 재밌있게 즐길수 있습니다. </p>
			</div>
		</div>

		<div class="resume-item d-flex flex-column flex-md-row mb-5">
			<div class="resume-content mr-auto">
				<h3 class="mb-0">다함께 즐기는 HomeBook!</h3>
				<br>	
				<p>남녀노소 누구나 가계부를 만들 수 있으며 나도 몰랐던 지출 소소하지만 확실한 수입을 인지할 수 이습니다.</p>
			</div>
		</div>

		<div class="resume-item d-flex flex-column flex-md-row mb-5">
			<div class="resume-content mr-auto">
				<h3 class="mb-0">습관은 미리미리 준비하자</h3>
				<br>	
				<p>3살때 버릇 여든까지간다는 말이 있습니다. 우리 아이의 돈버는 습관 지금부터 만들어 보세요.</p>
			</div>
		</div>

		<div class="resume-item d-flex flex-column flex-md-row">
			<div class="resume-content mr-auto">
				<h3 class="mb-0">공유하Go 소통하Go</h3>
				<br>	
				<p>게시판 기능을 통하여 나만의 제테크 노하우를 공유받고 부족한 나의 자산관리 실력을 제테크 고수님들을 통하여 노하우를 공유 받으세요.</p>
			</div>
		</div>
	</div>

</section>

<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="education" style="background-color: #f5f5dc">
	<div class="my-auto">
 		<h2 class="mb-5">How to use</h2>
		<div class="resume-item d-flex flex-column flex-md-row mb-5">
			<div class="resume-content mr-auto">
				<h3 class="mb-0">1. 회원가입을 하세요.</h3>
				<br>              
				<div>HomeBook에 처음 방문하신 분이시라면 먼저 회원가입을 하세요. 원활한 서비스를 이용하시기 위해서는 회원가입을 먼저 하셔야 합니다.</div>
			</div>
		</div>

		<div class="resume-item d-flex flex-column flex-md-row mb-5">
			<div class="resume-content mr-auto">
				<h3 class="mb-0">2. 로그인후 가계부를 작셩하세요</h3>
				<br>
				<div>회원가입을 하셨다면 이제 로그인을 하셔서 가계부를 작성합니다. </div>
			</div>
		</div>
         
		<div class="resume-item d-flex flex-column flex-md-row mb-5">
			<div class="resume-content mr-auto">
				<h3 class="mb-0">3. 앗! 가계부를 잘못작성하셨나요? 그럼수정하세요.</h3>
				<br>
				<div>가계부를 잘못 작성하셨다면 수정을 통해 가계부를 수정할 수 있습니다.</div>
			</div>
		</div>

		<div class="resume-item d-flex flex-column flex-md-row mb-5">
			<div class="resume-content mr-auto">
				<h3 class="mb-0">4. 게시판을 이용해 보세요</h3>
					<br>
				<div>게시판을 통해 다른사람들과 소통할 수 있습니다. </div>
			</div>
		</div>
	</div>
</section>

	<style>
		.col-md-4{
			width:250px;
			height:auto;
			margin-left:0;
			margin-right:0;
			margin-bottom: 80px;
			text-align:center;
		}
		.row{
			width: auto;
			height: auto;
			margin-left:0;
			margin-right:0;
			padding:0;
			text-align: center;
		}
		.media .media-body{
			width:auto;
			height:auto;
			marign
			text-align: center;
		}
		.container>*{
			margin:0;
			padding:0;
			text-align: center;
		}
		.media-boby:hover{
			box-shadow:5px 5px 15px #555;
		}
	</style>
	<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="skills" style="background-color: #f5f5dc">
		<div class="my-auto">
			<h2 class="mb-5">service</h2>
			<div class="container" style="text-align:center;">
				<div class="row">
					<div class="col-md-4">
						<div class="media">
							<a class="media-boby" href="<%=memberroot%>memberJoin.jsp">
								<img class="media-object" src="<%=imageroot%>member.png" alt="회원가입 이미지" style="width:250px; height:auto;">
							</a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="media">
							<a class="media-boby" href="<%=memberroot%>joinConfirm.do">
								<img class="media-object" src="<%=imageroot%>memberConfirm.png" alt="본인정보 확인 이미지" style="width:250px; height:auto;">
							</a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="media">
							<a class="media-boby" href="<%=homebookroot%>form_homebook.jsp">
								<img class="media-object" src="<%=imageroot%>homebook.png" alt="가계부 입력 이미지" style="width:250px; height:auto;">
							</a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="media">
							<a class="media-boby" href="<%=boardroot%>boardList.do">
								<img class="media-object" src="<%=imageroot%>board.png" alt="게시판 이미지" style="width:250px; height:auto;">
							</a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="media">
							<a class="media-boby" href="<%=memberroot%>allMember.do">
								<img class="media-object" src="<%=imageroot%>adminmember.png" alt="관리자 전용 이미지" style="width:250px; height:auto;">
							</a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="media">
							<a class="media-boby" href="<%=homebookroot%>allBook.do">
								<img class="media-object" src="<%=imageroot%>adminhomebook.png" alt="관리자 전용 이미지" style="width:250px; height:auto;">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="interests"  style="background-image: url('img/carli-jeen-15YDf39RIVc-unsplash.jpg'); background-size: cover;">
		<div class="my-auto">
			<h1 class="mb-5" style="color:#fff; font-size: 200px;">Event</h1>
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/resume.min.js"></script>

</body>
</html>
