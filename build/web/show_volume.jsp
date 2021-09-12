<%-- 
    Document   : edit_volume
    Created on : 31/08/2021, 19:36:43
    Author     : Micro
--%>

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.JPAVolumeDAO"%>
<%@page import="modelo.Volume"%>
<%@page import="modelo.Artigo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Volume</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <% JPAVolumeDAO dao = new JPAVolumeDAO();
           Long idVol = Long.parseLong(request.getParameter("id"));
           Volume vol = dao.recupera(idVol); 
           List<Artigo> listArtigo = dao.buscaArtigos(vol);  
           request.setAttribute("listArtigo", listArtigo);
        %>
            
        <div id="showVolume" class="container"></div>
        <div class="container mt-2">
            <div class="card">
                <div class="card-header">
                  Volume #${param.id}
                </div>
                <div class="card-body">
                    <div class="row">
                        <a href="http://localhost:8080/WebService" class="btn btn-warning" style="width: 16%">Voltar</a>
                        <a id="botaoEdit" href="http://localhost:8080/WebService/edit_volume.jsp?id=${param.id}" class="btn btn-primary mx-2" style="width: 16%">Editar</a>
                        <form action="http://localhost:8080/WebService/webresources/volume/delete/${param.id}" method="post">
                            <button id="botaoDelete" class="btn btn-danger" type="submit" style="width: 180px;">Remover</button>
                        </form>
                    </div>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Número da Edição:</b> <%=vol.getNumero_edicao() %></li>
                    <li class="list-group-item"><b>Sigla:</b> <%=vol.getSigla_evento()%></li>
                    <li class="list-group-item"><b>Cidade:</b> <%=vol.getCidade()%></li>
                    <li class="list-group-item"><b>Data Início:</b> <%=vol.getData_inicio()%></li>
                    <li class="list-group-item"><b>Descrição (pt):</b> <%=vol.getDescricao_pt()%></li>
                    <li class="list-group-item"><b>Descrição (en):</b> <%=vol.getDescricao_en()%></li>
                </ul>
              </div>
              <br>
              
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th class="text-center">Ordem Volume</th>
                        <th class="text-center">Titulo Original</th>
                        <th class="text-center">Ações</th>
                    <tr>
                </thead>
                <tbody>
                    <c:forEach items="${listArtigo}" var="artigo">
                    <tr>
                        <td class="text-center" style="width: 16%">${artigo.ordem_volume}</td>
                        <td class="text-center">${artigo.titulo_original}</td>
                        <td class="text-center" style="width: 16%">
                            <a class="btn btn-sm btn-info" href="http://localhost:8080/WebService/show_artigo.jsp?id=${artigo.id}" role="button">Exibir</a>
                            <a class="btn btn-sm btn-primary" href="http://localhost:8080/WebService/edit_artigo.jsp?id=${artigo.id}" role="button">Editar</a>
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
       div.innerHTML = "Volume deletado com sucesso."
       document.getElementById("showVolume").appendChild(div);
   }
</script>
