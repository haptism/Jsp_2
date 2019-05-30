package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class NoticeDAO {
	
	//delete
	public int delete(int num) throws Exception {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql ="delete notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//update
	public int update(NoticeDTO noticeDTO) throws Exception {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql ="update notice set title=?, contents=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//insert
	public int insert(NoticeDTO noticeDTO)throws Exception{
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql ="insert into notice values(notice_seq.nextval, ?,?,?, sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setString(3, noticeDTO.getWriter());
		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//selectOne
	public NoticeDTO selectOne(int num)throws Exception{
		NoticeDTO noticeDTO= null;
		Connection con = DBConnector.getConnect();
		String sql ="select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return noticeDTO;
	}
	
	//selectList
	public ArrayList<NoticeDTO> selectList()throws Exception{
		ArrayList<NoticeDTO> ar = new ArrayList<NoticeDTO>();
		Connection con = DBConnector.getConnect();
		String sql="select num, title, writer, reg_date, hit from notice order by num desc";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
			
		}
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	

}
