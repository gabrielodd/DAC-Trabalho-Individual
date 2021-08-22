<%-- 
    Document   : cadastra_artigo
    Created on : 21/08/2021, 23:31:07
    Author     : Micro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Artigo"%>
<%@page import="DAO.JPAArtigoDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Artigo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <% JPAArtigoDAO dao = new JPAArtigoDAO();
            List<Artigo> listArtigo = dao.buscaTudo(); 
            request.setAttribute("listArtigo", listArtigo); %>
        <h1>Cadastrar Artigo:</h1>
        <form action="http://localhost:8080/WebService/webresources/autor" method="post">
            Artigo: 
            <select name="artigo">
                <c:forEach items="${listArtigo}" var="artigo">
              <option value="${artigo.id}">[${artigo.id}] ${artigo.titulo_original}</option>
                </c:forEach>
            </select> <br/>
            Ordem Artigo: <input type="text" name="ordem_volume"/><br/>
            Email: <input type="text" name="email"/><br/>
            Primeiro nome: <input type="text" name="primeiro_nome"/><br/>
            Nome do meio: <input type="text" name="nome_meio"/><br/>
            Sobrenome: <input type="text" name="sobrenome"/><br/>
            Afiliacao: <input type="text" name="afiliacao"/><br/>
            Afiliacao Inglês: <input type="text" name="afiliacao_ingles"/><br/>
            Pais: <input type="text" name="pais"/><br/>
            Registro Orc: <input type="text" name="registro_orc_id"/><br/>
            <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
