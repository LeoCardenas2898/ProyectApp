package pe.com.tienda.conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    //variables

    private static String url = "jdbc:mysql://localhost/tienda";
    private static String usuario = "root";
    private static String clave = "12345678";
    private static Connection cn;
    public static Connection abrir() {
        try {
            //registrar driver
            Class.forName("com.mysql.jdbc.Driver");
            //abrir la conexion a la base de datos tienda
            cn = DriverManager.getConnection(url, usuario, clave);
        } catch (Exception e) {
            System.out.println("Error:+" + e);
        }
        return cn;
    }
}
