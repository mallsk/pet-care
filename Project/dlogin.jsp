<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
</head>
<body>
<%
    // Retrieve form data
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement statement = connection.createStatement();

        // Retrieve user details based on email
        String s = "SELECT * FROM doctor WHERE email='" + email + "'";
        ResultSet resultSet = statement.executeQuery(s);

        if (resultSet.next()) {
            String storedEmail = resultSet.getString("email");
            String storedPassword = resultSet.getString("pass");

            // Verify login credentials
            if (email.equals(storedEmail) && pass.equals(storedPassword)) {

                String name = resultSet.getString("name");
                
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");

                
                session.setAttribute("email", email);
                session.setAttribute("name", name);
                session.setAttribute("address", address);
                session.setAttribute("phone", phone);
                // Set the user as logged in
                session.setAttribute("loggedIn", true);

                // Redirect to the home page after successful login
                response.sendRedirect("dhome.jsp");
            } else {
                response.sendRedirect("invalid.html");
                out.println("Invalid credentials. Please try again.");
            }
        } else {
            response.sendRedirect("contact.html");
            out.println("User not found. Please register first.");
        }

        resultSet.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        out.println("An exception occurred: " + e.getMessage());
    }
%>



</body>
</html>