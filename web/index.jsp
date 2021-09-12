<%-- 
    Document   : index
    Created on : 24/08/2021, 23:07:07
    Author     : Micro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="modelo.Volume"%>
<%@page import="DAO.JPAVolumeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela de Início</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <% JPAVolumeDAO dao = new JPAVolumeDAO();
            List<Volume> listVolume = dao.buscaTudo(); 
            request.setAttribute("listVolume", listVolume); %>
                
      <div id="index"class="container">      
      <div class="container">     
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link active" href="#">Volumes</a></li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/WebService/index_artigo.jsp">Artigos</a></li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/WebService/index_autor.jsp">Autores</a>
                    </li> 
                </ul> 
            </nav>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Sigla</th>
                            <th>Número da edição</th>
                            <th>Data</th>
                            <th>Ações</th>
                        <tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listVolume}" var="volume">
                        <tr>
                            <td style="width: 25%;">${volume.sigla_evento}</td>
                            <td style="width: 25%;">${volume.numero_edicao}</td>
                            <td style="width: 25%;">${volume.data_inicio}</td>
                            <td class="text-center" style="width: 25%;">
                            <div class="row">
                                <div class="col-md-3">
                                    <a class="btn btn-sm btn-info" href="http://localhost:8080/WebService/show_volume.jsp?id=${volume.id}" role="button">Exibir </a>
                                </div>
                                <div id="editDiv" class="col-md-3">
                                    <a href="http://localhost:8080/WebService/edit_volume.jsp?id=${volume.id}" class="btn btn-sm btn-primary">Editar</a>
                                </div>
                                <div class="col-md-3">
                                    <form action="http://localhost:8080/WebService/webresources/volume/delete/${volume.id}" method="post" onsubmit="setTimeout(function(){window.location.reload();},50);">
                                        <button id="botaoDelete" class="btn btn-sm btn-danger" type="submit">Remover</button>
                                    </form>
                                </div>
                                </td>
                            </div>
                        <tr>
                        </c:forEach>
                    </tbody>
                </table>
            <a class="btn btn-lg btn-block btn-primary" href="http://localhost:8080/WebService/cadastra.html" role="button">Novo Volume</a></td>
      </div>
    </body>
</html>