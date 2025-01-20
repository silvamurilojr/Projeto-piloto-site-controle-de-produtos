<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));
            //CONECTA AO BANCO DE DADOS
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "xxxxx");
            st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo=?");
            st.setInt(1, c);
            ResultSet resultado = st.executeQuery();
            if (!resultado.next()) {
                out.print("<p style='color:#f8f6e7;font-size:18px'>Produto não encontrado");
            } else {
        %>
        <form method="post" action="alterar.jsp ">
            <p> 
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo")%>">
            </p>
            <p> 
                <label for="nome">Nome do Produto:</label>
                <input type="text"  name="nome" id="nome" size="50" maxlength="50" value="<%= resultado.getString("nome")%>">
            </p> 
            <p> 
                <label for="distribuidor">Distribuidor</label>
                <input type="text" name="distribuidor" id="distribuidor" size="50" maxlength="50" value="<%= resultado.getString("distribuidor")%>">
            </p>
            <p> 
                <label for="preco">Preço:</label>
                <input type="number" step="0.1" name="preco" id="preco" value="<%= resultado.getString("preco")%>">
            </p>            
            <p> 
                <input type="submit" value="Salvar Alteracões">
            </p>
        </form>
        <%
            }
        %>
    </body>
</html>
