<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="configuration.ConnectionBD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %> 

<!DOCTYPE html> 
<html> 
    <head> 
        <meta charset="UTF-8"> 
        <title>Actualizar Animal</title> 
    </head> 
    <body> 
        <h2>Actualizar Animal</h2> 
        <%
            String id = request.getParameter("id");
            String color = "";
            String especie = "";
            String tipoAnimal = "";
            String tipoAlimento = "";
            double peso = 0.0;
            String habitad = "";
            String altura = "";
            ConnectionBD conexion = new ConnectionBD();
            Connection connection = conexion.getConnectionBD();
            PreparedStatement statement = null;
            ResultSet resultSet = null;
            try {
                // Consulta para obtener los datos del animal por ID 
                String sql = "SELECT color, especie, tipo_animal, tipo_alimento, peso, habitad, altura FROM animales WHERE id = ?";
                statement = connection.prepareStatement(sql);
                statement.setString(1, id);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    color = resultSet.getString("color");
                    especie = resultSet.getString("especie");
                    tipoAnimal = resultSet.getString("tipo_animal");
                    tipoAlimento = resultSet.getString("tipo_alimento");
                    peso = resultSet.getDouble("peso");
                    habitad = resultSet.getString("habitad");
                    altura = resultSet.getString("altura");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (statement != null) {
                        statement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %> 

        <!-- Formulario con los datos del animal para actualizar --> 
        <form id="formActualizarAnimal"> 
            COLOR: <br>
            <input type="text" id="txt_color" value="<%= color%>" ><br>
            ESPECIE: <br>
            <input type="text" id="txt_especie" value="<%= especie%>" ><br>
            TIPO DE ANIMAL: <br>
            <input type="text" id="txt_tipo_animal" value="<%= tipoAnimal%>" ><br>
            TIPO DE ALIMENTO: <br>
            <input type="text" id="txt_tipo_alimento" value="<%= tipoAlimento%>" ><br>
            PESO: <br>
            <input type="number" id="txt_peso" value="<%= peso%>" step="0.01"><br>
            HABITAD: <br>
            <input type="text" id="txt_habitad" value="<%= habitad%>" ><br>
            ALTURA: <br>
            <input type="text" id="txt_altura" value="<%= altura%>" ><br>
            <input type="button" value="Actualizar" onclick="actualizarAnimal()"> 
        </form> 
        <div id="resultado"></div> 
                <a href="${pageContext.request.contextPath}/animal">Ver Animales</a>

        <script>
        function actualizarAnimal() {
            const color = document.getElementById("txt_color").value;
            const especie = document.getElementById("txt_especie").value;
            const tipoAnimal = document.getElementById("txt_tipo_animal").value;
            const tipoAlimento = document.getElementById("txt_tipo_alimento").value;
            const peso = document.getElementById("txt_peso").value;
            const habitad = document.getElementById("txt_habitad").value;
            const altura = document.getElementById("txt_altura").value;
            const id = "<%= id %>";

            const datos = {
                color: color,
                especie: especie,
                tipoAnimal: tipoAnimal,
                tipoAlimento: tipoAlimento,
                peso: peso,
                habitad: habitad,
                altura: altura,
                id: id
            };

            fetch(`${pageContext.request.contextPath}/animal`, {
                method: "PUT",
                body: JSON.stringify(datos),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.text())
            .then(data => {
                document.getElementById("resultado").innerText = data;
            })
            .catch(error => {
                document.getElementById("resultado").innerText = "Error al actualizar el animal.";
                console.error('Error:', error);
            });
        }


        </script> 
    </body> 
</html> 
