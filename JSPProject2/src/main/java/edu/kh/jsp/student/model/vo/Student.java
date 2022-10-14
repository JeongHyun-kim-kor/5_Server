package edu.kh.jsp.student.model.vo;

public class Student {

	private String  studentNo;      //학번
	private String StudentName;		// 이름
	private String studentAddress;  // 주소
	private String departmentName;	// 학과명
	
	
	public Student() {
		// TODO Auto-generated constructor stub
	}

	 
	

	public Student(String studentNo, String studentName, String studentAddress) {
		super();
		this.studentNo = studentNo;
		StudentName = studentName;
		this.studentAddress = studentAddress;
	}




	public Student(String studentNo, String studentName, String studentAddress, String departmentName) {
		super();
		this.studentNo = studentNo;
		StudentName = studentName;
		this.studentAddress = studentAddress;
		this.departmentName = departmentName;
	}




	public String getStudentNo() {
		return studentNo;
	}


	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}


	public String getStudentName() {
		return StudentName;
	}


	public void setStudentName(String studentName) {
		StudentName = studentName;
	}


	public String getStudentAddress() {
		return studentAddress;
	}


	public void setStudentAddress(String studentAddress) {
		this.studentAddress = studentAddress;
	}


	public String getDepartmentName() {
		return departmentName;
	}


	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}




	@Override
	public String toString() {
		return "Student [studentNo=" + studentNo + ", StudentName=" + StudentName + ", studentAddress=" + studentAddress
				+ ", departmentName=" + departmentName + "]";
	}
	
	
}
