package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iu.util.DBConnector;

public class MemberDAO {
	//idCheck
	public int idCheck(String id)throws Exception{
		int result=0;//0이면 사용가능한 ID 1이면 이미사용중(불가능)
		Connection con = DBConnector.getConnect();
		String sql ="select id from member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			result=1;
		}
		DBConnector.disConnect(rs, st, con);
		
		return result;
	}
	
	//delete memberDelete()
	public int memberDelete(String id)throws Exception{
		int result=0;
		Connection con= DBConnector.getConnect();
		String sql = "delete member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//update. update()
	public int memberUpdate(MemberDTO memberDTO)throws Exception{
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql ="update member set pw=?, name=?, phone=?, email=?, age=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getName());
		st.setString(3, memberDTO.getPhone());
		st.setString(4, memberDTO.getEmail());
		st.setInt(5, memberDTO.getAge());
		st.setString(6, memberDTO.getId());
		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	
	//login
	public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
		MemberDTO m=null;
		Connection con = DBConnector.getConnect();
		String sql="select * from member where id=? and pw=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			m = new MemberDTO();
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getString("phone"));
			m.setEmail(rs.getString("email"));
			m.setAge(rs.getInt("age"));
		}
		DBConnector.disConnect(rs, st, con);
		
		return m;
		
	}
	
	//join
	public int memberJoin(MemberDTO memberDTO)throws Exception{
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql ="insert into member values(?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getPhone());
		st.setString(5, memberDTO.getEmail());
		st.setInt(6, memberDTO.getAge());
		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
}
