
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.JPAArtigoDAO"%>
<%@page import="modelo.Autor"%>
<%@page import="modelo.Artigo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Artigo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <% JPAArtigoDAO dao = new JPAArtigoDAO();
           Long idArt = Long.parseLong(request.getParameter("id"));
           Artigo art = dao.recupera(idArt); 
           List<Autor> listAutor = dao.buscaAutores(art);  
           request.setAttribute("listAutor", listAutor);
        %>
            
        <div id="showVolume" class="container"></div>
        <div class="container mt-2">
            <div class="card">
                <div class="card-header">
                  Artigo #${param.id}
                </div>
                <div class="card-body">
                    <div class="row">
                        <a href="http://localhost:8080/WebService/index_artigo.jsp" class="btn btn-warning" style="width: 16%">Voltar</a>
                        <a href="http://localhost:8080/WebService/edit_artigo.jsp?id=${param.id}" class="btn btn-primary mx-2" style="width: 16%">Editar</a>
                        <form action="http://localhost:8080/WebService/webresources/artigo/delete/${param.id}" method="post">
                            <button id="botaoDelete" class="btn btn-danger" type="submit" style="width: 180px;">Remover</button>
                        </form>
                    </div>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Titulo Original:</b> <%=art.getTitulo_original() %></li>
                    <li class="list-group-item"><b>Titulo em Inglês:</b> <%=art.getTitulo_ingles() %></li>
                    <li class="list-group-item"><b>Idioma:</b> <%=art.getIdioma()%></li>
                    <li class="list-group-item"><b>Número de Páginas:</b> <%=art.getNumero_paginas() %></li>
                    <li class="list-group-item"><b>Resumo original:</b> <%=art.getResumo_original() %></li>
                    <li class="list-group-item"><b>Resumo em inglês:</b> <%=art.getResumo_ingles() %></li>
                    <li class="list-group-item"><b>Palavra Chave Original:</b> <%=art.getPalavra_chave_original() %></li>
                    <li class="list-group-item"><b>Palavra Chave em Inglês:</b> <%=art.getPalavra_chave_ingles() %></li>
                </ul>
              </div>
              <br>
              
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th class="text-center">Ordem Artigo</th>
                        <th class="text-center">Primeiro Nome</th>
                        <th class="text-center">Nome do Meio</th>
                        <th class="text-center">Sobrenome</th>
                        <th class="text-center">Ações</th>
                    <tr>
                </thead>
                <tbody>
                    <c:forEach items="${listAutor}" var="autor">
                    <tr>
                        <td class="text-center" style="width: 12%">${autor.ordem_artigo}</td>
                        <td class="text-center">${autor.primeiro_nome}</td>
                        <td class="text-center">${autor.nome_meio}</td>
                        <td class="text-center">${autor.sobrenome}</td>
                        <td class="text-center" style="width: 16%">
                            <a class="btn btn-sm btn-info" href="http://localhost:8080/WebService/show_autor.jsp?id=${autor.id}" role="button">Exibir</a>
                            <a class="btn btn-sm btn-primary" href="http://localhost:8080/WebService/edit_autor.jsp?id=${autor.id}" role="button">Editar</a>
                        </td>
                    <tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>

<script>
   document.getElementById("botaoDelete").onclick = function () {
       var div = document.createElement('div');
       div.className = "alert alert-danger";
       div.innerHTML = "Artigo deletado com sucesso."
       document.getElementById("showVolume").appendChild(div);
   }
</script>