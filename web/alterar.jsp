<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recebe dados alterados</title>
    </head>
    <body>
        <%
            // Recebe o dados no slterados buscapro.jsp
            int codigo;
            String nome, distribuidor;
            double preco;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            distribuidor = request.getParameter("distribuidor");
            preco = Double.parseDouble(request.getParameter("preco"));
            // Conecão Banco de dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "xxxxx");
        
        %>
    </body>
</html>
