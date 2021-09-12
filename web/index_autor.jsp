<%-- 
    Document   : index
    Created on : 24/08/2021, 23:07:07
    Author     : Micro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="modelo.Autor"%>
<%@page import="DAO.JPAAutorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela de Início</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <% JPAAutorDAO dao = new JPAAutorDAO();
            List<Autor> listAutor = dao.buscaTudo(); 
            request.setAttribute("listAutor", listAutor); %>
                
      <div class="container">     
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/WebService">Volumes</a></li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/WebService/index_artigo.jsp">Artigos</a></li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Autores</a>
                    </li> 
                </ul> 
            </nav>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Ordem Artigo</th>
                            <th>Email</th>
                            <th>Nome Completo</th>
                            <th>Afiliação</th>
                            <th>Afiliação Inglês</th>
                            <th>Pais</th>
                            <th>Registro Orc</th>
                            <th>Ações</th>
                        <tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listAutor}" var="autor">
                        <tr>
                            <td style="width: 4%">${autor.ordem_artigo}</td>
                            <td>${autor.email}</td>
                            <td>${autor.primeiro_nome} ${autor.nome_meio} ${autor.sobrenome}</td>
                            <td>${autor.afiliacao}</td>
                            <td>${autor.afiliacao_ingles}</td>
                            <td>${autor.pais}</td>
                            <td>${autor.registro_orc_id}</td>
                            <td class="text-center" style="width: 22%">
                                <div class="row">
                                    <div class="col-md-3">
                                        <a class="btn btn-sm btn-info" href="http://localhost:8080/WebService/show_autor.jsp?id=${autor.id}" role="button">Exibir</a>
                                    </div> 
                                    <div class="col-md-3">
                                        <a href="http://localhost:8080/WebService/edit_autor.jsp?id=${autor.id}" class="btn btn-sm btn-primary">Editar</a>
                                    </div>
                                    <div class="col-md-3">
                                        <form action="http://localhost:8080/WebService/webresources/autor/delete/${autor.id}" method="post" onsubmit="setTimeout(function(){window.location.reload();},80);">
                                            <button id="botaoDelete" class="btn btn-sm btn-danger" type="submit">Remover</button>
                                        </form>
                                    </div>
                                </div>
                        <tr>
                        </c:forEach>
                    </tbody>
                </table>
        <a class="btn btn-lg btn-block btn-primary" href="http://localhost:8080/WebService/cadastra_autor.jsp" role="button">Novo Autor</a></td>
    </body>
</html>

      