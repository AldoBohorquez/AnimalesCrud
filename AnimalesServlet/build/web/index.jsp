<%-- 
    Document   : index
    Created on : 23/09/2024, 09:26:51 PM
    Author     : swoke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de Inicio</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            h1 {
                color: #333;
            }
            a {
                display: block;
                margin: 10px 0;
                text-decoration: none;
                color: #007BFF;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h1>Bienvenido al Sistema de Gestión de Animales</h1>
        
        <h2>Gestión de Animales</h2>
        <a href="${pageContext.request.contextPath}/views/registro_animales.jsp">Registrar Animal</a>
        <a href="${pageContext.request.contextPath}/animal">Mostrar Animales</a>

    </body>
</html>
