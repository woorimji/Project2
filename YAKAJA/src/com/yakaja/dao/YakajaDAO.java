package com.yakaja.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.haeva.my.Haevalogin;
import com.haeva.my.HaevafindPW;
import com.yakaja.db.DBConn;
import com.yakaja.vo.ReservVO;
import com.yakaja.vo.YakajaVO;
import com.yakaja.vo.HotelVO;
import com.yakaja.vo.ReviewVO;

public class YakajaDAO {
	PreparedStatement pstmt = null;
	private Connection con;
	ResultSet rs = null;

	public YakajaDAO() {
		try {
			con = new DBConn().getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean insertData(String id, String pw, String email, String name, String tel, int admin)
			throws SQLException {

		String sql = "insert into pr2member values (?,?,?,?,?,?)";
		// (MEM_ID, MEM_PW, MEM_EMAIL, MEM_NAME, MEM_TEL, MEM_ADMIN) ";
		// sql += "values (?,?,?,?,?,?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, email);
		pstmt.setString(4, name);
		pstmt.setString(5, tel);
		pstmt.setInt(6, admin);

		pstmt.executeUpdate();

		return true;
	}

	public YakajaVO memberLogin(String id, String pw) {
		String sql = "SELECT * FROM HR.PR2MEMBER WHERE MEM_ID = ? AND MEM_PW = ?";
		YakajaVO tidao1 = null;
		System.out.println(id);
		System.out.println(pw);

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				tidao1 = new YakajaVO();

				// 필요한 데이터를 추출하여 YakajaVO 객체에 할당
				tidao1.setmem_id(rs.getString("MEM_ID"));
				tidao1.setMemPw(rs.getString("MEM_PW"));
				tidao1.setMemEmail(rs.getString("MEM_EMAIL"));
				tidao1.setMemName(rs.getString("MEM_NAME"));
				tidao1.setMemTel(rs.getString("MEM_TEL"));
				tidao1.setMemAdmin(rs.getInt("MEM_ADMIN"));

				// 나머지 필드도 필요에 따라 추가
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResources();
		}

		return tidao1;
	}

	private void closeResources() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public YakajaVO findID(String name, String email) {
		// 아이디 찾기 메서드
		String sql = "select * from pr2member where mem_name = ? and mem_email =?";
		ResultSet rs = null;
		YakajaVO tidao1 = null; // 회원정보를 저장하는 객체

		System.out.println(name);
		System.out.println(email);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				tidao1 = new YakajaVO();
				tidao1.setMemName(rs.getString("MEM_NAME"));
				tidao1.setMemEmail(rs.getString("MEM_EMAIL"));
				tidao1.setmem_id(rs.getString("MEM_ID"));
			} else {
				tidao1 = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return tidao1;
	}

	public YakajaVO findPW(String id, String name) {
		// 비밀번호 찾기 메서드
		String sql = "select * from pr2member where mem_id = ? and mem_name =?";
		ResultSet rs = null;
		YakajaVO tidao1 = null; // 회원정보를 저장하는 객체

		System.out.println(id);
		System.out.println(name);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				tidao1 = new YakajaVO();
				tidao1.setmem_id(rs.getString("MEM_ID"));
				tidao1.setMemName(rs.getString("MEM_NAME"));
				tidao1.setMemPw(rs.getString("MEM_PW"));
			} else {
				tidao1 = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return tidao1;
	}

	public YakajaVO MyInfo(String id, String email, String name, String tel) {

		String sql = "select * from pr2member where mem_id = ? and mem_email = ? and mem_name = ? and mem_tel =?";

		ResultSet rs = null;
		YakajaVO tidao1 = null;

		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				tidao1 = new YakajaVO();

				// 필요한 데이터를 추출하여 YakajaVO 객체에 할당
				tidao1.setmem_id(rs.getString("MEM_ID"));
				tidao1.setMemEmail(rs.getString("MEM_EMAIL"));
				tidao1.setMemName(rs.getString("MEM_NAME"));
				tidao1.setMemTel(rs.getString("MEM_TEL"));

			} else {
				tidao1 = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return tidao1;
	}

	public ArrayList<ReservVO> ResevInfo(String mem_id) {

		String sql = "SELECT * FROM pr2reserv where mem_id = ?";
		ResultSet rs = null;
		ReservVO tidao1 = null;
		ArrayList<ReservVO> listReserv = new ArrayList<ReservVO>();

		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				tidao1 = new ReservVO();

				tidao1.setReserv_id(rs.getInt("reserv_id"));
				tidao1.setRoom_num(rs.getInt("room_num"));
				tidao1.setHotel_id(rs.getInt("hotel_id"));
				tidao1.setRoom_price(rs.getInt("room_price"));
				tidao1.setReserv_in(rs.getString("reserv_in"));
				tidao1.setReserv_out(rs.getString("reserv_out"));
				tidao1.setMem_id(rs.getString("mem_id"));

				listReserv.add(tidao1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listReserv;
	}

	public boolean updateData(String id, String pw, String email, String name, String tel, int admin) {

		String sql = "UPDATE pr2member SET mem_pw = ?, mem_email = ?, mem_name = ?, mem_tel = ? WHERE mem_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			// pstmt.setString(1, id);
			pstmt.setString(1, pw);
			pstmt.setString(2, email);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public boolean delete(String id) {
		String sql = "delete from pr2member where mem_id = ?";
		ResultSet rs = null;
		YakajaVO tidao1 = null;

		System.out.println(id);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean isValidPassword(String id, String pw) {
		try {
			// 사용자 정보 가져오기
			YakajaVO tidao1 = getUserById(id);

			// 비밀번호 검증
			return tidao1.getMemPw().equals(pw);
		} catch (Exception e) {
			// 예외 처리
			e.printStackTrace();

		}
		return false;
	}

	public YakajaVO getUserById(String id) {
		YakajaVO tidao1 = null;
		ResultSet rs = null;
		String sql = "select * from pr2member where mem_id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 결과가 있는 경우에만 YakajaVO 객체 생성
				tidao1 = new YakajaVO();
				tidao1.setmem_id(rs.getString("mem_id"));
				tidao1.setMemPw(rs.getString("mem_pw"));
				// ... 나머지 필드 설정
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// ResultSet, PreparedStatement 닫기
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
		}

		return tidao1;
	}
	
	public boolean Resvdelete(String reserv_id) {
		String sql = "delete from pr2reserv where reserv_id = ?";
		ResultSet rs = null;
		ReservVO reservVO = null;
		
	
		System.out.println("ASD"+reserv_id);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reserv_id);
			pstmt.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

public ReservVO Resvdata(int reserv_id) {
	
	ReservVO reservvo = null;
	ResultSet rs = null;
	String sql = "select * from pr2reserv where reserv_id = ?";
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, reserv_id);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			// 결과가 있는 경우에만 YakajaVO 객체 생성
			reservvo = new ReservVO();
			reservvo.setReserv_id(rs.getInt("RESERV_ID"));

		}

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		// ResultSet, PreparedStatement 닫기
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
	}

	return reservvo;
}

	public boolean insertReserv(int room_num, int room_price, int hotel_id, String reserv_in, String reserv_out,
		String mem_id) throws SQLException {

	String sql = "insert into pr2reserv values (pr2reserv_seq.nextval, ?, ?, ?, ?, ?, ?)";

	pstmt = con.prepareStatement(sql);

	pstmt.setInt(1, room_num);
	pstmt.setInt(2, room_price);
	pstmt.setInt(3, hotel_id);
	pstmt.setString(4, reserv_in);
	pstmt.setString(5, reserv_out);
	pstmt.setString(6, mem_id);

	pstmt.executeUpdate();

	return true;
}

	public boolean insertHotelData(String hotel_name, String hotel_address, int room_aprice, int room_bprice, int room_cprice, String mem_id, 
	int hotel_wifi, int hotel_pet, int hotel_bf, int hotel_rs, int hotel_ciga, int hotel_wc)
		throws SQLException {

	String sql = "insert into pr2hotel values (pr2hotel_sequence.nextval, ?, ?, ?, ?, ?, mod(pr2hotel_sequence.currval, 3), ?, ?, ?, ?, ?, ?, ?)";



	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, hotel_name);
	pstmt.setString(2, hotel_address);
	pstmt.setInt(3, room_aprice);
	pstmt.setInt(4, room_bprice);
	pstmt.setInt(5, room_cprice);
	pstmt.setString(6, mem_id);
	pstmt.setInt(7, hotel_wifi);
	pstmt.setInt(8, hotel_pet);
	pstmt.setInt(9, hotel_bf);
	pstmt.setInt(10, hotel_rs);
	pstmt.setInt(11, hotel_ciga);
	pstmt.setInt(12, hotel_wc);

	pstmt.executeUpdate();

	return true;
	}
	
	public boolean writeReview(String head, String mem_id, String body, int score, int hotelnum) {
		String sql = "insert into pr2review" + " values(pr2review_sequencel.nextval,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			// pstmt.setInt(1, number);
			pstmt.setString(1, head);
			pstmt.setString(2, mem_id);
			pstmt.setString(3, body);
			pstmt.setInt(4, score);
			pstmt.setInt(5, hotelnum);
			pstmt.executeUpdate();

			return true;

		} catch (Exception e) {
			System.out.println("no");
			return false;
		}

	}
	
	public String getHotelName(int num) throws SQLException {
		String sql="select hotel_name from pr2hotel where hotel_id="+num+"";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		String hotelname = null;
		while(rs.next()) {
			hotelname=rs.getString("hotel_name");
		}
		return hotelname;
		
	}
	
	public ArrayList<ReviewVO> getReviewInfo() throws SQLException {
		ArrayList<ReviewVO> riarray = new ArrayList<ReviewVO>();
		String sql = "select h.hotel_id, h.hotel_name, r.review_title, m.mem_name , r.review_content,"
				+ " r.review_score"
				+ " from pr2hotel h, pr2review r, pr2member m where h.hotel_id=r.hotel_id and r.mem_id=m.mem_id"
				+ " order by h.hotel_name";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String hotel_id = rs.getString("hotel_id");
			String hotel_name = rs.getString("hotel_name");
			String review_title = rs.getString("review_title");
			String mem_name = rs.getString("mem_name");
			String review_content = rs.getString("review_content");
			String review_score = rs.getString("review_score");
			ReviewVO tv = new ReviewVO(hotel_id, hotel_name, review_title, mem_name, review_content, review_score);
			riarray.add(tv);
		}
		return riarray;

	}
}
	
