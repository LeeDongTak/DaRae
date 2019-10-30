<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Community Board!</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<a href="./index.php" class="logo">Community</a>
			<a class="w_btn" href="./board_add_form.php">글쓰기</a>
		</div>
		<div id="container">
			<p class="baord_title">글쓰기</p>
			<div class="board_main">
				<form name="loginForm" class="form-horizontal" onSubmit="return insertOk();" action="./board_add_action.php" method="post">
					<table class="board_table">
                    	<tr>
                    		<th>비밀번호 : </th>
                    		<td>
                    			<!-- 비밀번호 입력 폼  -->
                    			<input class="form-control" name="boardPw" id="password" type="password">
                    		</td>
                    	</tr>
                    	<tr>
                    		<th>글제목 : </th>
                    		<td>
                    			<!-- 글제목 입력 폼  -->
                    			<input class="form-control" name="boardTitle" id="Title" type="text" placeholder="Title">
                    		</td>
                    	</tr>
                    	<tr class="form-group">
                    		<th>글내용 : </th>
                    		<td>
                    			<!-- 글내용 입력 폼  -->
                    			<textarea class="form-control" name="boardContent" id="content" rows="10" cols="23.5	" placeholder="Content"></textarea>
                    		</td>
                    	</tr>
                    	<tr>
                    		<th>작성자 명 : </th>
                    		<td>
                    			<!-- 작성자 명 입력 폼  -->
                    			<input class="form-control" name="boardUser" id="name" type="text" placeholder="Name">
                    		</td>
                    	</tr>
                    	<tr>
                    		<td colspan="2" style="text-align: right;">
								&nbsp;&nbsp;&nbsp;
	                           <!-- 글 입력 버튼  -->
                    			<input class="page_btn" type="submit" value="글 입력">
                    			&nbsp;&nbsp;
	                           <!-- 입력 내용 초기화 버튼  -->
                    			<input class="page_btn" type="reset" value="초기화">
                    			&nbsp;&nbsp;
	                           <!-- 리스트  로 돌아가는 버튼  -->
	                    		<a class="page_btn" href="./index.php">리스트로 돌아가기</a>
                    		</td>
                    	</tr>
					</table>
            	</form>
			</div>		
		</div>
	</div>
	<div id="footer">
		<h1>Community에 오신것을 환영합니다. </h1>
	</div>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$("#password").change(function(){
			checkPassword($('#password').val());
		});
		$("#Title").change(function(){
			checkTitle($('#Title').val());
		});
		$("#content").change(function(){
			checkContent($('#content').val());
		});
		$("#name").change(function(){
			checkName($('#name').val());
		});
		//
		function checkPassword(password) {
			var f = document.loginForm;
    		if(f.boardPw.value == ""){
    			alert("비밀번호를 입력해 주세요.");
    			$('#password').val('').focus();
    			return false;
    		}else if(password.length < 4){
				alert("비밀 번호는 4자 이상 입력하여야 합니다.");
				$('#password').val('').focus();
				return false;
			}else{
				return true;
			}
		}
		function checkTitle(title) {
			var f = document.loginForm;
    		if(f.boardTitle.value == ""){
    			alert("제목을 입력해 주세요.");
    			$('#Title').val('').focus();
    			return false;
    		}else if(title.length < 2){
				alert("제목은 2자 이상 입력하여야 합니다.");
				$('#Title').val('').focus();
				return false;
			}else{
				return true;
			}
		}

		function checkContent(content) {
			var f = document.loginForm;
    		if(f.boardContent.value == ""){
    			alert("글내용을 입력해 주세요.");
    			$('#content').val('').focus();
    			return false;
    		}else if(content.length < 2){
				alert("글 내용은 2자 이상 입력하여야 합니다.");
				$('#content').val('').focus();
				return false;
			}else{
				return true;
			}
		}

		function checkName(name) {
			var f = document.loginForm;
    		if(f.boardUser.value == ""){
    			alert("이름을 입력해 주세요.");
    			$('#name').val('').focus();
    			return false;
    		}else if(name.length < 2){
				alert("이름은 2자 이상 입력하여야 합니다.");
				$('#name').val('').focus();
				return false;
			}else{
				return true;
			}
		}
		function insertOk() {
			var f = document.loginForm;
    		if(f.boardPw.value == ""){
    			alert("비밀번호를 입력해 주세요.");
    			$('#password').val('').focus();
    			return false;
    		}else if(f.boardTitle.value == ""){
    			alert("제목을 입력해 주세요.");
    			$('#Title').val('').focus();
    			return false;
    		}else if(f.boardContent.value == ""){
    			alert("글 내용을 입력해 주세요.");
    			$('#content').val('').focus();
    			return false;
    		}else if(f.boardUser.value == ""){
    			alert("이름을 입력해 주세요.");
    			$('#name').val('').focus();
    			return false;
    		}else{
				return true;
			}
		}








		
	</script>
</body>
</html>
