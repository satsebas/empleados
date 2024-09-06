/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package empleado;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author sebas
 */
public class EmpleadoDAO {

    private Connection getConnection() throws Exception {

        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost/empleadobd2?user=root&password=");

    }

    public void crearEmpleado(String nombre, String direccion, String telefono) {

        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            st.executeUpdate("INSERT INTO tblempleado (nombre, direccion, telefono) values ('" + nombre + "', '" + direccion + "', '" + telefono + "');");
        } catch (Exception e) {
            System.out.println(e + "Error en inserccion");

        }

    }

    public void editarEmpleado(String id, String nombre, String direccion, String telefono) {
        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            st.executeUpdate("UPDATE tblempleado SET nombre='" + nombre + "',direccion='" + direccion + "',telefono='" + telefono + "' WHERE id_empleado='" + id + "'");
        } catch (Exception e) {
            System.out.println(e + "Error al editar datos");

        }

    }
    
    public void eliminarEmpleado(String id){  
        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            st.executeUpdate("DELETE FROM tblempleado WHERE id_empleado='" + id + "'");   
        } catch (Exception e){
            System.out.println(e + "Error al eliminar datos");
            
            
        }
        
       
    }

}
