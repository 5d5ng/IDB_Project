<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
	<h1>�α��� ���ּ���.</h1>
	<form action="LoginCheck.jsp" method="post">
		���̵� <input type="text" name="id"><br> 
		��й�ȣ <input type="password" name="pwd"><br> 
		<input type="submit" value="�α���">
	</form>
	<button onClick="location.href = 'register.jsp'" > ȸ������</button>
</body>
</html>