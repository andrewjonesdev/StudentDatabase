package cryForHelp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import utilityForHire.UtilityStringNScan;

public class StudentDatabase {
	public static void main(String[] args) {
		String yesOrNo = "";
		boolean again = false;
		Scanner strScan = new Scanner(System.in);
		do{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from MCStudents";
		
			try{
				Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost/montgomeryCollege?"
	                                + "user=root&password=password");
				stmt = con.createStatement();
				//rs = stmt.executeQuery(populateString());
				stmt.executeUpdate(populateString());
				}catch (SQLException e) {
					e.printStackTrace();
				}catch (ClassNotFoundException e) {
					e.printStackTrace();
			} finally {
				
			}
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost/montgomeryCollege?"
	                                + "user=root&password=password");
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					System.out.print(rs.getString("stuFirstName") + "\t");
					System.out.print(rs.getString("stuLastName") +"\t");
					System.out.print(rs.getString("stuAddress") +"\t");
					System.out.print(rs.getString("stuCity") +"\t");
					System.out.print(rs.getString("stuZip") +"\t");
					System.out.print(rs.getString("stuPhone") +"\t");
					System.out.println();
				}
				}catch (SQLException e) {
					e.printStackTrace();
				}catch (ClassNotFoundException e) {
					e.printStackTrace();
			} finally {
				try {
					rs.close();
					stmt.close();
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}while(UtilityStringNScan.letsGoAgain(yesOrNo, again, strScan));
	}
	public static String populateString(){
		boolean keepLooping = false;
		ArrayList <String> list = new ArrayList();
		String outputSql = "";
		Scanner strScan = new Scanner(System.in);
		Scanner numScan = new Scanner(System.in);
		System.out.println("Enter your student information");
		outputSql = String.format("INSERT INTO MCStudents "
				+ "(stuFirstName,"
				+ "stuLastName,"
				+ "stuAddress,"
				+ "stuCity,"
				+ "stuState,"
				+ "stuZip,"
				+ "stuPhone) "
				+ "VALUES "
				+ "('%s',"
				+ "'%s',"
				+ "'%s',"
				+ "'%s',"
				+ "'%s',"
				+ "'%s',"
				+ "'%s');", 
				UtilityStringNScan.sentenceCheck("Enter your first name:", "Name Invalid. Please Try Again", keepLooping, list, strScan),
				UtilityStringNScan.sentenceCheck("Enter your last name:", "Name Invalid. Please Try Again", keepLooping, list, strScan),
				UtilityStringNScan.sentenceCheck("Enter your address:", "Address Invalid. Please Try Again", keepLooping, list, strScan),
				UtilityStringNScan.sentenceCheck("Enter your city:", "City Invalid. Please Try Again", keepLooping, list, strScan),
				UtilityStringNScan.sentenceCheck("Enter your state (ex Kansas = KS):", "State Invalid. Please Try Again", keepLooping, list, strScan).substring(0,2),
				Integer.toString(UtilityStringNScan.intCheck("Enter your zipcode:", keepLooping, numScan)),
				Long.toString(UtilityStringNScan.longCheck("Enter your phone number:", keepLooping, numScan)));
		
		return outputSql;
	}
}