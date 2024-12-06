<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.*,java.lang.*" %>
</head>
<body>
    
<%
    String appointmentId= request.getParameter("appointmentId");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement statement = connection.createStatement();

        // Delete pet from the database
        String deleteQuery = "DELETE FROM appointments WHERE appointmentId = '" + appointmentId + "'";
        int rowsAffected = statement.executeUpdate(deleteQuery);
        

        statement.close();
        connection.close();

        if (rowsAffected > 0) {
            response.sendRedirect("ahome.jsp");
        } else {
            out.println("failure");
        }
    } catch (Exception e) {
        out.println("An exception occurred: " + e.getMessage());
    }
%>

</body>
</html>