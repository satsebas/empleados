<%-- Document : index2 Created on : 10 ago 2024, 11:10:28 Author : sebas --%>

<%@page import="empleado.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDITAR EMPLEADO</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
    </head>

    <body>
        <%
         String id = request.getParameter("id");
         String nombre = request.getParameter("nombre");
         String direccion = request.getParameter("direccion");
         String telefono = request.getParameter("telefono");
        %>
        <h1 class="text-center py-3">Editar Empleado</h1>
        <div class="container">
            <div class="row">
                <div class="col py-5">
                    <form action="editar.jsp" method="post">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Ingrese nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre"
                                   aria-describedby="emailHelp" required value="<%= nombre %>">
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Ingrese direccion</label>
                            <input type="text" class="form-control" id="direccion" name="direccion"
                                   aria-describedby="emailHelp" required value="<%= direccion %>">
                        </div>
                        <div class="mb-3">
                            <label for="telefomo" class="form-label">Ingrese telefono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono"
                                   aria-describedby="emailHelp" required value="<%= telefono %>">
                        </div>
                        <input type="hidden" name="id" value="<%= id %>">

                        <button type="submit" class="btn btn-primary" name="actualizar">Actualizar</button>
                    </form>
                    <%
                        if (request.getParameter("actualizar") != null) {
                              EmpleadoDAO empleadoDao = new EmpleadoDAO();
                              empleadoDao.editarEmpleado(id, nombre, direccion, telefono);
                              response.sendRedirect("index.jsp");
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