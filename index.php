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
			<p class="baord_title">게시판</p>
			<div class="board_main">
                <?php
                    //처음 페이지를 들어가먼 현재 페이지는  기본 1페이지
                    $currentPage = 1;
                    //get방식으로 전달되온 상관배열의 'currentPage'이 있으면 ,
                    //'currentPage'를 출력하라
                    if (isset($_GET["currentPage"])) {
                        $currentPage = $_GET["currentPage"];
                    }
            
                    // mysqli_connect()함수로 커넥션 객체 생성
                    $conn = mysqli_connect("localhost", "root", "", "test");
                    // 커넥션 객체 생성 확인
                    if ($conn == null) {
                        //애러 발생시 나머지 로직 수행 중단(die)
                        die("연결 실패 : " . mysqli_error());
                    }
            
                    // 페이징 작업을 위한 테이블 내 전체 행 갯수 조회 쿼리
                    $sqlCount = "SELECT count(*) FROM board"; // board의 전체 행 수 
                    $resultCount = mysqli_query($conn, $sqlCount); // resultSet과유사
                    if ($rowCount = mysqli_fetch_array($resultCount)) {
                        $totalRowNum = $rowCount["count(*)"]; // php는 지역 변수를 밖에서 사용 가능.
                    }
                    // 행 갯수 조회 쿼리가 실행 됐는지 여부
                    if ($resultCount == null) {
                        echo "결과 없음: " . mysqli_error($conn);
                    }
            
                    $rowPerPage = 10; // 페이지당 보여줄 게시물 행의 수
                    $begin = ($currentPage - 1) * $rowPerPage;
                    // board 테이블을 조회해서 board_no, board_title, board_user, board_date 필드 값을 내림차순으로 정렬하여 모두 가져 오는 쿼리
                    // 입력된 begin값과 rowPerPage 값에 따라 가져오는 행의 시작과 갯수가 달라지는 쿼리
                    $sql = "SELECT board_no, board_title, board_user,
                                 board_date FROM board order by 
                                 board_no desc limit " . $begin . "," . $rowPerPage . "";
                    // 1페이지 limit 0,5 만약 10페이지 limit 45,5
                    $result = mysqli_query($conn, $sql);
                    // 쿼리 조회 결과가 있는지 확인
                    if ($result == null) {
                        echo "결과 없음: " . mysqli_error($conn);
                    }
                ?>
                <table class="board_table">
        			<tr>
        				<th>게시판 번호</th>
        				<th>제목</th>
        				<th>내용</th>
        				<th>작성날짜</th>
        				<th>수정</th>
        				<th>삭제</th>
        			</tr>
                    <?php
                        // 반복문을 이용하여 result 변수에 담긴 값을 row변수에
                        // 계속 담아서 row변수의 값을 테이블에 출력한다.
                        while ($row = mysqli_fetch_array($result)) {
                    ?>
                   	<tr>
        				<td>
                    		<?php
                                echo $row["board_no"];
                            ?>
                   		</td>
        				<td>
        					<?php
                                echo "<a href='./board_detail.php?board_no=" . $row["board_no"] . "'>";
                                echo $row["board_title"];
                                echo "</a>";
                            ?>
        				</td>
        				<td>
        					<?php
                                echo $row["board_user"];
                            ?>
        				</td>
        				<td>
        					<?php
                                echo $row["board_date"];
                            ?>
        				</td>
        				<?php
                            echo "<td><a class='update_btn' href='./board_update_form.php?board_no=" . $row["board_no"] . "'>수정</a></td>";
                            echo "<td><a class='delete_btn' href='./board_delete_form.php?board_no=" . $row["board_no"] . "'>삭제</a></td>";
                        ?>
                    </tr>
                    <?php
                        } // 와일루프 종료
                    ?>
                    <tr>
                    	<td colspan="6" style="text-align: center;">
                            <?php
                                // PAGENATION 부분 : 중요
                                // currentPage 변수가 1보다 클때만 이전 버튼이 활성화 되도록 함
                                if ($currentPage > 1) {
                                    // 이전 버튼이 클릭될때 GET방식으로 currentPage변수 값에
                                    // 1을 뺀 값이 넘어가도록 함
                                    echo "<a class='page_btn' 
                                        href ='./index.php?currentPage=" . ($currentPage - 1) . "'>이전</a>&nbsp;&nbsp;&nbsp;&nbsp;";
                                }
                               
                                $lastPage = ($totalRowNum - 1) / $rowPerPage;
                                for ($i=1;$i<=$lastPage+1;$i++){
                                    if($i == $currentPage){
                                       echo "<a class='page_btn_cleck' name='num_btn' style='color:#fff'
                                            href='./index.php?currentPage=" .$i."'>".$i."</a>&nbsp;&nbsp;&nbsp;&nbsp;";
                                    }else{
                                        echo "<a class='page_btn' name='num_btn'
                                            href='./index.php?currentPage=" .$i."'>".$i."</a>&nbsp;&nbsp;&nbsp;&nbsp;";
                                    }
                                }

                                // lastPage변수가 currentPage 변수보다 클때만
                                // 다음 버튼이 활성화 되도록 함
                                if ($currentPage < $lastPage) {
                                    // 다음 버튼이 클릭될때 GET방식으로 currentPage변수 값에
                                    // 1을 더한 값이 넘어가도록 함
                                    echo "<a class='page_btn' 
                                        href='./index.php?currentPage=" . ($currentPage + 1) . "'>다음</a>";
                                }
                                mysqli_close($conn); // 중요: 디비서버의 메모리를 효율적으로 운영
                            ?>
                        </td>
                    </tr>
                </table>
			</div>		
		</div>
	</div>
	<div id="footer">
		<h1>Community에 오신것을 환영합니다. </h1>
	</div>
</body>
</html>