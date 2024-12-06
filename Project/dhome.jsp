<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Health & Care</title>
    <link rel="stylesheet" href="dhome.css">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.*,java.lang.*" %>
<%
    // Check if the user is logged in
    Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

    if (loggedIn != null && loggedIn) {
        // User is logged in, show the home page content
%>
<script>
    // Function to redirect to login page after session timeout
    function redirectLogout() {
        window.location.href = "dlogin.html";
    }

    // Start session timeout timer
    setTimeout(redirectLogout, 600000); // 10 minutes in milliseconds

    
</script>
</head>

<body>
    <div class="main">
        <div class="navbar">
            <div class="icon">
                <h2 class="logo">Pet Health Care </h2>
            </div>

            <div class="menu">
                <ul>
                    <!--<li><a href="request.html">Request Appointment</a></li> -->
                    <!--<li><a href="confirm.html">Confirmed Appointment</a></li>-->
                    <!--<li><a href="#">Pet Details</a></li> -->
                    <li><a href="dprofile.jsp">Profile</a></li>

                </ul>
            </div>



        </div>
        
    <!--<h3>Doctor Dashboard</h3>-->
    <h3>Welcome, <%= session.getAttribute("name") %></h3>

    <h4>Appointment Requests:</h4>
    <table>
        <tr>
            
            <th>User Name</th>
            <th>Phone</th>
            <th>Pet Breed</th>
            <th>Appointment Date</th>
            <th>Appointment Time</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        <% 
            
            
            String name =session.getAttribute("name").toString();
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                Statement statement = connection.createStatement();
                
                String query = "SELECT * FROM appointments WHERE name = '" + name + "'";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                ResultSet resultSet = preparedStatement.executeQuery();
                
                while (resultSet.next()) {
                    String appointmentId = resultSet.getString("appointmentId");
                   
        %>
            <tr>
                
                <td><%= resultSet.getString("userName") %></td>
                <td><%= resultSet.getString("phone") %></td>
                <td><%= resultSet.getString("petBreed") %></td>
                <td><%= resultSet.getString("appointmentDate") %></td>
                <td><%= resultSet.getString("appointmentTime") %></td>
                <td><%= resultSet.getString("description") %></td>
                <td>
                    <button id="button1"  class="btnn"><a href="confirm_appointment.jsp?appointmentId=<%= appointmentId %>"> Confirm</a></button>
                    <button id="button1" class="btnn"><a href="cancel_appointment.jsp?appointmentId=<%= appointmentId %>">Cancel</a> </button>
                    <p id="message" style="display:none;"></p>
                </td>
                
                
            </tr>
            
        <%
                }
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
<script>
    
    function confirmAppointment(appointmentId) {
        // You can use AJAX to send the confirmation request to the server
        // Implement the AJAX code to send the confirmation request to the server
        // and update the database accordingly.
        // Example AJAX code:
        fetch('confirm_appointment.jsp?appointmentId=' + appointmentId)
            .then(response => response.text())
            .then(status => {
                if (status === 'success') {
                    alert('Appointment ' + appointmentId + ' confirmed.');
                    updateStatusInUserModule(appointmentId, 'Confirmed');
                } else {
                    alert('Failed to confirm appointment.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to confirm appointment.');
            });
    }

    function cancelAppointment(appointmentId) {
        // You can use AJAX to send the cancellation request to the server
        // Implement the AJAX code to send the cancellation request to the server
        // and update the database accordingly.
        // Example AJAX code:
        fetch('cancel_appointment.jsp?appointmentId=' + appointmentId)
            .then(response => response.text())
            .then(status => {
                if (status === 'success') {
                    alert('Appointment ' + appointmentId + ' cancelled.');
                    updateStatusInUserModule(appointmentId, 'Cancelled');
                } else {
                    alert('Failed to cancel appointment.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to cancel appointment.');
            });
    }
    const hideButtons = document.querySelectorAll('#button1');
        
        hideButtons.forEach(button => {
            button.addEventListener('click', () => {
                const row = button.parentElement.parentElement;
                row.style.display = 'none';
            });
        });

    function updateStatusInUserModule(appointmentId, status) {
        // Implement code to update the user module with the confirmed/cancelled status
        // using JavaScript DOM manipulation.
        // You can find the relevant appointment row in the user module table by appointmentId
        // and update the status column accordingly.
    }

</script>
<h4>Confirmed Appointment Details</h4>
    <table>
        <tr>
            <th>Name</th>
            <th>Phone</th>
            <th>Pet Breed</th>
            <th>Date</th>
            <th>Time</th>
            <th>Description</th>
            <th>Status</th>
        </tr>
        <% 
         
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                Statement statement = connection.createStatement();

                // Retrieve user details from the database
                String s = "SELECT * FROM appointments WHERE name = '" + name + "'";
                ResultSet resultSet = statement.executeQuery(s);

                // Display user details in the table
                while (resultSet.next()) {
                    String userName = resultSet.getString("userName");
                    String phone = resultSet.getString("phone");
                    String petBreed = resultSet.getString("petBreed");
                    String appointmentDate = resultSet.getString("appointmentDate");
                    String appointmentTime = resultSet.getString("appointmentTime");
                    String description = resultSet.getString("description");
                    String status = resultSet.getString("status");




                    out.println("<tr>");
                    out.println("<td>" + userName + "</td>");
                    out.println("<td>" + phone + "</td>");
                    out.println("<td>" + petBreed + "</td>");
                    out.println("<td>" + appointmentDate + "</td>");
                    out.println("<td>" + appointmentTime + "</td>");
                    out.println("<td>" + description + "</td>");
                    out.println("<td>" + status + "</td>");

                    out.println("</tr>");
                }

                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("An exception occurred: " + e.getMessage());
            }
        %>
    </table>

    </div>
</body>

</html>
<%
} else {
    // User is not logged in, redirect to the login page
    response.sendRedirect("dlogin.html");
}
%>