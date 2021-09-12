<%-- 
    Document   : edit_volume
    Created on : 31/08/2021, 19:36:43
    Author     : Micro
--%>

<%@page import="modelo.Volume"%>
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
        <div id="formEdit" class="container"></div>
        <div class="container">
            <h2 class="text-center">Editar Volume</h2>
            <form action="http://localhost:8080/WebService/webresources/volume/edit" method="post">               
                <input type="hidden" name="id" value="${param.id}"/>
                Sigla: <input type="text" name="sigla" class="form-control"/>
                Cidade: <input type="text" name="cidade" class="form-control"/>
                Ordem Volume: <input type="text" name="numero_edicao" class="form-control"/>
                Descrição em Português: <input type="text" name="desc_pt" class="form-control"/>
                Descrição em Inglês: <input type="text" name="desc_en" class="form-control"/>
                Data de Início: <input type="date" name="data" class="form-control"/>
                <br>
                <a href="http://localhost:8080/WebService/show_volume.jsp?id=${param.id}" class="btn btn-warning">Voltar</a>
                <input id="botao" class="btn btn-primary" type="submit" value="Salvar"/>
            </form>
        </div>
    </body>
</html>

<script>
   document.getElementById("botao").onclick = function () {
       var div = document.createElement('div');
       div.className = "alert alert-success";
       div.innerHTML = "Volume salvo com sucesso!"
       document.getElementById("formEdit").appendChild(div);
   }
</script>