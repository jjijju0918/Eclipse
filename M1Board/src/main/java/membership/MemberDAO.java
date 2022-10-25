package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect{
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2,  upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
