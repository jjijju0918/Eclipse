package newmembership;

import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;
import common.JDBConnect;



public class NewmemberDAO extends JDBConnect{
	
	public NewmemberDTO getNewmemberDTO(String id, String pass) {
		NewmemberDTO dto = new NewmemberDTO();
		String query = "select * from newmember where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2,  pass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setBirth(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setNumber(rs.getString(7));
				dto.setAddress(rs.getString(8));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public int join(String id, String pass, String name, String gender, String birth , String email , String number, String address) { //회원가입함수
		String query = "INSERT INTO newmember VALUES (?,?,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pass); 
			psmt.setString(3, name);
			psmt.setString(4, gender);
			psmt.setString(5, birth);
			psmt.setString(6, email);
			psmt.setString(7, number);
			psmt.setString(8, address);
			psmt.executeUpdate();
			
			System.out.println("회원가입 완료");
			
		} catch(SQLIntegrityConstraintViolationException f) {
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public NewmemberDTO getupdateuser(String id) {
		try {//유저데이터가져오기 
			PreparedStatement pst = con.prepareStatement("SELECT * FROM newmember WHERE id = ?");
			pst.setString(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				
				NewmemberDTO dto = new NewmemberDTO();
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setBirth(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setNumber(rs.getString(7));
				dto.setAddress(rs.getString(8));
				return dto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int updatemember(String id, String pass ,String name, String gender, String birth, String email, String number,String address) {
		//회원수정
		String query = "UPDATE newmember SET pass=?, name=?, gender=?, birth=?, email=?, number=?, address=? WHERE id=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, pass);
			psmt.setString(2, name);
			psmt.setString(3, gender);
			psmt.setString(4, birth);
			psmt.setString(5, email);
			psmt.setString(6, number);
			psmt.setString(7, address);
			psmt.setString(8, id);
			psmt.executeUpdate();
			
			System.out.println("탈퇴 완료");
			
		} catch(SQLIntegrityConstraintViolationException f) {
			return 0;
	} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int Delete(String id) {
		String query = "DELETE FROM newmember WHERE id = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			return psmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}