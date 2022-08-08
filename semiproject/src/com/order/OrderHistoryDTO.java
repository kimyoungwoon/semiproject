package com.order;

public class OrderHistoryDTO {

	private int memberNum;
	private int orderNum;
	private int paymentCost;
	private String orderDate;
	
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getPaymentCost() {
		return paymentCost;
	}
	public void setPaymentCost(int paymentCost) {
		this.paymentCost = paymentCost;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
}
