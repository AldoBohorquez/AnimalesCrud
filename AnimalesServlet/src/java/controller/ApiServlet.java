/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.CustomResponse;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.AnimalModel;

/**
 *
 * @author swoke
 */
@WebServlet(
        urlPatterns = "/api/data")
public class ApiServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private Connection conn2;

    // Método para obtener la conexión a la base de datos
    private Connection getConnection() throws SQLException, ClassNotFoundException {
        // Configura la conexión a tu base de datos
        String jdbcURL = "jdbc:mysql://localhost:3306/zologico";
        String jdbcUsername = "root";
        String jdbcPassword = "";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    /**
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Configuración del JSON que responderá la petición
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        List<AnimalModel> listaAnimales = new ArrayList<>();
        String sql = "SELECT id, color, especie, tipo_animal, tipo_alimento, peso, habitad, altura FROM animales";
        try {
            conn2 = getConnection();
            PreparedStatement ps = conn2.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            // Itera sobre los resultados y crea objetos AnimalModel
            while (rs.next()) {
                AnimalModel animal = new AnimalModel();
                animal.setId(rs.getInt("id"));
                animal.setColor(rs.getString("color"));
                animal.setEspecie(rs.getString("especie"));
                animal.setTipoAnimal(rs.getString("tipo_animal"));
                animal.setTipoAlimento(rs.getString("tipo_alimento"));
                animal.setPeso(rs.getDouble("peso"));
                animal.setHabitad(rs.getString("habitad"));
                animal.setAltura(rs.getString("altura"));
                listaAnimales.add(animal);
            }
                    System.out.print(listaAnimales);

        } catch (Exception e) {
            e.printStackTrace();
        }

        CustomResponse cResponse = new CustomResponse(200, "Ok", listaAnimales);

        String jsonResponse = new Gson().toJson(cResponse);
        response.getWriter().write(jsonResponse);
    }
}
