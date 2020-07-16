

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Libro</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
        %>
    </head>
    <body>
        <h1 align="center">DATOS LIBRO</h1>
        <table border="1" cellspacing="1" cellpadding="1" align="center">
            <thead>
                <tr>
                    <th>Nro</th>
                    <th>Autor</th>
                    <th>Título</th>
                    <th>Cantidad</th>
                    <th>Año</th>
                    <th>Editorial</th>
                    <th>Pais</th>
                    <th>Precio</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                
                <%
                  try {
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        consulta = "select  a.nombre, l.titulo, l.cantidad, l.año,e.nombre, p.nombre, l.precio, l.estado"
                                + " from autor a,libro l, editorial e, pais p "
                                + " where l.idautor= a.idautor and l.ideditorial = e.ideditorial and l.idpais = p.idpais"
                                + " order by a.nombre , p.nombre , e.nombre";
                        
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                         int index = 1;
                        while(rs.next()){
                           
                        %>
                        <tr>
                            <td><% out.print(index); %></td>
                            <td><% out.print(rs.getString(1)); %></td>
                            <td><% out.print(rs.getString(2)); %></td>
                            <td><% out.print(rs.getString(3)); %></td>
                            <td><% out.print(rs.getString(4)); %></td>
                            <td><% out.print(rs.getString(5)); %></td>
                            <td><% out.print(rs.getString(6)); %></td>
                            <td><% out.print(rs.getString(7)); %></td>
                            <td><% out.print(rs.getString(8)); %></td>
                            
                        </tr>
                        <%
                            index++;
                        }
                        rs.close();
                        pst.close();
                        cn.close();
                      
                  }  catch(Exception e){
                      out.print("Error SQL");
                  }
                %>
                
                
                
            </tbody>
        </table><br><div align="center">
                    <a href="menu.jsp">Menu</a> <br>
                    <a href="Login.jsp">Salir</a>
                </div>

    </body>
</html>
