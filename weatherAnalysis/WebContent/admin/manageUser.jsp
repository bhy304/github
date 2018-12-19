<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/inchang.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

function call(userid){
	ret = confirm("삭제하시겠습니까?");
	if(ret)
		location.href='userDelete.do?userid=' + userid;
}
</script>
<script>

function call2(userid){
	ret = confirm("수정하시겠습니까?");
	if(ret)
		location.href='userUpdate.do?userid=' + userid;
}
</script>
<script>
function retrieve(){
	var id = document.getElementById("id").value;
	var email = document.getElementById("email").value;
	var param = "id=" + id + "&email=" + email;
	
	var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200 ) {
				document.getElementById("here").innerHTML = this.responseText;
			}
		};
		
		xhttp.open("GET", "finduser.do?" + param);
		xhttp.send();
}

</script>
</head>
<body>
<jsp:include page="adminHeader.jsp"></jsp:include>

<div id = "search">
<a href="${pageContext.request.contextPath}/admin/user.do"><h2 class='admin'>회원조회</h2></a>
<input type="text" id="id" class='ipt' placeholder="아이디">
<input type="email" id="email" class='ipt' placeholder="이메일">
<button class='btn btn-primary' onclick="retrieve();">조회하기</button>
</div>

<div id="here">
<table id="customers">
	<tr>
		<th>아이디</th>
		<th>패스워드</th>
		<th>이메일</th>
		<th>회원관리</th>
	</tr>
	<c:forEach items="${allUser }" var="allUser">
	<tr>
		<td>${allUser.id }</td>
		<td>${allUser.password }</td>
		<td>${allUser.email }</td>
		<td><div class="button"><button class='btn btn-default' onclick="call2('${allUser.id}');">수정</button><button class='btn btn-danger' onclick="call('${allUser.id}');">삭제</button></div></td>
	</tr>
	</c:forEach>
</table>
</div>
</body>
</html>