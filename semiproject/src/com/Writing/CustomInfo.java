package com.Writing;

public class CustomInfo {
	
	private String userId;

	private String userName;

	//�α��� ������ Session �� id, name ������ �÷��ΰ�, index.jsp�� redirect ����. 

	//���ǿ� �ø� ������ id�� name�� ��� Ŭ����(CustomInfo) ����

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
