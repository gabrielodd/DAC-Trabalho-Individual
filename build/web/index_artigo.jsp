<%-- 
    Document   : index
    Created on : 24/08/2021, 23:07:07
    Author     : Micro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="modelo.Artigo"%>
<%@page import="DAO.JPAArtigoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela de Início</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <% JPAArtigoDAO dao = new JPAArtigoDAO();
            List<Artigo> listArtigo = dao.buscaTudo(); 
            request.setAttribute("listArtigo", listArtigo); %>
                
      <div class="container">     
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/WebService">Volumes</a></li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Artigos</a></li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/WebService/index_autor.jsp">Autores</a>
                    </li> 
                </ul> 
            </nav>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Ordem Volume</th>
                            <th>Titulo Original</th>
                            <th>Titulo Inglês</th>
                            <th>Resumo Original</th>
                            <th>Resumo Inglês</th>
                            <th>Palavra-Chave Original</th>
                            <th>Palavra-Chave Inglês</th>
                            <th>Ações</th>
                        <tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listArtigo}" var="artigo">
                        <tr>
                            <td style="width: 4%">${artigo.ordem_volume}</td>
                            <td>${artigo.titulo_original}</td>
                            <td>${artigo.titulo_ingles}</td>
                            <td>${artigo.resumo_original}</td>
                            <td>${artigo.resumo_ingles}</td>
                            <td>${artigo.palavra_chave_original}</td>
                            <td>${artigo.palavra_chave_ingles}</td>
                            <td class="text-center" style="width: 25%">
                                <div class="row">
                                    <div class="col-md-3">
                                        <a class="btn btn-sm btn-info" href="http://localhost:8080/WebService/show_artigo.jsp?id=${artigo.id}" role="button">Exibir </a>
                                    </div> 
                                    <div class="col-md-3">
                                        <a href="http://localhost:8080/WebService/edit_artigo.jsp?id=${artigo.id}" class="btn btn-sm btn-primary">Editar</a>
                                    </div>
                                    <div class="col-md-4">
                                        <form action="http://localhost:8080/WebService/webresources/artigo/delete/${artigo.id}" method="post" onsubmit="setTimeout(function(){window.location.reload();},50);">
                                            <button id="botaoDelete" class="btn btn-sm btn-danger" type="submit">Remover</button>
                                        </form>
                                    </div>
                                </div>
                        <tr>
                        </c:forEach>
                    </tbody>
                </table>
            <a class="btn btn-lg btn-block btn-primary" href="http://localhost:8080/WebService/cadastra_artigo.jsp" role="button">Novo Artigo</a></td>
        </div>
    </body>
</html>
