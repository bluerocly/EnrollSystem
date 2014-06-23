package bean;

import java.sql.Timestamp;

public class Student {
	private String id;
	private String name;
	private String sex;
	private String type;
	private String school;
	private String academy;
	private String major;
	private String grade;
	private String research;
	private String email;
	private String tel;
	private String teacher;
	private String idcard;
	private String isAccept;
	private String isAcceptInner;
	private String comment;
	private Timestamp addtime;
	private Timestamp lastLoginTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getAcademy() {
		return academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getResearch() {
		return research;
	}
	public void setResearch(String research) {
		this.research = research;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getIsAccept() {
		return isAccept;
	}
	public void setIsAccept(String isAccept) {
		this.isAccept = isAccept;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Timestamp getAddtime() {
		return addtime;
	}
	public void setAddtime(Timestamp addtime) {
		this.addtime = addtime;
	}
	public Timestamp getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getType() {
		return type;
	}
	public void setIsAcceptInner(String isAcceptInner) {
		this.isAcceptInner = isAcceptInner;
	}
	public String getIsAcceptInner() {
		return isAcceptInner;
	}
}