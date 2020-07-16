

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page import="java.util.Collections" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos de Autor</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idautor;

        %>
    </head>
    <body>
         <h1 align="center">DATOS AUTOR</h1>
        <table border="1" cellspacing="1" cellpadding="1" align="center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Autor</th>
                    <th>Fecha de Nacimiento</th>
                    <th>Eliminar</th>
                    </tr>
            </thead>
            <tbody>
                
                <%
                  try {
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        s_accion = request.getParameter("f_accion");
                        s_idautor = request.getParameter("f_idautor");
                        
                        if (s_accion!=null) {
                        if (s_accion.equals("E")) {
                        consulta =  "   delete from autor "
                                    + " where "
                                    + " idautor = " + s_idautor + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                        }
                        }
                        
                        consulta = "select idautor, nombre, f_nacimiento"
                                + " from autor order by nombre";
                         
                        
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        int num = 0;
                        String ide;
                        while(rs.next()){
                            ide = rs.getString(1);
                            num++;
                        %>
                        <tr>
                            <td><%out.print(num);%></td>
                            <td><% out.print(rs.getString(1)); %></td>
                            <td><% out.print(rs.getString(2)); %></td>
                            <td><% out.print(rs.getString(3)); %></td>
                            <td><a href="DatosAutor.jsp?f_accion=E&f_idautor=<%out.print(ide);%>">Eliminar></a></td>
                            
                        </tr>
                        <%
                        }
                        rs.close();
                        pst.close();
                        cn.close();
                      
                  }  catch(Exception e){
                      out.print("Error SQL");
                  }
                %>
                
                
            </tbody>
        </table><br>
                <div align="center">
                    <a href="menu.jsp">Menu</a> <br>
                    <a href="Login.jsp">Salir</a>
                </div>

    </body>
</html>