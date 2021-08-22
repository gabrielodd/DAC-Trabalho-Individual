<%-- 
    Document   : cadastra_artigo
    Created on : 21/08/2021, 23:31:07
    Author     : Micro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Volume"%>
<%@page import="DAO.JPAVolumeDAO"%>
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
        <% JPAVolumeDAO dao = new JPAVolumeDAO();
            List<Volume> listVolume = dao.buscaTudo(); 
            request.setAttribute("listVolume", listVolume); %>
        <h1>Cadastrar Artigo:</h1>
        <form action="http://localhost:8080/WebService/webresources/artigo" method="post">
            Volume: 
            <select name="volume">
                <c:forEach items="${listVolume}" var="volume">
              <option value="${volume.id}">[${volume.id}] ${volume.sigla_evento}, ${volume.cidade}</option>
                </c:forEach>
            </select> <br/>
            Ordem Volume: <input type="text" name="ordem_volume"/><br/>
            Idioma: <input type="text" name="idioma"/><br/>
            Titulo Original: <input type="text" name="titulo_original"/><br/>
            Titulo Inglês: <input type="text" name="titulo_ingles"/><br/>
            Resumo Original: <input type="text" name="resumo_original"/><br/>
            Resumo Inglês: <input type="text" name="resumo_ingles"/><br/>
            Palavra Chave Original: <input type="text" name="pc_original"/><br/> 
            Palavra Chave Inglês: <input type="text" name="pc_ingles"/><br/>
            Número de páginas: <input type="text" name="numero_paginas"/><br/>
            <input type="submit" value="Salvar"/>
        </form>
    </body>
</html>
