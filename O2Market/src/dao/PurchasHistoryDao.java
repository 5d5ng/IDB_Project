package dao;
import java.sql.*;
import java.util.*;

import dto.OrderProduct;
import dto.PurchaseHistory;
public class PurchasHistoryDao {
	private static  String dburl =  "jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe";
	private static  String dbUser = "db201512119";
	private static  String dbpasswd = "201512119";

	public List<PurchaseHistory> getPurchaseHistories(){
		List<PurchaseHistory> list = new LinkedList<>();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql  = "SELECT * FROM PurchaseHistory";
		try(Connection conn = DriverManager.getConnection(dburl,dbUser,dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)){
			try(ResultSet rs = ps.executeQuery()){
				while(rs.next()) {
					int historyNumber = rs.getInt(1);
					String customerID = rs.getString(2);
					int totalCost = rs.getInt(3);
					String paymentStatus = rs.getString(4);
					
					PurchaseHistory purchaseHistory = new PurchaseHistory(historyNumber, customerID, totalCost, paymentStatus);
					list.add(purchaseHistory);
				}
			}catch(Exception e) {
					e.printStackTrace();
			}	
				
			
		}catch(SQLException e ) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int addPurchaseHistory(PurchaseHistory purchaseHistory) {
		int insertCount = 0;
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");

			conn = DriverManager.getConnection(dburl,dbUser,dbpasswd);
			String sql =  "INSERT INTO PurchaseHistory VALUES (?,?,?,?)";
			
			ps = conn.prepareStatement(sql);
	
			ps.setInt(1, purchaseHistory.getHistoryNumber());
			ps.setString(2, purchaseHistory.getCustomerID());
			ps.setInt(3, purchaseHistory.getTotalCost());
			ps.setString(4, purchaseHistory.getPaymentStatus());

			insertCount = ps.executeUpdate();


		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			if(ps!=null) {
				try {
					ps.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}	
			if(conn!=null) {
				try {
					conn.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}

		}

		return insertCount;
		
	}
	
	public List<PurchaseHistory> getCustomerHistories(String CustomerID) {
		List<PurchaseHistory> list = new LinkedList<>();

		Connection conn = null;
		PreparedStatement ps = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");

			conn = DriverManager.getConnection(dburl,dbUser,dbpasswd);
			String sql =  "SELECT * FROM PurchaseHistory WHERE CustomerID = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, CustomerID);
			
			ResultSet rs = ps.executeQuery();
			System.out.print("ss");
				while(rs.next()) {
					int historyNumber = rs.getInt(1);
					String customerID = rs.getString(2);
					int totalCost = rs.getInt(3);
					String paymentStatus = rs.getString(4);
					
					PurchaseHistory purchaseHistory = new PurchaseHistory(historyNumber, customerID, totalCost, paymentStatus);
					list.add(purchaseHistory);
				}
			}catch(Exception e) {
					e.printStackTrace();
			}



		return list;
		
	}
	
	public void updatePurchaseHisory(int productCost,int historyNum) { 
		String sql = "UPDATE PurchaseHistory set totalcost = totalcost+? where Historynumber = ? ";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,productCost);
			ps.setInt(2,historyNum);
			
			int num = ps.executeUpdate();
			ps.close();
			conn.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	public void updatePurchaseStatus(int historyNum) { 
		String sql = "UPDATE PurchaseHistory set paymentStatus = '결제완료' where Historynumber = ? ";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,historyNum);
			
			int num = ps.executeUpdate();
			ps.close();
			conn.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	public void deletePurchaseHistory(int historyNum) { //
		String sql = "DELETE from PurchaseHistory where historynumber = ?";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,historyNum);
		
			
			int num = ps.executeUpdate();
			ps.close();
			conn.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
