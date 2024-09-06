<%-- Document : index2 Created on : 10 ago 2024, 11:10:28 Author : sebas --%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREAR EMPLEADO</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
    </head>

    <body>
        <h1 class="text-center py-3">Crear Empleado</h1>
        <div class="container">
            <div class="row">
                <div class="col py-5">
                    <form action="#" method="post">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Ingrese nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre"
                                   aria-describedby="emailHelp" required>
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Ingrese direccion</label>
                            <input type="text" class="form-control" id="direccion" name="direccion"
                                   aria-describedby="emailHelp" required>
                        </div>
                        <div class="mb-3">
                            <label for="telefomo" class="form-label">Ingrese telefono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono"
                                   aria-describedby="emailHelp" required>
                        </div>

                        <button type="submit" class="btn btn-primary" name="enviar">enviar</button>
                    </form>
                    <%
                        if (request.getParameter("enviar") != null) {
                            String nombre = request.getParameter("nombre");
                            String direccion = request.getParameter("direccion");
                            String telefono = request.getParameter("telefono");
                            Connection con = null;
                            Statement st = null;

                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/empleadobd2?user=root&password=");
                                st = con.createStatement();
                                st.executeUpdate("INSERT INTO tblempleado (nombre, direccion, telefono) values ('" + nombre + "', '" + direccion + "', '" + telefono + "');");
                                response.sendRedirect("index.jsp"); // me lleva a la pagina principal
                            } catch (Exception e) {
                                out.print(e + "Error en inserccion");

                            }

                        }


                    %>

                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>

</html>