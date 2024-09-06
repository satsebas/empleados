<%-- 
    Document   : index.jsp
    Created on : 10 ago 2024, 8:55:13
    Author     : sebas
--%>

<%@page import="empleado.EmpleadoDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleado</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>

        <div class="container">
            <div class="row">
                <div class="col py-5">
                    <table class="table table-dark table-striped table-hover">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4">registro empleado</th>
                                <th>
                                    <a href="index2.jsp"> <i class="fa fa-user-plus text-center" aria-hidden="true"></i></a>

                                </th>

                            </tr>
                            <tr>
                                <th scope="col">id_empleado</th>
                                <th scope="col">nombre</th>
                                <th scope="col">direccion</th>
                                <th scope="col">telefono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/empleadobd2?user=root&password=");
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from tblempleado");
                                    while (rs.next()) {
                                        String id = rs.getString(1);
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td>
                                    <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&direccion=<%= rs.getString(3)%>&telefono=<%= rs.getString(4)%>"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>                                    
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <form method="post" style="display: inline;" >
                                        <input type="hidden" name="id" value="<%= id%>">
                                        <button type="submit" name="eliminar" class="btn btn-danger" onclick="return confirm('¿Desea eliminar este empleado?');"><i class="fa fa-trash" aria-hidden="true"></i></button>  
                                    </form>

                                </td>
                            </tr>

                            <%                                    }
                                    if (request.getParameter("eliminar") != null) {
                                        String idEliminar = request.getParameter("id");
                                        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
                                        empleadoDAO.eliminarEmpleado(idEliminar);
                                        response.sendRedirect("index.jsp");
                                    }
                                } catch (Exception e) {
                                    out.print(e + "Error en mysql");
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
