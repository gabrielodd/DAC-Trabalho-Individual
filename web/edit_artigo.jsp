<%-- 
    Document   : edit_volume
    Created on : 31/08/2021, 19:36:43
    Author     : Micro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Artigo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <div id="formEdit" class="container"></div>
        <div class="container">
            <h2 class="text-center">Editar Artigo</h2>
            <form action="http://localhost:8080/WebService/webresources/artigo/edit" method="post">               
                <input type="hidden" name="id" value="${param.id}"/>
                Ordem Volume: <input type="text" name="ordem_volume" class="form-control"/>
                Titulo Original: <input type="text" name="titulo_original" class="form-control"/>
                Titulo em inglês: <input type="text" name="titulo_ingles" class="form-control"/>
                Resumo Original: <input type="text" name="resumo_original" class="form-control"/>
                Resumo em inglês: <input type="text" name="resumo_ingles" class="form-control"/>
                Palavra-chave Original <input type="text" name="pc_original" class="form-control"/>
                Palavra-chave em inglês: <input type="text" name="pc_ingles" class="form-control"/><br>
                <a href="http://localhost:8080/WebService/show_artigo.jsp?id=${param.id}" class="btn btn-warning">Voltar</a>
                <input id="botao" class="btn btn-primary" type="submit" value="Salvar"/>
            </form>
        </div>
    </body>
</html>

<script>
   document.getElementById("botao").onclick = function () {
       var div = document.createElement('div');
       div.className = "alert alert-success";
       div.innerHTML = "Artigo salvo com sucesso!"
       document.getElementById("formEdit").appendChild(div);
   }
</script>
