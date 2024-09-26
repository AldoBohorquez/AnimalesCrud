<%@page import="java.util.ArrayList"%>
<%@page import="model.AnimalModel"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Animales</title>
        <style>
            table {
                width: 80%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
        <script>
            function eliminarAnimal(id) {
                if (confirm("¿Estás seguro de que quieres eliminar este animal?")) {
                    fetch(`animal?id=` + id, {
                        method: 'DELETE'
                    }).then(response => {
                        if (response.ok) {
                            alert('Animal eliminado exitosamente');
                            location.reload();
                        } else {
                            alert('Error al eliminar animal');
                        }
                    }).catch(error => console.error('Error:', error));
                }
            }
        </script>
    </head>
    <body>
        <h2>Lista de Animales</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Color</th>
                    <th>Especie</th>
                    <th>Tipo de Animal</th>
                    <th>Tipo de Alimento</th>
                    <th>Peso</th>
                    <th>Habitad</th>
                    <th>Altura</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<AnimalModel> listaAnimales = (ArrayList<AnimalModel>) request.getAttribute("animales");

                    if (listaAnimales != null && !listaAnimales.isEmpty()) {
                                            for (AnimalModel animal : listaAnimales) {
                %>
                <tr>
                    <td><%= animal.getId() %></td>
                    <td><%= animal.getColor() %></td>
                    <td><%= animal.getEspecie() %></td>
                    <td><%= animal.getTipoAnimal() %></td>
                    <td><%= animal.getTipoAlimento() %></td>
                    <td><%= animal.getPeso() %></td>
                    <td><%= animal.getHabitad() %></td>
                    <td><%= animal.getAltura() %></td>
                    <td>
                        <!-- Botón para eliminar -->
                        <button onclick="eliminarAnimal(<%= animal.getId() %>)">Eliminar</button>
                    </td>
                    <td>
                        <!-- Botón para actualizar, que redirige a actualizar_animal.jsp con el ID del animal --> 
                        <form action="${pageContext.request.contextPath}/views/actualizar_animal.jsp" method="GET"> 
                            <input type="hidden" name="id" value="<%= animal.getId() %>"> 
                            <input type="submit" value="Actualizar"> 
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="9">No hay animales registrados.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
