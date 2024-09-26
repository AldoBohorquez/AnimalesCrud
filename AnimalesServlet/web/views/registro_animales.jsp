<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Animales</title>
    </head>
    <body>
        <h1>Registrar Animales</h1>
        <form action="${pageContext.request.contextPath}/animal" method="POST">
            COLOR: <br>
            <input type="text" name="txt_color"><br>
            ESPECIE: <br>
            <input type="text" name="txt_especie"><br>
            TIPO DE ANIMAL: <br>
            <input type="text" name="txt_tipo_animal"><br>
            TIPO DE ALIMENTO: <br>
            <input type="text" name="txt_tipo_alimento"><br>
            PESO: <br>
            <input type="number" name="txt_peso" step="0.01"><br>
            HABITAD: <br>
            <input type="text" name="txt_habitad"><br>
            ALTURA: <br>
            <input type="text" name="txt_altura"><br>
            <input type="submit" value="Agregar">
        </form>
        <a href="${pageContext.request.contextPath}/animal">Ver Animales</a>
    </body>
</html>
