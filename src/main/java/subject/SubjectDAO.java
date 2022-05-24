package subject;

import db.*;


import java.sql.*;
import java.util.*;


public class SubjectDAO {

	private static SubjectDAO sDao = new SubjectDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result = 0;
	
	private SubjectDAO() {
		super();
	}
	
	public static SubjectDAO getInstance() {
		return sDao;
	}
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int nextval() {
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT MAX(s_id) ").append("FROM subject");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt("MAX(s_id)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int insert(SubjectDTO dto) {
		 
		 conn = ConnectionDB.getConnection();
		 StringBuffer query = new StringBuffer();
		 query.append("insert into Subject ");
		 query.append("values (?,?,?,?,?,?,?)");
		 
		 try {
			 pstmt = conn.prepareStatement(query.toString());
			 pstmt.setInt(1, dto.getS_id());
			 pstmt.setString(2, dto.getS_name());
			 pstmt.setString(3, dto.getS_code());
			 pstmt.setString(4, dto.getS_start());
			 pstmt.setString(5, dto.getS_end());
			 pstmt.setString(6, dto.getS_manage());
			 pstmt.setString(7, dto.getS_professor());
			

			 return pstmt.executeUpdate();
			 
			 
			 
		 } catch(SQLException e) {
			 e.printStackTrace();
		 } finally {
			 close(conn, pstmt, null);
		 }
		 return -1;
	}
	
	public List<SubjectDTO> subjectList(){

		List<SubjectDTO> list = new ArrayList<>();
		
		try {
			conn = ConnectionDB.getConnection();
			String sql = "select * from subject where s_id ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				SubjectDTO tmp = new SubjectDTO();
				tmp.setS_id(rs.getInt(1));
				tmp.setS_name(rs.getString(2));
				tmp.setS_code(rs.getString(3));
				tmp.setS_start(rs.getString(4));
				tmp.setS_end(rs.getString(5));
				tmp.setS_manage(rs.getString(6));
				tmp.setS_professor(rs.getString(7));
			
				list.add(tmp);
				
			}

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}
}
