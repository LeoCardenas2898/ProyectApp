package pe.com.tienda.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.com.tienda.bean.Empleado;
import pe.com.tienda.conexion.Conexion;

public class EmpleadoDAO {
    
    private static PreparedStatement ps;
    private static ResultSet rs;
    private static Connection cn;
    //listar todos los empleados
    public static ArrayList<Empleado> listar() {
        // arreglo cuyos elementos son objetos tipo empleado
        ArrayList<Empleado> empleados = new ArrayList<>();
        //conexion a la base de datos
        cn = Conexion.abrir();
        //varible empleado
        Empleado emp;
        try {
            //objeto para ejecutar instrucion sql
            ps = cn.prepareStatement("select * from empleado");
            //ejecutaR y almacenar resultado en un resultset
            rs= ps.executeQuery();
            //leer resultset
            while(rs.next()){
                emp=new Empleado();
                //emp.setIdemp(rs.getInt("idempleado"));
                emp.setIdemp(rs.getInt(1));
                emp.setNombre(rs.getString(2));
                emp.setPaterno(rs.getString(3));
                emp.setMaterno(rs.getString(4));
                emp.setCargo(rs.getString(5));
                //asignar objeto empleado al arreglo
                empleados.add(emp);
            }
            //cerrar objetos
             rs.close();
             ps.close();
             cn.close();   
        } catch (Exception e) {
            System.out.println("Error en listar:"+e);
        }
        return empleados;
    }
        //Insertar:
        public static void insertar(Empleado emp){
        //Instruccion SQL para insertar un empleado
        String sql = "insert into empleado (nombre, apepaterno, apematerno, cargo) "
                + "values(?,?,?,?)";   
        cn = Conexion.abrir();
        try{
            //Ejecutar instruccion SQL
            ps = cn.prepareStatement(sql);
            //Asignar valor a los parametros:
            ps.setString(1, emp.getNombre());
            ps.setString(2, emp.getPaterno());
            ps.setString(3, emp.getMaterno());
            ps.setString(4, emp.getCargo());
            ps.executeUpdate(); //Para insertar, actualizar, eliminar.
            //Cerrar objetos
            cn.close();
            ps.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
        
    public static void editar(Empleado emp){
        //Instruccion SQL para editar un empleado
        String sql = "update empleado set nombre=?, apepaterno=?, apematerno=?, cargo=? where idempleado=?"; 
        cn = Conexion.abrir();
        try{
            //Ejecutar instruccion SQL
            ps = cn.prepareStatement(sql);
            //Asignar valor a los parametros:
            ps.setString(1, emp.getNombre());
            ps.setString(2, emp.getPaterno());
            ps.setString(3, emp.getMaterno());
            ps.setString(4, emp.getCargo());
            ps.setInt(5, emp.getIdemp());
            ps.executeUpdate(); //Para insertar, actualizar, eliminar.
            //Cerrar objetos
            cn.close();
            ps.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static void eliminar(int idEmpleado){
        //Instruccion SQL para editar un empleado
        String sql = "delete from empleado where idempleado=?"; 
        cn = Conexion.abrir();
        try{
            //Ejecutar instruccion SQL
            ps = cn.prepareStatement(sql);
            //Asignar valor al parametro
            ps.setInt(1, idEmpleado);
            ps.executeUpdate(); //Para insertar, actualizar, eliminar.
            //Cerrar objetos
            cn.close();
            ps.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static Empleado buscar(int idEmpleado){
        //Instruccion SQL para editar un empleado
        String sql = "select * from empleado where idempleado=?"; 
        cn = Conexion.abrir();
        Empleado emp=null;
        try{
            //Ejecutar instruccion SQL
            ps = cn.prepareStatement(sql);
            //Asignar valor al parametro
            ps.setInt(1, idEmpleado);
            rs = ps.executeQuery(); //Para insertar, actualizar, eliminar.
            if(rs.next()){
                emp = new Empleado();
                emp.setIdemp(rs.getInt(1));
                emp.setNombre(rs.getString(2));
                emp.setPaterno(rs.getString(3));
                emp.setMaterno(rs.getString(4));
                emp.setCargo(rs.getString(5));
            }
            //Cerrar objetos
            cn.close();
            ps.close();
            return emp;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
