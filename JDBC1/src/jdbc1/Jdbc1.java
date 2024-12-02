/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package jdbc1;

/**
 *
 * @author GGDD
 */
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Jdbc1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        String usuario = "root";
        String password= "123456";
        String url = "jdbc:mysql://localhost:3306/grupoae";
        Connection conexion;
        Statement statement;
        ResultSet rs;
                
        
                
                
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // TODO code application logic here
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Jdbc1.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            conexion = DriverManager.getConnection(url,usuario,password);
            statement = conexion.createStatement();
            statement.executeUpdate("INSERT INTO tblproducto(IDPRODUCTO,NOMBRE,PRECIO,STOCKPRODUCTO) VALUES('9','cervezapoker','4000','50')");
            statement.executeUpdate("INSERT INTO tblproducto(IDPRODUCTO,NOMBRE,PRECIO,STOCKPRODUCTO) VALUES('10','cervezalight','4500','70')");
            rs = statement.executeQuery("SELECT * FROM TBLPRODUCTO");
            rs.next();
            do{
                System.out.println(rs.getInt("idproducto")+ ":"+rs.getString("nombre")+ " Precio: "+rs.getString("precio"));
            }while(rs.next());
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Jdbc1.class.getName()).log(Level.SEVERE, null, ex);
        }
        }    
}    