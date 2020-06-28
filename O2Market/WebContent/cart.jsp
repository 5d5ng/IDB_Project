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
	<%

	
		request.setCharacterEncoding("euc-kr");
		Customer customer = (Customer) session.getAttribute("pCustomer"); //�α��� ��

		
		if (customer == null) {
			System.out.print("sssqs");
			response.sendRedirect("Login.jsp");
		}
		

		OrderProductDao orderDao = new OrderProductDao();
		ProductDao productDao = new ProductDao();
		
		String parm = request.getParameter("order");
		int ProductNum = Integer.parseInt(parm)-1; // ��ǰ �Ķ���ͷ� �޾ƿ�
		System.out.println(ProductNum);
		
		PurchasHistoryDao PHistoryDao = new PurchasHistoryDao();

		List<OrderProduct> orderList = orderDao.getOrders();
		List<Product> productList = productDao.getProduct();
		List<PurchaseHistory> historyList = PHistoryDao.getPurchaseHistories(); // ���� �α��� ���� ���Ÿ���Ʈ

		String cID = customer.getCustomerID();
		String status = "���� ���"; // �������̶�� �ǹ�

//		Product nowProduct = (Product) session.getAttribute("order"); //���� ��ǰ
		Product nowProduct = productList.get(ProductNum);	
//session.removeAttribute("order");
		System.out.println(nowProduct.getProductName());
		

		//System.out.print(nowProduct.toString());
		PurchaseHistory shoppingCart = null;
		OrderProduct nowOrderProduct = null; // 
 
		for (PurchaseHistory history : historyList) {
			if (cID.equals(history.getCustomerID()) && status.equals(history.getPaymentStatus().trim())) { //�����ϱ� �� �����̰� CID�� �ش��ϴ� �����丮�� �ִٸ� �ҷ��´�.
				shoppingCart = history;
				break;
			}
		}

		
		
		
		
		if (shoppingCart == null) { //��ٱ��ϸ� ���� �������Ѵٸ�
			
			int Hnum = historyList.size() + 1;
			String customerID = customer.getCustomerID();
			int cost = nowProduct.getProductPrice();
			int Onum = orderList.size() + 1;
			int Pnum = nowProduct.getProductNumber();
			
			shoppingCart = new PurchaseHistory(Hnum, customerID, cost, status);
			PHistoryDao.addPurchaseHistory(shoppingCart); // ���ο� �������� �� ��ٱ��� �߰�

			//OrderProduct�߰�
			nowOrderProduct = new OrderProduct(Onum, 1, customerID, Pnum, Hnum);
			orderDao.addOrderProduct(nowOrderProduct);

		}
		else{ //�����Ϸ� ���� ��ٱ��ϰ� �����Ѵٸ� OrderProduct�� �߰��Ѵ�.
			
			for(OrderProduct oProduct: orderList){
				int Hnum = oProduct.getHistoryNumber();
				int CartHnum = shoppingCart.getHistoryNumber();
				String CID = customer.getCustomerID();
				String oProductCID = oProduct.getCustomerID();
				int Pnum = nowProduct.getProductNumber();
				int oProdcutNum = oProduct.getProductNumber();
				
				if(Hnum == CartHnum && CID.equals(oProductCID) && oProdcutNum == Pnum){ //OrderProduct��ü �� �ֹ���ȣ,ȸ�����̵�,��ǰ��ȣ �´� ������ ���
						//UPDATE�� �ۼ�
					orderDao.updateOrderProduct(oProdcutNum);
					PHistoryDao.updatePurchaseHisory(nowProduct.getProductPrice(), Hnum); // �̹��� ���� ��ǰ������ �־����
					break;
				}
				
			}
			if(nowOrderProduct == null){
				nowOrderProduct = new OrderProduct(orderList.size()+1,1,customer.getCustomerID(),nowProduct.getProductNumber(),shoppingCart.getHistoryNumber());
				orderDao.addOrderProduct(nowOrderProduct);
				
			}
			
			
			
		}
		
		//�����丮�� OrderProduct �߰��ϴ� �κ�

		List<PurchaseHistory> nowHistory = PHistoryDao.getCustomerHistories(customer.getCustomerID()); // ���� �α��� ���� ���Ÿ���Ʈ
		
	%>

	<div>
		<%=customer.getName()%>���� ��ٱ��� ��Ȳ�Դϴ�.<br>
		<%
		int cnt = 0;
		for(PurchaseHistory PH: nowHistory ){
			cnt++;
			List<OrderProduct> oList = new LinkedList<OrderProduct>();
			oList = orderDao.getOrderbyHistroynum(PH.getHistoryNumber());
			%>��ȣ <%=cnt%><%=PH.toString() %><br>
			<%for(OrderProduct Oproduct:oList){
				
				 %>
					��ǰ ����<%=Oproduct.toString() %><br>
					��ǰ ����<%=productDao.getProductbyPnum(Oproduct.getProductNumber()).toString() %>
					<% 
				
			}
		}
		%>
	</div>




</body>
</html>