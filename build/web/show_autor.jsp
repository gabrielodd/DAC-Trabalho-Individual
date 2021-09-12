<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.JPAAutorDAO"%>
<%@page import="modelo.Autor"%>
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
        <% JPAAutorDAO dao = new JPAAutorDAO();
           Long idAutor = Long.parseLong(request.getParameter("id"));
           Autor autor = dao.recupera(idAutor); 
        %>
            
        <div id="showVolume" class="container"></div>
        <div class="container mt-2">
            <div class="card">
                <div class="card-header">
                  Autor #${param.id}
                </div>
                <div class="card-body">
                    <div class="row">
                        <a href="http://localhost:8080/WebService/index_autor.jsp" class="btn btn-warning" style="width: 16%">Voltar</a>
                        <a href="http://localhost:8080/WebService/edit_autor.jsp?id=${param.id}" class="btn btn-primary mx-2" style="width: 16%">Editar</a>
                        <form action="http://localhost:8080/WebService/webresources/autor/delete/${param.id}" method="post">
                            <button id="botaoDelete" class="btn btn-danger" type="submit" style="width: 180px;">Remover</button>
                        </form>
                    </div>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Primeiro Nome:</b> <%=autor.getPrimeiro_nome() %></li>
                    <li class="list-group-item"><b>Nome do Meio:</b> <%=autor.getNome_meio() %></li>
                    <li class="list-group-item"><b>Sobrenome:</b> <%=autor.getSobrenome() %></li>
                    <li class="list-group-item"><b>Email:</b> <%=autor.getEmail() %></li>
                    <li class="list-group-item"><b>Pais:</b> <%=autor.getPais() %></li>
                    <li class="list-group-item"><b>Afiliação:</b> <%=autor.getAfiliacao() %></li>
                    <li class="list-group-item"><b>Afiliação em Inglês:</b> <%=autor.getAfiliacao_ingles() %></li>
                    <li class="list-group-item"><b>Ordem Artigo:</b> <%=autor.getOrdem_artigo() %></li>
                    <li class="list-group-item"><b>Registro Orc ID:</b> <%=autor.getRegistro_orc_id() %></li>
                </ul>
              </div>
            <br>
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