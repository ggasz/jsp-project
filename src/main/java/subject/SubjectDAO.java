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
		query.append("values (?,?,?,?,?,?,?,?,?)");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, dto.getS_id());
			pstmt.setString(2, dto.getS_name());
			pstmt.setString(3, dto.getS_code());
			pstmt.setString(4, dto.getS_start());
			pstmt.setString(5, dto.getS_end());
			pstmt.setString(6, dto.getS_manage());
			pstmt.setString(7, dto.getS_professor());
			pstmt.setString(8, dto.getS_member());
			pstmt.setString(9, dto.getS_empoyee());

			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return -1;
	}
	
	
	/*
	 * public List<SubjectDTO> getList(int pageNumber){//특정한 리스트를 받아서 반환
	 * ArrayList<SubjectDTO> list = new ArrayList<SubjectDTO>(); try { conn =
	 * ConnectionDB.getConnection(); String
	 * SQL="select * from subject where s_id order by s_id desc limit 10"; pstmt =
	 * conn.prepareStatement(SQL);
	 * 
	 * // pstmt.setInt(1, getNext()-(pageNumber-1)*10);//물음표에 들어갈 내용
	 * rs=pstmt.executeQuery(); while(rs.next()) { SubjectDTO tmp = new
	 * SubjectDTO();
	 * 
	 * tmp.setS_id(rs.getInt(1)); tmp.setS_name(rs.getString(2));
	 * tmp.setS_code(rs.getString(3)); tmp.setS_start(rs.getString(4));
	 * tmp.setS_end(rs.getString(5)); tmp.setS_manage(rs.getString(6));
	 * tmp.setS_professor(rs.getString(7));
	 * 
	 * list.add(tmp);//list에 해당 인스턴스를 담는다. } } catch(Exception e) {
	 * e.printStackTrace(); } return list;//ㄱㅔ시글 리스트 반환 }
	 */

	
	
	  public List<SubjectDTO> subjectList(){
	  
	  List<SubjectDTO> list = new ArrayList<>();
	  
	  try { conn = ConnectionDB.getConnection(); String sql =
	  "select * from subject where s_id "; pstmt = conn.prepareStatement(sql); rs =
	  pstmt.executeQuery();
	  
	  
	  while (rs.next()) { SubjectDTO tmp = new SubjectDTO();
	  tmp.setS_id(rs.getInt(1)); tmp.setS_name(rs.getString(2));
	  tmp.setS_code(rs.getString(3)); tmp.setS_start(rs.getString(4));
	  tmp.setS_end(rs.getString(5)); tmp.setS_manage(rs.getString(6));
	  tmp.setS_professor(rs.getString(7));
	  
	  list.add(tmp); }
	  
	  } catch(SQLException e){ e.printStackTrace(); } finally { close(conn,
	  pstmt,rs); } return list; }
	 
	 

	public int update(SubjectDTO dto) {
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("update subject set ");
		query.append(
				"s_name = ?, s_code = ?, s_start = ?, s_end = ?, s_manage = ?, s_professor = ? , s_member = ?, s_empoyee =?");
		query.append("where s_id = ?");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, dto.getS_name());
			pstmt.setString(2, dto.getS_code());
			pstmt.setString(3, dto.getS_start());
			pstmt.setString(4, dto.getS_end());
			pstmt.setString(5, dto.getS_manage());
			pstmt.setString(6, dto.getS_professor());
			pstmt.setString(7, dto.getS_member());
			pstmt.setString(8, dto.getS_empoyee());

			pstmt.setInt(9, dto.getS_id());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return -1;
	}

	public SubjectDTO selectOne(int s_id) {
		String sql = "select * from subject where s_id = ?";

		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SubjectDTO sb = new SubjectDTO();
				sb.setS_id(rs.getInt(1));
				sb.setS_name(rs.getString(2));
				sb.setS_code(rs.getString(3));
				sb.setS_start(rs.getString(4));
				sb.setS_end(rs.getString(5));
				sb.setS_manage(rs.getString(6));
				sb.setS_professor(rs.getString(7));
				sb.setS_member(rs.getString(8));
				sb.setS_empoyee(rs.getString(9));

				return sb;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return null;
	}

	public int delete(int s_id) {
		String sql = "delete from subject where s_id = ?";

		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}

	public ArrayList<SubjectDTO> getSearch(String searchField, String searchText) {// 특정한 리스트를 받아서 반환
		ArrayList<SubjectDTO> list = new ArrayList<>();
		String SQL = "select * from subject WHERE " + searchField.trim() + " like ?";
		// System.out.println(searchField+"/"+searchText); //데이터 입력값 확인
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + searchText + "%");
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;// ㄱㅔ시글 리스트 반환
	}

	public int getNext() {
		String SQL = "SELECT s_id from subject order by s_id DESC";// 마지막 게시물 반환
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}

	public int getCount() {
		String SQL = "select count(*) from subject";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public boolean nextPage(int pageNumber) {// 페이지 처리를 위한 함수
		String SQL = "SELECT * from subject where s_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;// 다음 페이지로 넘어갈 수 있음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
