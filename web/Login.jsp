
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Bienvenidos a la Librería "LP2Team"</h1>
        <form action="valida.jsp" method="POST">
            <table border="0" align="center" cellspacing="0">
                <thead>
                    <tr>
                        <th colspan="2">Ingrese usuario y clave</th>
                          </tr>
                           <tr><td><br></td></tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Usuario </td>
                        <td><input type="text" name="f_usuario" value="" /></td>
                    </tr>
                     <tr><td><br></td></tr>
                    <tr>
                        <td>Clave </td>
                        <td><input type="password" name="f_clave" value="" /></td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr align="center">
                        <td colspan="2"><input type="submit" value="Ingresar" name="f_ingresar" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
