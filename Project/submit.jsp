<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.lang.*" %>
</head>
<body>
<%
    // Retrieve form data
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String message=request.getParameter("message");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement statement = connection.createStatement();
            String S="insert into contact values('"+name+"','"+email+"','"+message+"')";
            
            int rows = statement.executeUpdate(S);
            if (rows > 0) {
                response.sendRedirect("ssubmit.html");
            } else {
                response.sendRedirect("contact.html");
                out.println("Something went wrong! Please try again.");
            }
        

        statement.close();
        connection.close();
    }
        catch (Exception e) {
        out.println("An exception occurred: " + e.getMessage());
    }
%>
</body>
</html>