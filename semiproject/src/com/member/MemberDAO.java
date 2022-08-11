package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class MemberDAO {

	private Connection conn = null;

	public MemberDAO(Connection conn) {
		this.conn = conn;

	}

	// num의 최대값 구하기
	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from member";

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
	public int insertData(MemberDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into member(num,id,pw,name,birth) ";
			sql += " values(?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getBirth());
			// pstmt.setString(5, dto.getAddress());
			// pstmt.setString(6, dto.getTel());
			// pstmt.setString(7, dto.getGender());
			// pstmt.setString(8, dto.getDate());
			// pstmt.setString(9, dto.getIpAddr());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());

		}
		return result;

	}

	// 아이디 검증
	public boolean registerCheck(String id) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean result = false;
		try {
//			sql = "select nvl(id, 0) from member where id=?";
			sql = "select count(id) from member where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
				
			//true면 중복이고 이미 있는 아이디
			if (rs.next()) {
				if(rs.getInt(1) != 0) {
					result = true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}

	// 데이터 읽어오기 - 로그인 할 때
	public MemberDTO getReadData(String id) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO dto = null;
		String sql;

		try {
			// id로 select 해온다.
			sql = "select num,id,pw,name,email,address,tel,gender,birth ";
			sql += "from member where id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new MemberDTO();

				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getString("gender"));
				dto.setBirth(rs.getString("birth"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	// 데이터 읽어오기 - 로그인 할 때
	public MemberDTO getReadDataNum(int pNum) {

		MemberDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			// id로 select 해온다.
			sql = "select num,id,pw,name,email,address,tel,gender,birth ";
			sql += "from member where num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, pNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new MemberDTO();

				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getString("gender"));
				dto.setBirth(rs.getString("birth"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	// //아이디와 비밀번호가 맞는지 체크
	// public boolean isLogin(String id, String pw)
	// {
	// boolean flag=false;
	//
	// Connection conn=null;
	// PreparedStatement pstmt=null;
	// ResultSet rs=null;
	//
	// String sql="select * from member where id=? and pw=?";
	//
	// conn=db.getConnection();
	//
	// try {
	// pstmt=conn.prepareStatement(sql);
	//
	// pstmt.setString(1, id);
	// pstmt.setString(2, pw);
	//
	// rs=pstmt.executeQuery();
	//
	// //비밀번호가 맞는 데이터가 있으면 true 반환
	// if(rs.next())
	// flag=true;
	// } catch (Exception e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }finally {
	// try {
	// rs.close();
	// pstmt.close();
	// conn.close();
	// } catch (Exception e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	//
	// }
	//
	// return flag;
	// }

	// 회원정보 수정
	public int updateData(MemberDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update member set pw=?, email=?,address=?,tel=?,gender=? ";
			sql += "where id=?";

			pstmt = conn.prepareStatement(sql);
			System.out.println(dto.getBirth());
			// pstmt.setString(1, dto.getName());
//			pstmt.setInt(1, dto.getNum());
//			pstmt.setString(2, dto.getId());
			pstmt.setString(1, dto.getPw());
//			pstmt.setString(4, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getGender());
//			pstmt.setString(9, dto.getBirth());
			pstmt.setString(6, dto.getId());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	// 데이터 지우기
	public  int delete(MemberDTO dto) {


		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "delete from member where id=?";
			
			pstmt=conn.prepareStatement(sql);


			pstmt.setString(1, dto.getId());

			result=pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}
	
}
