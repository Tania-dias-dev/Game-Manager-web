<%-- 
    Document   : dashboard
    Created on : 09/04/2026, 13:50:34
    Author     : tania
--%>

<%@page import="com.tania.projectogestaodejogos.entidades.Jogo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #0f0f1a, #1a1a2e);
                color: #fff;
            }

            h2, h3 {
                color: #00ffe1;
                text-shadow: 0 0 8px #00ffe1;
            }

            .container {
                width: 90%;
                margin: auto;
                padding: 20px;
            }

            .logout-form {
                position: fixed;
                bottom: 20px;
                right: 20px;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                margin-top: 20px;
                background-color: #111;
                border-radius: 10px;
                overflow: hidden;
            }

            th, td {
                padding: 12px;
                text-align: left;
            }

            th {
                background-color: #1a1a2e;
                color: #00ffe1;
            }

            tr:nth-child(even) {
                background-color: #1a1a2e;
            }

            tr:hover {
                background-color: #2a2a40;
            }

            button {
                padding: 6px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-right: 5px;
                transition: 0.3s;
            }

            button:hover {
                opacity: 0.8;
            }

            form {
                display: inline-block;
                margin-right: 5px;
            }

            /* Botões específicos */



            form button {
                background-color: #00ffe1;
                color: #000;
                box-shadow: 0 0 8px #00ffe1;
            }

            form button:hover {
                background-color: #fff;
            }

            /* Botão apagar */
            form[action="DeleteGameServlet"] button {
                background-color: #ff4d4d;
                color: #fff;
                box-shadow: 0 0 8px #ff4d4d;
            }

            /* Botão editar */
            form[action="UpdateGameServlet"] button {
                background-color: #ffcc00;
                color: #000;
                box-shadow: 0 0 8px #ffcc00;
            }

            input[type="text"] {
                padding: 8px;
                border-radius: 5px;
                border: none;
                margin-bottom: 10px;
                width: 200px;
                background-color: #1a1a2e;
                color: #fff;
            }

            .msg {
                color: #00ff99;
                margin: 10px 0;
            }

            .logout {
                background-color: #ff00ff;
                color: #fff;
                padding: 8px 12px;
                border-radius: 6px;
                box-shadow: 0 0 10px #ff00ff;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Bem-vindo à área reservada ${sessionScope.email}!</h2>


            <%
                String msg = request.getParameter("msg");

                if ("apagado".equals(msg)) {
            %>
            <p style="color: green;">Jogo apagado com sucesso!</p>
            <%
            } else if ("editado".equals(msg)) {
            %>
            <p style="color: green;">Jogo editado com sucesso!</p>
            <%
                }
            %>





            <%
                List<Jogo> jogos = (List<Jogo>) request.getAttribute("jogos");

                if (jogos == null || jogos.isEmpty()) {
            %>
            <p>Lista vazia</p>

            <%
            } else {
            %>
            <h2>Lista de Jogos Disponíveis ⬇️ </h2>
            <table>
                <tr>
                    <th>Nome</th>
                    <th>Tipo</th>
                    <th>Estúdio</th>
                    <th>Opções</th>
                </tr>

                <%
                    for (Jogo j : jogos) {
                %>
                <tr>
                    <td><%= j.getNome()%></td>
                    <td><%= j.getTipo()%></td>
                    <td><%= j.getEstudio()%></td>

                    <td>

                        <form action="UpdateGameServlet" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= j.getId()%>">
                            <button type="submit">Editar</button>
                        </form>


                        <form action="DeleteGameServlet" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= j.getId()%>">
                            <button type="submit" onclick="return confirm('Tens a certeza?')">
                                Apagar
                            </button>
                        </form>
                    </td>

                </tr>
                <%
                    }
                %>

            </table>

            <%
                }
            %>

            <h3>Adicionar Jogo</h3>

            <form action="CreateGameServlet" method="post">
                Nome: <input type="text" name="nome" required><br><br>
                Tipo: <input type="text" name="tipo" required><br><br>
                Estúdio: <input type="text" name="estudio" required><br><br>

                <button type="submit">Adicionar</button>
            </form>

            <form action="LogoutServlet" method="get" class="logout-form">
                <button type="submit">Logout</button>
            </form>
        </div>
    </body>
</html>
