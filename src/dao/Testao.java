package dao;

import getConnection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import bean.Student;

public class Testao {
	private Connection conn;
	private PreparedStatement pstat;
	String sql = "";

	public void acceptStudent(String id) {
		updateStatus(id, "Y");
	}
	
	public void denyStudent(String id) {
		updateStatus(id, "D");
	}
	
	void updateStatus(String id,String status) {
		try {
			conn = GetConnection.getConnection();
			sql = "update cms_register_student set isAccept = '" + status + "' where id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstat!=null) {
				try {
					pstat.close();
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
	}
	
	public void deleteStudent(String id) {
		try {
			conn = GetConnection.getConnection();
			sql = "delete from cms_register_student where id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstat!=null) {
				try {
					pstat.close();
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
	}
	
	public List<Student> getAllStudents() {
		return getStudents("");
	}
	public List<Student> getAcceptedStudents() {
		return getStudents("where isAccept = 'Y'");
	}
	
	public String getStatusById(String tidcard, String ttel) {
		List<Student> list = getStudents(" where idcard = '" + tidcard + "' and tel = '" + ttel + "'");
		if(list==null || list.size()<1) {
			return null;
		} else {
			Student student = list.get(0);
			return student.getIsAcceptInner();
		}
	}
	
	List<Student> getStudents(String whereSql) {
		List<Student> acceptedStudents = new ArrayList<Student>();
		ResultSet rs = null;
		try {
			conn = GetConnection.getConnection();
			sql = "select id,name,sex,type,school,academy,major,grade,research,email,tel,teacher,idcard,isAccept,addtime from cms_register_student " + whereSql + " order by addtime";
			pstat = conn.prepareStatement(sql);
			rs = (ResultSet) pstat.executeQuery();
			while(rs.next()) {
				Student stu = new Student();
				stu.setId(rs.getString("id"));
				stu.setName(rs.getString("name"));
				stu.setSex(rs.getString("sex"));
				stu.setType(rs.getString("type"));
				stu.setSchool(rs.getString("school"));
				stu.setAcademy(rs.getString("academy"));
				stu.setMajor(rs.getString("major"));
				stu.setGrade(rs.getString("grade"));
				stu.setResearch(rs.getString("research"));
				stu.setEmail(rs.getString("email"));
				stu.setTel(rs.getString("tel"));
				stu.setTeacher(rs.getString("teacher"));
				stu.setIdcard(rs.getString("idcard"));
				String status = rs.getString("isAccept");
				stu.setIsAcceptInner(status);
				if("Y".equalsIgnoreCase(status)) {
					stu.setIsAccept("<font color='green'>已录取</font>");
				} else if("D".equalsIgnoreCase(status)) {
					stu.setIsAccept("未录取");
				} else {
					stu.setIsAccept("<font color='red'>未审核</font>");
				}
				stu.setAddtime(rs.getTimestamp("addtime"));
				acceptedStudents.add(stu);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstat!=null) {
				try {
					pstat.close();
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
		return acceptedStudents;
	}
	


	public boolean addStudent(Student user) throws Exception {
		sql = "insert into cms_register_student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = GetConnection.getConnection();
			pstat = conn.prepareStatement(sql);
			String id;
			if(user.getIdcard()!=null) {
				id = user.getIdcard();
			} else {
				id = UUID.randomUUID().toString();
			}
			pstat.setString(1, id);
			pstat.setString(2, user.getName());
			pstat.setString(3, user.getSex());
			pstat.setString(4, user.getType());
			pstat.setString(5, user.getSchool());
			pstat.setString(6, user.getAcademy());
			pstat.setString(7, user.getMajor());
			pstat.setString(8, user.getGrade());
			pstat.setString(9, user.getResearch());
			pstat.setString(10, user.getEmail());
			pstat.setString(11, user.getTel());
			pstat.setString(12, user.getTeacher());
			pstat.setString(13, user.getIdcard());
			pstat.setString(14, "N");
			pstat.setNull(15, java.sql.Types.VARCHAR);
			pstat.setNull(16, java.sql.Types.DATE);
			pstat.setTimestamp(17, new Timestamp(System.currentTimeMillis()));
			pstat.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(pstat!=null) {
				try {
					pstat.close();
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
	}
	public static void main(String[] args) {
//		System.out.println(new Date().getTime() + "," + System.currentTimeMillis());
//		new Dao().deleteStudent("99");
		Testao dao = new Testao();
		List<Student> allStudents = dao.getAllStudents();
		System.out.println(allStudents.size());
		System.out.println(dao.getAcceptedStudents().size());
		
	}


}