<%-- 
    Document   : login
    Created on : 07/04/2026, 11:03:06
    Author     : tania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #0f0f1a, #1a1a2e);
                color: #ffffff;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            h1 {
                color: #00ffe1;
                margin-bottom: 20px;
                text-shadow: 0 0 10px #00ffe1;
            }

            label {
                display: block;
                text-align: left;
                margin-top: 10px;
                margin-bottom: 5px;
            }

            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                border-radius: 6px;
                border: none;
                outline: none;
                margin-bottom: 15px;
                background-color: #1a1a2e;
                color: #fff;
            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 6px;
                background-color: #ff00ff;
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: 0.3s;
                box-shadow: 0 0 10px #ff00ff;
            }

            input[type="submit"]:hover {
                background-color: #fff;
                color: #000;
                box-shadow: 0 0 20px #ff00ff;
            }

            a {
                display: block;
                margin-top: 15px;

                color: #00ffe1;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            .msg {
                color: #ff4d4d;
                margin-bottom: 10px;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <h1>Formulário de Login 🔒 </h1>

            <form action="LoginServlet" method="post" autocomplete="off">
                <p>${msg}</p>
                <p><label for="email">Email:</label><input type="email" name="email" autocomplete="off" id="email" ></p>

                <p><label for="pass">Password:</label><input type="password" name="pass" id="pass" autocomplete="off" ></p>

                <p><input type="submit" value="Validar"></p>
            </form>
            <a href="index.html">Voltar à página principal</a>
        </div>
    </body>
</html>
