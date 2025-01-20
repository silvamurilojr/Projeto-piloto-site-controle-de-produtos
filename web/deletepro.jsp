<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletar produto</title>
    </head>
    <body>
        <%
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            try {
                //CONECTA AO BANCO DE DADOS
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "xxxxx");
                PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); // COMANDO  DELETE
                if (resultado == 0) { //VERIFICA EXCLUSÃO
                    out.print("<p style='color:#f8f6e7;font-size:18px'>Produto não cadastrado");
                } else {
                    out.print("<p style='color:#f8f6e7;font-size:18px'>Produto codigo " + cod + " foi exluido com sucesso");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("<p style='color:#f8f6e7;font-size:18px'>Entre contato com o suporte " + mensagemErro);
            }
        %>
    </body>
</html>
