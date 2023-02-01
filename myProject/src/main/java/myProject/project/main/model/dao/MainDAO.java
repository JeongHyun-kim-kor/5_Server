package myProject.project.main.model.dao;

import java.io.FileInputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import myProject.project.common.JDBCTemplate;


public class MainDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Properties prop;
	
	public MainDAO() {

		try {
			// JDBCTemplate 참고하기
			 Properties prop = new Properties();
	    
		   String filePath 
		   = JDBCTemplate.class.getResource("/edu/kh/jsp/sql/main-sql.xml").getPath();
	            
	            
	        // driver.xml 파일 읽어오기
	        prop.loadFromXML( new FileInputStream(filePath));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
