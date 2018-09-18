package pe.com.tienda.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.com.tienda.bean.Articulo;
import pe.com.tienda.conexion.Conexion;

public class ArticuloDAO {

    public static ArrayList<Articulo> buscarPorNombre(String nom) {
        // arreglo cuyos elementos son objetos tipo articulo
        ArrayList<Articulo> articulos = new ArrayList<>();
        //conexion a la base de datos
        Connection cn = Conexion.abrir();
        //varible articulo
        Articulo ar;
        try {
            //instruccion sql
            String sql = "select *from articulo where nombre like ?";
            //objeto para ejecutar instrucion sql
            PreparedStatement ps = cn.prepareStatement(sql);
            //asignar valor al parametro
            ps.setString(1, nom + "%");
            //ejecutaR y almacenar resultado en un resultset
            ResultSet rs = ps.executeQuery();
            //leer resultset
            while (rs.next()) {
                ar = new Articulo();
                ar.setIdart(rs.getInt("idarticulo"));
                ar.setNombre(rs.getString("nombre"));
                ar.setDescripcion(rs.getString("descripcion"));
                ar.setPrecio(rs.getDouble("precio"));
                ar.setFoto(rs.getString("foto"));
                //agregar al arreglo
                articulos.add(ar);
            }
            //cerrar objetos
            rs.close();
            ps.close();
            cn.close();
        } catch (Exception e) {
            System.out.println("Error en listar:" + e);
        }
        return articulos;
    }
}
