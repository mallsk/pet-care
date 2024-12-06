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

   

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement statement = connection.createStatement();
        

        // Update pet details in the database
        String updateQuery = "UPDATE petdetails SET petname = '" + petname + "', petage = " + petage + ", petbreed = '" + petbreed + "' " WHERE petId = petId ;
        int rowsAffected = statement.executeUpdate(updateQuery);

        statement.close();
        connection.close();

        if (rowsAffected > 0) {
            response.sendRedirect("pet_register.jsp");
        } else {
            out.println("Failed to update pet. Please try again.");
        }
    } catch (Exception e) {
        out.println("An exception occurred: " + e.getMessage());
    }
%>

</body>
</html>