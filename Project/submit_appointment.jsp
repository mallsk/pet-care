<html>
    <head>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
</head>
<body>
<%
    String userName = request.getParameter("userName");
    String phone = request.getParameter("phone");
    String petBreed = request.getParameter("petBreed");
    String appointmentDate = request.getParameter("appointmentDate");
    String appointmentTime = request.getParameter("appointmentTime");
    String description = request.getParameter("description");
    String name = request.getParameter("name");

    // Get the user's unique ID from the session attribute (assuming you have already set it during login)
    String uniqueId = session.getAttribute("uniqueId").toString();
    String appointmentId = userName.substring(0, 2).toUpperCase() + name.substring(0, 2).toUpperCase() + phone.substring(0, 4);
    String status ="pending";

   

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement statement = connection.createStatement();

        // Insert appointment details into the database
        String insertQuery = "INSERT INTO appointments VALUES ('"+uniqueId+"','"+appointmentId+"','"+userName+"','"+phone+"','"+petBreed+"','"+appointmentDate+"','"+appointmentTime+"','"+description+"','"+name+"','"+status+"')";
        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
        

        int rowsAffected = preparedStatement.executeUpdate();

        preparedStatement.close();
        connection.close();

        if (rowsAffected > 0) {
            // Appointment booked successfully
            response.sendRedirect("view_appointment.jsp");
        } else {
            // Failed to book appointment
            response.sendRedirect("appointment_failure.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("<h2>Try Again</h2>");
    }
%>
</body>
</html>