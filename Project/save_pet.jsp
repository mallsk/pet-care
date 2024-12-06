<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
</head>
<body>
    
<%
    String petname = request.getParameter("petname");
    String petage = request.getParameter("petage");
    String petbreed = request.getParameter("petbreed");
    String uniqueId = session.getAttribute("uniqueId").toString(); // User's unique ID


    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement statement = connection.createStatement();
        String petId = petname.substring(0, 2).toUpperCase() + petage.substring(0, 1).toUpperCase() + petbreed.substring(0, 2);


        // Insert pet details into the database
        String insertQuery = "INSERT INTO petdetails (uniqueId, petId, petname, petage, petbreed) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setString(1,uniqueId);
        preparedStatement.setString(2, petId);
        preparedStatement.setString(3, petname);
        preparedStatement.setString(4, petage);
        preparedStatement.setString(5, petbreed);

        int rowsAffected = preparedStatement.executeUpdate();

        preparedStatement.close();
        connection.close();

        if (rowsAffected > 0) {
            response.sendRedirect("pet_register.jsp");
        } else {
            out.println("Failed to save pet. Please try again.");
        }
    } catch (Exception e) {
        out.println("An exception occurred: " + e.getMessage());
    }
%>

</body>
</html>