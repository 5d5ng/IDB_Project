package dto;

public class OrderProduct {

	private int OrderNumber;
	private int Quantity;
	private String CustomerID;
	private int ProductNumber;
	private int HistoryNumber;
	
	public int getOrderNumber() {
		return OrderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		OrderNumber = orderNumber;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public String getCustomerID() {
		return CustomerID;
	}
	public void setCustomerID(String customerID) {
		CustomerID = customerID;
	}
	public int getProductNumber() {
		return ProductNumber;
	}
	public void setProductNumber(int productNumber) {
		ProductNumber = productNumber;
	}
	public int getHistoryNumber() {
		return HistoryNumber;
	}
	public void setHistoryNumber(int historyNumber) {
		HistoryNumber = historyNumber;
	}

	public OrderProduct(int orderNumber, int quantity, String customerID, int productNumber, int historyNumber) {
		super();
		OrderNumber = orderNumber;
		Quantity = quantity;
		CustomerID = customerID;
		ProductNumber = productNumber;
		HistoryNumber = historyNumber;
	}
	@Override
	public String toString() {
		return "상품주문번호:" + OrderNumber + ", 주문수량:" + Quantity + ", 고객ID" + CustomerID
				+ ", 상품번호:" + ProductNumber + "구매내역번호:" + HistoryNumber + "]";
	}
	
	
	
	
}
