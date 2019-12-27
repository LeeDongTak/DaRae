<%@page import="com.ldt.dao.BMemberDAO"%>
<%@page import="com.ldt.dto.BMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ldt.dao.*"%>
<%@ page import="com.ldt.common.*"%>
<%@ page import="com.ldt.dto.*"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>회원목록페이지네이션</title>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/datatables.bootstrap4.min.css">



<%
	//request.setCharacterEncoding("UTF-8");
	//response.setContentType("text/html;charset=UTF-8");
	SqlSession sqlSession = MBUtils.getSession();
	BMemberDAO dao = sqlSession.getMapper(BMemberDAO.class);
	// selectAll 메소드 수행결과를 담을 자료구조
	List<BMember> memList = null;
	try {
		memList = dao.selectAll();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	sqlSession.close();// 마이바티스 작업 종료
%>
<script>
$(document).ready(function() {
    $('#example').DataTable({
    	stateSave: true,
    	"scrollX": true,
    	"language": {
            "decimal": ".",
            "thousands": ",",
            "info": "보이는페이지 _PAGE_ / _PAGES_",
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Korean.json"
        },
        "lengthMenu": [[5,10, 15, 20,50, -1], [5,10, 15,20, 50, "All"]]
    });
} );
</script>
<script>
	$(document).ready(function() {
		$('#header_div').load('./common/header.jsp');
		$('#footer_div').load('./common/footer.jsp');
	});
</script>
</head>

<body>
	<div id="header_div"></div>
	<c:set var="mlist" value="<%=memList%>" />
	<table id="example" class="table table-striped table-bordered"
		style="width: 100%">
		<!-- 
	<table class="table table-sm th table-bordered td">
	-->
		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>password</th>
				<th>phone</th>
				<th>joinDate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="x" items="${mlist}">
				<tr>
					<td>${x.getMid()}</td>
					<td>${x.getMname()}</td>
					<td>${x.getMpassword()}</td>
					<td>${x.getMphone()}</td>
					<td>${x.getMjoinDate()}</td>
				</tr>
			</c:forEach>
		</tbody>


	</table>


</body>
</html>
 
