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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <% JPAVolumeDAO dao = new JPAVolumeDAO();
            List<Volume> listVolume = dao.buscaTudo(); 
            request.setAttribute("listVolume", listVolume); %>
        <div class="container" id="formCadastraArtigo"></div>
        <div class="container bg-light border border-primary rounded">
        <h4 class="text-center mb-3">Artigo</h4>
            <form action="http://localhost:8080/WebService/webresources/artigo" method="post" id="formArtigo">
                <label>Volume</label> 
                <select name="volume" class="form-control">
                    <c:forEach items="${listVolume}" var="volume">
                  <option value="${volume.id}">[${volume.id}] ${volume.sigla_evento}, ${volume.cidade}</option>
                    </c:forEach>
                </select>
                <div class="form-row">
                    <div class="col-md-4"><label>Ordem Volume</label> <input type="text" name="ordem_volume" class="form-control"/></div>
                    <div class="col-md-4"><label>Idioma</label> <input type="text" name="idioma" class="form-control"/></div>
                    <div class="col-md-4"><label>Número de páginas</label> <input type="text" name="numero_paginas" class="form-control"/></div>
                </div>
                <label>Titulo Original</label> <input type="text" name="titulo_original" class="form-control"/>
                <label>Titulo Inglês</label> <input type="text" name="titulo_ingles" class="form-control"/>
                <label>Resumo Original</label> <input type="text" name="resumo_original" class="form-control"/>
                <label>Resumo Inglês</label> <input type="text" name="resumo_ingles" class="form-control"/>
                <label>Palavra Chave Original</label> <input type="text" name="pc_original" class="form-control"/> 
                <label>Palavra Chave Inglês</label> <input type="text" name="pc_ingles" class="form-control"/>
                <br>
                <div class="text-center">
                    <a class="btn btn-secondary mb-3" href="http://localhost:8080/WebService/index_artigo.jsp" style="width: 250px" role="button">Voltar</a>
                    <button type="submit" id="botao" class="btn btn-primary mb-3" style="width: 250px"/>Salvar</button>
                </div>
            </form>
        </div>
    </body>
</html>

<script>
   document.getElementById("botao").onclick = function () {
       var div = document.createElement('div');
       div.className = "alert alert-success";
       div.innerHTML = "Artigo salvo com sucesso!"
       document.getElementById("formCadastraArtigo").appendChild(div);
   }
</script>
