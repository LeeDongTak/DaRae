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
			<p class="baord_title">글내용</p>
			<div class="board_main">        
            	<?php
                    //mysql 커넥션 객체 생성
                    $conn = mysqli_connect("localhost", "root", "","test");
                    //커넥션 객체 생성 여부 확인
                    if($conn == null) {
                        die("연결 실패 : " .mysqli_error());
                    }
                    //board_list.php 에서 넘어온 글 번호 저장 및 출력
                    $board_no = $_GET["board_no"];
                   // echo $board_no."번째 글 내용<br>";
                    //board 테이블에서 board_no값이 일치하는 필드 값들 조회 쿼리
                    $sql = "SELECT board_no, board_title,
                            board_content, board_user, board_date 
                            FROM board WHERE board_no = '".$board_no."'";
                    $result = mysqli_query($conn,$sql);
                    //조회 성공 여부 확인
                    if($result ==null) {
                        echo "결과 없음: ".mysqli_error($conn);
                    }
                ?>
            	<table class="board_table">
            		<?php
                        //result 변수에 담긴 값을 row 변수에 저장하여 테이블에 출력
                        if($row = mysqli_fetch_array($result)) {
                    ?>
            		<tr>
            			<td style="width:5%">작성자</td>
            			<td style="width:40%" colspan="5">
            				<?php
                                echo $row["board_user"];
                            ?>
            			</td>
            		</tr>
            		<tr>
            			<td style="width:5%">글 제목</td>
            			<td style="width:24%">
            				<?php
                                echo $row["board_title"];
                            ?>
            			</td>
            			<td style="width:5%">글 번호</td>
            			<td style="width:3%">
            				<?php
                                echo $row["board_no"];
                            ?>
            			</td>
            			<td style="width:5%">작성 일자</td>
            			<td style="width:3%" colspan="5">
            				<?php
                                echo $row["board_date"];
                            ?>
            			</td>
                	</tr>
                	<tr>
                		<td></td>
                		<td colspan="3">
                			<?php
                                echo $row["board_content"];
                            ?>
                    	</td>
                    	<td colspan="2"></td>
                	</tr>
                	<?php
                        }   
                    ?>
            	</table>
            	<br>
            	&nbsp;&nbsp;&nbsp;
            	<a class='page_btn' href="./index.php">
            	리스트로 돌아가기</a>
			</div>		
		</div>
	</div>
	<div id="footer">
		<h1>Community에 오신것을 환영합니다. </h1>
	</div>
</body>
</html>
