<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="dto.*"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<link rel="stylesheet" type="text/css" href="css/Mypage.css">

 <div id="Home" onclick = "location.href = './index.jsp'">Home<span> &rarr;</span></div>
<div id="container">

			<table>
			<tr>
			<td class="image"><h3>�̹���</td> 
    		<td class="name"><h3>��ǰ��</td> 
   		 	<td class="price"><h3>����</td> 
    		<td class="amount"><h3>����</td>
    		<td><h3>��ۻ���</td>
    		</tr>
	
	<%
		Customer customer = (Customer) session.getAttribute("pCustomer");
	DeliveryDao DDao = new DeliveryDao();
	PurchasHistoryDao PHDao = new PurchasHistoryDao();
	OrderProductDao OPdao = new OrderProductDao();
	ProductDao PDao = new ProductDao();
	List<PurchaseHistory> PhList = PHDao.getPurchaseHistories();
	List<Delivery> DList = DDao.getDeliveries();
	if (customer != null) {
		String nowID = customer.getCustomerID();
	%>
	<h1><%=nowID%>���� ����������
	<p>
		<%
			for (PurchaseHistory PH : PhList) {
			if (PH.getTotalCost() > 0 && nowID.equals(PH.getCustomerID())) {
				for (Delivery d : DList) {
			if (d.getHistoryNumber() == PH.getHistoryNumber()) {
		%>
		<%
			List<OrderProduct> OPList = OPdao.getOrderbyHistroynum(PH.getHistoryNumber());
		%>

		<%
		for (OrderProduct OP : OPList) {
			Product P = PDao.getProductbyPnum(OP.getProductNumber());
		%>
  			<tr class="p">
    		<td class="image"><img src="./Category/images/<%=P.getProductNumber()%>.jpg" alt="item" /></td> 
    		<td class="name"><%=P.getProductName()%></td> 
   		 	<td class="price"><%=P.getProductPrice()%></td> 
    		<td class="amount"><%= OP.getQuantity() %></td>
    		<td><%=d.getStatus()%></td>
 			 </tr>

		<%
			}
		}
		}
		}
		}
		}
		%>
		</table>
<div id="footer">
  <ul>
    <li>���� ��� ����ϰڽ��ϴ�!</li>
  </ul>
  <hr />
  Thank you for purchasing our product!
  <br />
  Internet Database Term Project
</div>
</div>
	</body>
</html>