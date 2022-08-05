package com.util;

public class MyPage {

	//��ü �������� ����
	//numPerPage �ϳ��� �������� ��� ����
	//dataCount ��ü�������� ����
	public int getPagecount(int numPerPage,int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;//34/3
		
		if(dataCount % numPerPage != 0) {
			pageCount++;
		}
		
		return pageCount;
	}
	
	
	//����¡ ó�� �޼ҵ�
	public String pageIndexList(int currentPage,int totalPage,String listUrl) {
		
		int numPerBlock = 5; //������6 7 8 9 10 ������ ����
		int currentPageSetup;//������ ���� �� �������������� ������������
		int page;//for���� i�� �������� 
		//curruntpage : ���� ���� ������� ������
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0||totalPage==0) {
			return ""; //���ڰ��̾ȿ��� ����������
		}
		
		//���ư��� �ּ�
		//list.jsp�� �⺻
		// �˻��� �ּ� list.jsp?serchKey=subject&serchValue=111
		if(listUrl.indexOf("?")!=-1) {//����ǥ�� ������
			listUrl = listUrl + "&";
			//list.jsp?serchKey=subject&serchValue=111&pageNum=3
		}else {//����ǥ�� ������
			listUrl = listUrl + "?";
			//list.jsp?pageNum=3
		}
		
		//����
		//1 2 3 4 5 ������
		//������6 7 8 9 10 ������
		//������11 12 13 14 15 ������
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		//������
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl + "pageNum="
					+ currentPageSetup + "\">◀이전</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">������<a>&nbsp;
		}
		
		// 1 2 3 4 5 ������
		//������6 7 8 9 10 ������
		//������11 12 13 14 15 ������
		
		//�ٷΰ��� ������
		page = currentPageSetup + 1;
		
		while(page<=totalPage && page <= (currentPageSetup + numPerBlock)) {
			
			if(page==currentPage) {
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
				//<font color="Fuchsia">9</font>&nbsp;
			}else {
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">"
						+ page + "</a>&nbsp;");
				//<a href="list.jsp?pageNum=2">2</a>&nbsp;
			}
			page++;
			
		}
		//������
		//������6 7 8 9 10 ������
		//������ 11 12
		if(totalPage-currentPageSetup>numPerBlock) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page +
					"\">다음▶</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">������</a>&nbsp;
			
		}
		
		return sb.toString();
	}
}
