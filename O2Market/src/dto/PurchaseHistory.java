package dto;

public class PurchaseHistory {
	
	private int HistoryNumber;
	private String CustomerID;
	private int TotalCost;
	private String PaymentStatus;
	public int getHistoryNumber() {
		return HistoryNumber;
	}
	public void setHistoryNumber(int historyNumber) {
		HistoryNumber = historyNumber;
	}
	public String getCustomerID() {
		return CustomerID;
	}
	public void setCustomerID(String customerID) {
		CustomerID = customerID;
	}
	public int getTotalCost() {
		return TotalCost;
	}
	public void setTotalCost(int totalCost) {
		TotalCost = totalCost;
	}
	public String getPaymentStatus() {
		return PaymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		PaymentStatus = paymentStatus;
	}
	public PurchaseHistory(int historyNumber, String customerID, int totalCost, String paymentStatus) {
		super();
		HistoryNumber = historyNumber;
		CustomerID = customerID;
		TotalCost = totalCost;
		PaymentStatus = paymentStatus;
	}
	@Override
	public String toString() {
		return "�ֹ���ȣ:" + HistoryNumber + ", ȸ��ID=" + CustomerID + ", �Ѿ�:"
				+ TotalCost;
	}
	
}
