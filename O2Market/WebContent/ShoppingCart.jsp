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
<link rel="stylesheet" type="text/css" href="Cart.css">
	<%

	
		request.setCharacterEncoding("euc-kr");
		Customer customer = (Customer) session.getAttribute("pCustomer"); //�α��� ��

		
		if (customer == null) {
			System.out.print("sssqs");
			response.sendRedirect("Login.jsp");
		}
		

		OrderProductDao orderDao = new OrderProductDao();
		ProductDao productDao = new ProductDao();
		PurchasHistoryDao PHistoryDao = new PurchasHistoryDao();

		List<OrderProduct> orderList = orderDao.getOrders();
		List<Product> productList = productDao.getProduct();
		List<PurchaseHistory> historyList = PHistoryDao.getPurchaseHistories(); // ���� �α��� ���� ���Ÿ���Ʈ

		String cID = customer.getCustomerID();
		String status = "���� ���"; // �������̶�� �ǹ�

		Product nowProduct = (Product) session.getAttribute("order"); //���� ��ǰ
		//session.removeAttribute("order");
		System.out.println(nowProduct.getProductName());
		

		System.out.print(nowProduct.toString());
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
<%=customer.getName()%>���� ��ٱ��� ��Ȳ�Դϴ�.<br>



<%	ProductDao PDao = new ProductDao();
String parm = request.getParameter("order");
int k = Integer.parseInt(parm)-1;
%>

<br><br><br><br><br>
<div id="container">
<table>
  <tr class="p">
    <td class="image"><img src="./Category/images/<%=productList.get(k).getProductNumber() %>.jpg"/></td>
    <td class="name"><%=productList.get(k).getProductName()%></td>
    <td class="price"><%=productList.get(k).getProductPrice()%></td>
    <td class="amount"><input type="number" value="1" min="0" /></td>
    <td class="pricesubtotal"></td>
    <td class="remove"><div>&times</div></td>
  </tr>
  <tr>
    <td> </td>
    <td> </td>
    <td> </td>
    <td>Total Price:</td>
    <td class="totalpricesubtotal"></td>
    <td> </td>
  </tr>
  <tr>
    <td style="border-top:1px solid white" colspan="6"><br />
      <span class="big">Total: <span class="realtotal">0</span></span>
    </td>
  </tr>
</table>
  <div id="checkout">Checkout<span> &rarr;</span></div>
<div id="footer">
  <ul>
    <li>Change the amount of stuff and see the subtotal and total change</li>
    <li>Try to change the amount of items to minus amounts or 0</li>
    <li>Delete items and see the totals change</li>
  </ul>
  <hr />
  Thank you for purchasing our product!
  <br />
  Internet Database Term Project
</div>
</div>

</body>
</html>