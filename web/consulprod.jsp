<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de produtos</title>
        <link rel="stylesheet" href="tabelalistapro.css">
    </head>
    <body>
        <%
            String n;
            n = request.getParameter("nome");
            try {
                // Conecão Banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "xxxxx");
                // Inserir dados tabela produto do banco de dados
                st = conecta.prepareStatement("SELECT *FROM produto WHERE nome like ? ORDER By nome");
                st.setString(1,"%" + n + "%");
                ResultSet rs = st.executeQuery();
        %>
        <table>
            <tr>
                <th>Código</th><th>Nome</th><th>Distribuidor</th><th>Preco</th><th>Delete</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("distribuidor")%></td>
                <td><%= rs.getDouble("preco")%></td>
                <td><a href="deletepro.jsp?codigo=<%= rs.getString("codigo")%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch (Exception x) {
                out.print("Mensagem de erro:" + x.getMessage());
            }
        %>
    </body>
</html>