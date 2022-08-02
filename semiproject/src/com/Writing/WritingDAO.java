package com.Writing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;




public class WritingDAO {
	
	// 의존성주입
	private Connection conn;

	public WritingDAO(Connection conn) {
		this.conn = conn;
	}

	// num의 최대값
	public int getMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from writing ";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;
	}
	
	// 입력

	public int insertData(WritingDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "insert into writing (membernum,num,id,pw,name,email,subject,content,hitCount,savePath) ";
			sql += "values (?,?,?,?,?,?,?,?,0,sysdate) ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getMembernum());
			pstmt.setInt(2, dto.getNum());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getPw());
			pstmt.setString(5, dto.getName());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getSubject());
			pstmt.setString(8, dto.getContent());

			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;


	}
	//전체 데이터 조회
	public List<WritingDTO> getLists(int start, int end, String searchKey, String searchValue) {

		// rownum�� �Ű������� �Ҵ��ؼ� �ش������ ����Ʈ�� ���
		List<WritingDTO> lists = new ArrayList<WritingDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			searchValue = "%" + searchValue + "%"; //�ۼ�Ʈ ���̴� ������ 2�ڰ� ���°� ��ã�°�

			// ����¡ �ϴ� �ڵ�
			sql = "select * from ( ";
			sql += "select rownum rnum, data.* from ( ";
			sql += "select membernum,num,name,subject,hitCount,";
			sql += "to_char(savePath,'YYYY-MM-DD') savePath ";
			//sql += "from board order by num desc) data) ";
		    sql += "from writing where " +searchKey+ " like ? order by num desc) data) ";	   	   
			sql += "where rnum >= ? and rnum <=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				WritingDTO dto = new WritingDTO();
				dto.setMembernum(rs.getInt("membernum"));
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitcount(rs.getInt("hitCount"));
				dto.setsavePath(rs.getString("savePath"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	// 전체데이터의 갯수 카운팅
	public int getDataCount(String searchKey,String searchValue) {

		int totalDataCount = 0;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql;

		try {
			
			  
			searchValue = "%" + searchValue + "%";

			sql = "select nvl(count(*),0) from writing ";
			sql+= "where " + searchKey + " like ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalDataCount = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return totalDataCount;
	}
	
	// num으로 조회한 데이터

	public WritingDTO getReadData(int num) {

		WritingDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select membernum, num, id, pw, name, email, subject, content, hitCount, savePath ";
			sql += "from writing where num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new WritingDTO();
				dto.setMembernum(rs.getInt("membernum"));
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));				
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHitcount(rs.getInt("hitCount"));
				dto.setsavePath(rs.getString("savePath"));

			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	// 조회수 증가
	public int updateHitCount(int num) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "update writing set hitCount = hitCount+1 ";
			sql += "where num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	// 게시판 수정

		public int updateData(WritingDTO dto) {

			int result = 0;
			PreparedStatement pstmt = null;
			String sql;

			try {

				sql = "update writing set name=?, pw=?, email=?, subject=?,";

				sql += "content=? where num=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getPw());
				pstmt.setString(3, dto.getEmail());
				pstmt.setString(4, dto.getSubject());
				pstmt.setString(5, dto.getContent());
				pstmt.setInt(6, dto.getNum());

				result = pstmt.executeUpdate();
				pstmt.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;

		}
		
		// 게시판 삭제

		public int deleteData(int num) {

			int result = 0;
			PreparedStatement pstmt = null;
			String sql;

			try {

				sql = "delete writing where num=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, num);

				result = pstmt.executeUpdate();

				pstmt.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;

		}

}
