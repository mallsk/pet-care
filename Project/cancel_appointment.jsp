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
    String appointmentId = request.getParameter("appointmentId");


    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement statement = connection.createStatement();

        // Update the appointment status in the database
        String updateQuery = "UPDATE appointments SET status = 'Cancelled' WHERE appointmentId = '" + appointmentId + "'";
        int rowsAffected = statement.executeUpdate(updateQuery);

        statement.close();
        connection.close();

        if (rowsAffected > 0) {
            response.sendRedirect("dhome.jsp");
            out.println("success");
        } else {
            response.sendRedirect("dhome.jsp");
            out.println("failure");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("failure");
    }
%>


</body>
</html>