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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <% JPAArtigoDAO dao = new JPAArtigoDAO();
            List<Artigo> listArtigo = dao.buscaTudo(); 
            request.setAttribute("listArtigo", listArtigo); %>
        <div class="container" id="formCadastraArtigo"></div>
        <div class="container bg-light border border-primary rounded">
            <h4 class="text-center mb-3">Autor</h4>
            <form action="http://localhost:8080/WebService/webresources/autor" method="post">
                <label>Autor</label> 
                <select name="artigo" class="form-control">
                    <c:forEach items="${listArtigo}" var="artigo">
                        <option value="${artigo.id}">[${artigo.id}] ${artigo.titulo_original}</option>
                    </c:forEach>
                </select>
                <div class="form-row">
                    <div class="col-md-2"><label>Ordem Artigo</label> <input type="text" name="ordem_artigo" class="form-control"/></div>
                    <div class="col-md-10"><label>Email</label> <input type="text" name="email" class="form-control"/></div>
                </div>
                <div class="form-row">
                    <div class="col-md-4"><label>Primeiro nome</label> <input type="text" name="primeiro_nome" class="form-control"/></div>
                    <div class="col-md-4"><label>Nome do meio</label> <input type="text" name="nome_meio" class="form-control"/></div>
                    <div class="col-md-4"><label>Sobrenome</label> <input type="text" name="sobrenome" class="form-control"/></div>
                </div>
                <label>Afiliacao</label> <input type="text" name="afiliacao" class="form-control"/>
                <label>Afiliacao Inglês</label> <input type="text" name="afiliacao_ingles" class="form-control"/>
                <div class="form-row">
                    <div class="col-md-3">
                        <label>Pais</label>
                        <select name="pais" class="form-control">  
                            <option value="BR">BR - Brasil</option>
                            <option value="PT">PT - Portugal</option>
                            <option value="US">US - Estados Unidos</option>
                            <option value="FR">FR - França</option>
                            <option value="UK">UK - Reino Unido</option>
                            <option value="ES">ES - Espanha</option>
                        </select>
                    </div>
                    <div class="col-md-9"><label>Registro Orc</label> <input type="text" name="registro_orc_id" class="form-control"/></div>
                </div>
                <br>
                <div class="text-center">
                    <a class="btn btn-secondary mb-3" href="http://localhost:8080/WebService/index_autor.jsp" style="width: 250px" role="button">Voltar</a>
                    <input class="btn btn-primary mb-3" style="width: 250px" id="botaoAutor" type="submit" value="Salvar"/>
                </div>
            </form>
        </div>
    </body>
</html>

<script>
   document.getElementById("botaoAutor").onclick = function () {
       var div = document.createElement('div');
       div.className = "alert alert-success";
       div.innerHTML = "Autor salvo com sucesso!"
       document.getElementById("formCadastraArtigo").appendChild(div);
   }
</script>