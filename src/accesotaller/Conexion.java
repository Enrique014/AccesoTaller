/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accesotaller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author José Lopez
 */
public class Conexion {
     public Connection conexion;
     public  Statement st;
    
        
            
   
    public  Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/Horarios", "root", "1234");  
            st = conexion.createStatement();
            
        } catch (ClassNotFoundException | SQLException e) {
            

        }
    }
    
    public Connection obtener()  {
      if (conexion == null) {
         try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/sistemacontable", "root", "301997");
         } catch (ClassNotFoundException | SQLException ex) {
            
         }
      }
      return conexion;
   }
    
}
