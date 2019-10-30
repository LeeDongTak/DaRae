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
	<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<a href="./index.php" class="logo">Community</a>
			<a class="w_btn" href="./board_add_form.php">글쓰기</a>
		</div>
		<div id="container">
			<p class="baord_title">게시판 수정</p>
			<div class="board_main">
               <?php
                    //커넥션 객체 생성 (데이터 베이스 연결)
                    $conn = mysqli_connect("localhost", "root", "","test");
                    //연결 성공 여부 확인
                    if($conn == null) {
                         die("연결 실패 : " .mysqli_error());
                    }
                    $board_no = $_GET["board_no"];
                    //echo $board_no."번째 글 수정 페이지<br>";
                    //board 테이블을 조회하여 board_no의 값이 일치하는 행의 board_no, board_title, board_content, board_user, board_date 필드의 값을 가져오는 쿼리
                    $sql = "SELECT board_pw, board_no, board_title, board_content, 
                            board_user, board_date FROM board WHERE board_no = '".$board_no."'";
                    $result = mysqli_query($conn,$sql);
                    if($row = mysqli_fetch_array($result)){
                ?>
                <br>
				<form name="loginForm" class="form-horizontal" onSubmit="return checkPassword();" action="./board_update_action.php" method="post">
					<table class="board_table">
                    	<tr>
                    		<th>비밀번호 : </th>
                    		<td>
                    			<!-- 비밀번호 입력 폼  -->
                    			<input class="form-control" name="boardPw" id="password" type="password">
                    		</td>
                    	</tr>
                    	<tr>
                    		<th>글번호 : </th>
                    		<td>
                    			<!-- 글번호 입력 폼  -->
                    			<input class="form-control" name="boardNo" value="<?php echo $row["board_no"]?>" id="no" type="text" readonly>
                    		</td>
                    	</tr>
                    	<tr>
                    		<th>글제목 : </th>
                    		<td>
                    			<!-- 글제목 입력 폼  -->
                    			<input class="form-control" name="boardTitle" value="<?php echo $row["board_title"]?>" id="Title" type="text">
                    		</td>
                    	</tr>
                    	<tr class="form-group">
                    		<th>글내용 : </th>
                    		<td>
                    			<!-- 글내용 입력 폼  -->
                    			<textarea class="form-control" name="boardContent" id="content"  rows="15" style="font-size: 18px;" cols="44"><?php echo $row["board_content"]?></textarea>
                    		</td>
                    	</tr>
                    	<tr>
                    		<th>작성자 명 : </th>
                    		<td style="font-size: 2em">
                    			<!-- 작성자 명 입력 폼  -->
                    			<input class="form-control" name="boardUser" id="name" type="hidden" value="<?php echo $row["board_user"]?>"><?php echo $row["board_user"]?>
                    		</td>
                    	</tr>
                  		<tr>
                    		<td colspan="2" style="text-align: right;">
								&nbsp;&nbsp;&nbsp;
	                           <!-- 글 입력 버튼  -->
                    			<input class="page_btn" type="submit" value="글 수정">
                    			&nbsp;&nbsp;
	                           <!-- 입력 내용 초기화 버튼  -->
                    			<input class="page_btn" type="reset" value="다시쓰기">
                    			&nbsp;&nbsp;
	                           <!-- 리스트  로 돌아가는 버튼  -->
	                    		<a class="page_btn" href="./index.php">리스트로 돌아가기</a>
                    		</td>
                    	</tr>
					</table>
					<br>
                    <?php
                        }
                        //커넥션 객체 종료
                        mysqli_close($conn);
                    ?>
            	</form>
			</div>		
		</div>
	</div>
	<div id="footer">
		<h1>Community에 오신것을 환영합니다. </h1>
	</div>
	<script type="text/javascript">
		// 
		function checkPassword(password) {
			var f = document.loginForm;
    		if(f.boardPw.value == ""){
    			alert("비밀번호를 입력해 주세요.");
    			$('#password').val('').focus();
    			return false;
    		}else if (f.boardPw.value != <?php echo $row["board_pw"];?>){
				alert("비밀 번호가 맞지 않습니다.");
				$('#password').val('').focus();
				return false;
			}else{
				return true;
			}
		}
	</script>  
</body>
</html>