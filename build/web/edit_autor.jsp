<%-- 
    Document   : edit_volume
    Created on : 31/08/2021, 19:36:43
    Author     : Micro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Autor</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <div id="formEdit" class="container"></div>
        <div class="container">
            <h2 class="text-center">Editar Autor</h2>
            <form action="http://localhost:8080/WebService/webresources/autor/edit" method="post">               
                <input type="hidden" name="id" value="${param.id}"/>
                Ordem Artigo: <input type="text" name="ordem_artigo" class="form-control"/>
                Nome: <input type="text" name="primeiro_nome" class="form-control"/>
                Nome do Meio: <input type="text" name="nome_meio" class="form-control"/>
                Sobrenome: <input type="text" name="sobrenome" class="form-control"/>
                Afiliação: <input type="text" name="afiliacao" class="form-control"/>
                Afiliação Inglês: <input type="text" name="afiliacao_en" class="form-control"/>
                Pais:
                <select name="pais" class="form-control">  
                    <option value="BR">BR - Brasil</option>
                    <option value="PT">PT - Portugal</option>
                    <option value="US">US - Estados Unidos</option>
                    <option value="FR">FR - França</option>
                    <option value="UK">UK - Reino Unido</option>
                    <option value="ES">ES - Espanha</option>
                </select>
                Registro Orc: <input type="text" name="registro_orc_id" class="form-control"/><br>
                <a href="http://localhost:8080/WebService/show_autor.jsp?id=${param.id}" class="btn btn-warning">Voltar</a>
                <input id="botao" class="btn btn-primary" type="submit" value="Salvar"/>
            </form>
        </div>
    </body>
</html>

<script>
   document.getElementById("botao").onclick = function () {
       var div = document.createElement('div');
       div.className = "alert alert-success";
       div.innerHTML = "Autor salvo com sucesso!"
       document.getElementById("formEdit").appendChild(div);
   }
</script>
