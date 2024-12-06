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
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("email");
    String phone=request.getParameter("phone");
    String pass=request.getParameter("pass");
    String cpass=request.getParameter("cpass");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement statement = connection.createStatement();
        String uniqueId = fname.substring(0, 2).toUpperCase() + lname.substring(0, 2).toUpperCase() + phone.substring(0, 4);

        // Check if the password and confirm password match
        if (pass.equals(cpass)) {
            // Insert user data into the database
            String S="insert into register values('"+uniqueId+"','"+fname+"','"+lname+"','"+email+"','"+phone+"','"+pass+"','"+cpass+"')";
            
            int rows = statement.executeUpdate(S);

            // Redirect to login page after successful registration
            if (rows > 0) {
                response.sendRedirect("ssign_up.html");
            } else {
                response.sendRedirect("sssign_up.html");
            }
        } else {
            response.sendRedirect("sssign_up.html");
        }

        statement.close();
        connection.close();
    } catch (Exception e) {
        out.println("An exception occurred: " + e.getMessage());
    }
%>
</body>
</html>