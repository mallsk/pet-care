<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADD DOCTOR</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
</head>
<body>
    
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String speciality = request.getParameter("speciality");
    String pass = request.getParameter("pass");
    

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement statement = connection.createStatement();

        // Insert doctor details into the database
        String insertQuery = "INSERT INTO doctor (name, email, phone, address, speciality, pass) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, email);
        preparedStatement.setString(3, phone);
        preparedStatement.setString(4, address);
        preparedStatement.setString(5, speciality);
        preparedStatement.setString(6, pass);

        int rowsAffected = preparedStatement.executeUpdate();

        preparedStatement.close();
        connection.close();

        if (rowsAffected > 0) {
            response.sendRedirect("ahome.jsp"); // Redirect back to the form page after successful insertion
        } else {
            out.println("Failed to add doctor. Please try again.");
        }
    } catch (Exception e) {
        out.println("An exception occurred: " + e.getMessage());
    }
%>

</body>
</html>