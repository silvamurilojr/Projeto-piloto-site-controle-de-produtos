<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvar produto</title>
    </head>
    <body>
        <%
            // Recebe o dados no formulário cadpro.html
            int codigo;
            String nome, distribuidor;
            double preco;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            distribuidor = request.getParameter("distribuidor");
            preco = Double.parseDouble(request.getParameter("preco"));
            try {
                // Conecão Banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "xxxxx");
                // Inserir dados tabela produto do banco de dados
                st = conecta.prepareStatement("INSERT INTO produto VALUES(?,?,?,?)");
                st.setInt(1, codigo);
                st.setString(2, nome);
                st.setString(3, distribuidor);
                st.setDouble(4, preco);
                st.executeUpdate(); // Executa INSERT
                out.print("<p style='color:#f8f6e7;font-size:18px'>Produto cadastrado com sucesso</p>");
            } catch (Exception x) {
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p style='color:#f8f6e7;font-size:18px'>Produto já possui cadastro</p>");
                } else {
                    out.print("Mensagem de erro:" + erro);
                }
            }
        %>
    </body>
</html>
