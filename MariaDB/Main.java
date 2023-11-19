import java.sql.DriverManager; 
import java.sql.SQLException;

public class Main {
    
        public static void main(String[] args) {
        Connection connection = null;
        String url = "jdbc: mariadb://localhost:3306/test";
        String user = "root";
        String pwd="admin";
        try {
            connection = DriverManager.getConnection (url, user, pwd);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        
        System.out.println("Successfully connected to database.");
        
        }
}