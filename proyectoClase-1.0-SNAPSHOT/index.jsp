<%-- 
    Document   : index
    Created on : 14 ago 2024, 19:02:28
    Author     : sebas
--%>

<%@page import="programadores.Programadores"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>JSP Page</title>

    </head>

    <nav class="navbar navbar-expand-lg navbar-light bg-dark p-3">
        <div class="container-fluid ">
            <a class="navbar-brand text-white" href="#">Principal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active text-white" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Features</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu text-white" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <body class="bg-info">
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            String id =request.getParameter("id");
            String lenguaje =request.getParameter("lenguaje");
            String descripcion =request.getParameter("descripcion");
            String programadores = request.getParameter("programadores");
            
            if (request.getParameter("actualizar") != null) {
                Programadores programadores1 = new Programadores();
                response.sendRedirect("index.jsp");
                programadores1.editarEmpleado(id, lenguaje, descripcion, programadores);
            }           
            if (request.getParameter("eliminar") != null){
               Programadores programadores1 = new Programadores();
               response.sendRedirect("index.jsp");
               programadores1.eliminarProgramsdor(id);
            }   
        %>
        <br>
        <div class="container-md bg-white">
            <br>
            <div class="row">
                <div class="col-4">
                    <form>
                        <h3 class="text-center"><% if (request.getParameter("editar") != null) {%>Editar programador<%} else if (request.getParameter("guardar") != null) {%> Formulario de Lenguaje <% } else { %> Formulario de Lenguaje <%}%>
                        </h3>
                        <br><br>
                        <div class="mb-4">
                            <label for="lenguajes" class="form-label">Lenguajes</label>
                            <input type="text" class="form-control" id="lenguaje"  name="lenguaje" aria-describedby="emailHelp" value="<%=lenguaje != null ? lenguaje : "" %>" required>

                        </div>
                        <div class="mb-4">
                            <label for="exampleInputPassword1" class="form-label">descripción</label>
                            <input type="text" class="form-control" id="descripcion" name="descripcion" value="<%=descripcion != null ? descripcion : ""%>">
                            </input>
                            <br>
                        </div>
                        <div class="mb-4">
                            <label for="programadores" class="form-label">Numero de programadores</label>
                            <input type="text"class="form-control" id="programadores"  name="programadores" aria-describedby="emailHelp" value="<%=programadores != null ? programadores : ""%>" required>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-success w-100" name="<%= request.getParameter("editar") != null ? "actualizar" : "guardar"%>">Guardar</button>
                        <br><br>
                        <input type="hidden" name="id" value="<%= id != null ? id : "" %>">

                        <button type="reset" class="btn btn-outline-danger w-100">Limpiar</button>
                        <br><br>
                    </form>

                    <%
                        if (request.getParameter("guardar") != null) {
                                Programadores programadores1 = new Programadores();
                                programadores1.agregarEmpleado(lenguaje, descripcion, programadores);
                                response.sendRedirect("index.jsp");
                        }

                    %>

                </div>
                <div class="col-8">
                    <h3 class="text-center">Listado de lenguajes</h3>
                    <br><br>
                    <table class="table table-dark table-striped table-hover">
                        <thead>
                        <th scope="col">id</th>
                        <th scope="col">lenguaje</th>
                        <th scope="col">descripción</th>
                        <th scope="col">programadores</th>
                        <th scope="col">Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                            <%try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/lenguajes?user=root&password=");
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from programadores");
                                    while (rs.next()) { 
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                
                                <td>
                                    <a  href="index.jsp?id=<%= rs.getString(1)%>&lenguaje=<%= rs.getString(2)%>&descripcion=<%= rs.getString(3)%>&programadores=<%= rs.getString(4)%>"></a>
                                    <form method="post">
                                        <button type="submit" name="editar"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                          &nbsp;&nbsp;&nbsp;
                                          <input type="hidden" name="id" value="<%= rs.getString(1)%> ">
                                          <input type="hidden" name="lenguaje" value="<%= rs.getString(2)%> ">
                                          <input type="hidden" name="descripcion" value="<%= rs.getString(3)%> ">
                                          <input type="hidden" name="programadores" value="<%= rs.getString(4)%> ">
                                        <button type="submit" name="eliminar" class="btn btn-danger" onclick="return confirm('¿Desea eliminar este empleado?');"><i class="fa fa-trash" aria-hidden="true"></i></button> 
                                    </form>  
                                </td>
                            </tr>

                            <%
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
