package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import common.JDBConnect;
import java.sql.*;


public class BoardDAO extends JDBConnect {

	// 게시물 가져오기
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "select count(*) from board ";
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " "
					+ " Like '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
		
	}
	
	public List<BoardDTO> selectList (Map<String, Object> map, int first, int last){
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "select * from board ";
		if(map.get("searchWord") != null) {
			query += " where "+ map.get("searchField") + " "
					+ " Like '%"+ map.get("searchWord") +"%' " ;
		}
		query += " order by num desc limit " + first + ", " + last;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("Postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitCount"));
					
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "select B.*, M.name "
				+ " From newmember M inner Join board B "
				+ " on M.id = B.id "
				+ " where num=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitCount(String num) {
		String query = "update board set visitcount = visitcount+1 where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
	public int Write(String title, String content, String id) {
		// 글쓰기
		String query = "INSERT INTO board(title,content,id,visitcount) values(?,?,?,?)";
		
		try {
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, id);
			psmt.setInt(4, 0);
			
			return psmt.executeUpdate(); 
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1 ;
	}
	
	public int update(String num, String title, String content) {
		//수정하기
		String query = "UPDATE board SET title=?, content=? WHERE num=?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, num);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1 ;
	}
	
	public int delete(String num) {//삭제
		String query = "delete from board WHERE num = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	

}
