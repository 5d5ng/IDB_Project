<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String InputID = request.getParameter("id");
		String InputPW = request.getParameter("pwd");
		
		CustomerDao dao = new CustomerDao();
		List<Customer> list = dao.getCustomers();
		Customer customer = dao.chkCustomer(InputID, InputPW, list);
		
		if(customer!=null){ //Login Success
			session.setAttribute("pCustomer", customer);
			//System.out.print(customer.getName());
			response.sendRedirect("index.jsp");
			
		}
		
		
		else{ //�α��� ����
			/*
			int trial = 0;
			String fail = (String)session.getAttribute("fail");
			if( fail == null){ // ���������̾��ٸ�
				trial = 1;
			}
			else{
				trial = Integer.parseInt(fail)+1;		
			}
			

			session.setAttribute("fail", Integer.toString(trial)); // fail �ĺ��ڷ� trial �Ѱ���
			response.sendRedirect("Login.jsp");
			*/
			%>
			
			<script>alert('�α���  ����'); history.back();</script>
			<% 


		}
		
	
%>

</body>
</html>