<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="Background.css">
<style> 
.loginForm{
	position:absolute;
	top:10%;
	left:40%;
}

</style>
</head>
<body>
<div id="name"><a href="index.jsp">O2 Market</a></div>
	<%
		
		session.removeAttribute("pCustomer"); //�α��� �ʱ�
		String n = (String) session.getAttribute("fail");
		System.out.println(n);
		if(n!=null){
			%>
			
			<p><%=n %>�� �α��ο� �����Ͽ����ϴ� �ٽ� �õ����ּ���</p>
			<% 
			
		}
	%>
	<div class = "loginForm">
	<h1>�α��� ���ּ���.</h1>
	<form action="LoginCheck.jsp" method="post">
		���̵� <input type="text" name="id"><br> 
		��й�ȣ <input type="password" name="pwd"><br> 
		<input type="submit" value="�α���">
	</form>
	<button onClick="location.href = 'register.jsp'" > ȸ������</button>
	
	</div>
</body>
</html>