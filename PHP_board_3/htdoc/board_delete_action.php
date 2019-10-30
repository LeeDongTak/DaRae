<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>board_delete.php</title>
</head>
<body>
	<h1>board_delete_action.php</h1>
	<?php
        // board_delete_form.php 페이지에서 넘어온 글 번호값 저장 및 출력
        $board_no = $_GET["board_no"];
        $board_pw = $_GET["boardPw"];
        echo "board_no : " . $board_no . "<br>";
        echo "board_pw : " . $board_pw . "<br>";
        //mysql 커넥션 객체 생성
        $conn = mysqli_connect("localhost", "root", "", "test");
        // 커넥션 객체 생성 여부 확인
        if ($conn) {
            echo "연결 성공<br>";
        } else {
            die("연결 실패 : " . mysqli_connect_error());
        }
        // board테이블에서 입력된 글 번호와, 글 비밀번호가 일치하는 행 삭제 쿼리
        try {
            // 삭제대상자료가 있는 지 확인 
            $selectSql = "SELECT * FROM board WHERE board_pw='" . $board_pw 
                        . "' AND board_no=" . $board_no . "";
            $result = mysqli_query($conn, $selectSql);
            //패스워드가 맞는 해당 자료가 있으면 
            if ($row = mysqli_fetch_array($result)) {
                // 지우는 작업
                $deleteSql = "DELETE FROM board WHERE board_pw='" 
                . $board_pw . "' AND board_no=" . $board_no . "";
                $res = mysqli_query($conn, $deleteSql);
                echo "삭제 성공: " . $deleteSql . ":" . "실행완료~~";
            } 
            // 패스워드가 맞는 해당 자료가 없으면 
            else {
                echo "삭제 실패! ";
            }
        } catch (Exception $e) {
            echo "삭제 실패: " . mysqli_error($conn);
            $s = $e->getMessage() . '(오류코드:' . $e->getCode() . ')'; 
            echo $e;
        }

        mysqli_close($conn);
        // 헤더함수를 이용하여 리스트 페이지로 리다이렉션 -> 테스트후에는 아랫줄 주석을 해제 합니다. 
        header("Location: ./index.php");
    ?>
</body>
</html>