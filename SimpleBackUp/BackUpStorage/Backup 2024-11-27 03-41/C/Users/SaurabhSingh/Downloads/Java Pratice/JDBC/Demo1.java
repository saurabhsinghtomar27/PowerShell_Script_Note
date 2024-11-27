package JDBC;
import java.sql.*;
public class Demo1 {
    public static void main(String[] args) throws Exception {
      String url="jdbc:mysql://localhost:3306/";
      String uname="root";
      String pass="Lucknow@2003";
      Class.forName("com.myql.jdbc.Driver"); 
      Connection con=DriverManager.getConnection(url,uname,pass);
      System.out.println(con); 
    }
}
 