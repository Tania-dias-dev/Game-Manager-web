<%-- 
    Document   : edit
    Created on : 09/04/2026, 16:58:44
    Author     : tania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #0f0f1a, #1a1a2e);
    color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: #111;
    padding: 25px;              /* menos padding */
    border-radius: 12px;
    width: 300px;               /* mais pequeno */
    box-shadow: 0 0 20px rgba(0,255,225,0.2);
    text-align: center;
}

h2 {
    color: #00ffe1;
    margin-bottom: 15px;
    text-shadow: 0 0 10px #00ffe1;
}

label {
    display: block;
    text-align: left;
    margin-top: 8px;
    margin-bottom: 4px;
    font-size: 14px;
}

input[type="text"] {
    width: 100%;
    padding: 8px;               /* inputs mais pequenos */
    border-radius: 5px;
    border: none;
    margin-bottom: 10px;        /* menos espaço */
    background-color: #1a1a2e;
    color: #fff;
}

button {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 6px;
    background-color: #00ffe1;
    color: #000;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
    box-shadow: 0 0 10px #00ffe1;
}

button:hover {
    background-color: #fff;
}

.back {
    display: block;
    margin-top: 12px;
    color: #ff00ff;
    text-decoration: none;
}

        </style>
    </head>
    <body>
        <div class="container">
            <%@page import="com.tania.projectogestaodejogos.entidades.Jogo"%>

            <%
                Jogo jogo = (Jogo) request.getAttribute("jogo");
            %>

            <h2>Editar Jogo</h2>

            <form action="UpdateGameServlet" method="post">
                <input type="hidden" name="id" value="<%= jogo.getId()%>">

                Nome: <input type="text" name="nome" value="<%= jogo.getNome()%>"><br><br>
                Tipo: <input type="text" name="tipo" value="<%= jogo.getTipo()%>"><br><br>
                Estúdio: <input type="text" name="estudio" value="<%= jogo.getEstudio()%>"><br><br>

                <button type="submit">Guardar</button>
            </form>
        </div>
    </body>
</html>
