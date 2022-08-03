package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

		private Connection conn = null;
		
		public MemberDAO(Connection conn) {
			this.conn = conn;
		
		}
		

		//입력
		public int insertData(MemberDTO dto) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			
			try {
				
				sql = "insert into member(id,pw,name,date) ";
				sql += "values (?,?,?,?)";
				
				pstmt = conn.prepareStatement(sql);
				
				
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getDate());
	
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return result;
			
		}
		
		
		//아이디 검증
		public int registerCheck(String id) {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "select * from member where id=?";
			
			try {
				
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return 0; //이미 존재하는 회원
				}
				else {
					return 1; //가입 가능한 회원
				}
				
			
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return -1; //DB오류
		}
		
		
		
		//데이터 읽어오기 - 로그인 할 때
		public MemberDTO getReadData(String id) {
			
			MemberDTO dto = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			
			try {
				//id로 select 해온다.
				sql = "select num,id,pw,name,email,address,tel,gender,date ";
				sql+= "from member where id=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto = new MemberDTO();
					
					dto.setNum(rs.getInt("num"));
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
					dto.setAddress(rs.getString("address"));
					dto.setTel(rs.getString("tel"));
					dto.setGender(rs.getString("gender"));
					dto.setDate(rs.getString("date"));
					
					
					
				}
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return dto;
			
			
		}
		
		//회원정보 수정
		public int updateDate(MemberDTO dto) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				
				sql = "update member set num=?,id=?,pw=?,name=?,email=?,address=?,tel=?,gender=?,date=?,";
				sql+= " where id=?";
				
				pstmt =conn.prepareStatement(sql);
				//pstmt.setString(1, dto.getName());
				pstmt.setInt(1, dto.getNum());
				pstmt.setString(2, dto.getId());
				pstmt.setString(3, dto.getPw());
				pstmt.setString(4, dto.getName());
				pstmt.setString(5, dto.getEmail());
				pstmt.setString(6, dto.getAddress());
				pstmt.setString(7, dto.getTel());
				pstmt.setString(8, dto.getGender());
				pstmt.setString(9, dto.getDate());
				pstmt.setString(10, dto.getId());
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
		
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return result;
			
		}
		
		
	}