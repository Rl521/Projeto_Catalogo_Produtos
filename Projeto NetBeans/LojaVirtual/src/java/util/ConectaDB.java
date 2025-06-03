package util;

import java.sql.*;

public class ConectaDB {
    
    // Zero atributos
    
    // Método(s)
    public static Connection conectar() throws ClassNotFoundException{
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/loja_virtual","root","");
            return conn;
        }
        catch(SQLException ex){
            System.out.println("Erro: " + ex);
        }
        return conn;
    }
}

