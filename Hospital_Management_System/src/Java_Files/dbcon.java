/*
 * This Class was made to make the connection with Java.
 */
package Java_Files;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 *
 * @author Pasindu
 */
public class dbcon {
    private static Connection con;
    private static void createNewConnection() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        String db = "jdbc:mysql://localhost:3306/swastika";
        String user = "root"; //user name
        String pass = "123"; //user password
        con = DriverManager.getConnection(db,user,pass);
    }
    
    public static ResultSet search(String sql) throws Exception{
        /*
            *search functions returns a ResultSet based on the query
        */
        if (con == null) {
            createNewConnection();
        }
        return con.createStatement().executeQuery(sql);
    }
    
    public static void IUD(String sql) throws Exception{
        /*
            *Insert, Update and Delete query
        */
        
        if (con == null) {
            createNewConnection();
        }
        con.createStatement().executeUpdate(sql);
        
    }
    
}
    
