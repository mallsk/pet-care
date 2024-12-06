<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="view_appointment.css">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*,java.util.*,java.lang.*" %>
            
            <%
            // Check if the user is logged in 
            Boolean loggedIn=(Boolean) session.getAttribute("loggedIn"); 
            if (loggedIn !=null && loggedIn) { 
                // User is logged in, show the home page content 
                %>
                <script>
                    // Function to redirect to login page after session timeout
                    function redirectLogout() {
                        window.location.href = "login.html";
                    }
    
                    // Start session timeout timer
                    setTimeout(redirectLogout, 600000); // 10 minutes in milliseconds
                </script>


<body>
    <div class="main">
        <div class="navbar">
            <div class="icon">
                <h2 class="logo">Pet Health Care </h2>
            </div>

            <div class="menu">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="health.html">Health Tips</a></li>
                    <li><a href="food_instruction.html">Food Instructions</a></li>
                    <li><a href="hospitals.html">Hospitals</a></li>
                    <li><a href="appointment.jsp">Book Appointment</a></li>
                    <li><a href="profile.jsp">Profile</a></li>


                </ul>
            </div>



        </div>

        
            <% 
                
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                Statement statement = connection.createStatement();

                // Retrieve user details from the database
                String s = "SELECT * FROM appointments WHERE uniqueId ='" + session.getAttribute("uniqueId") + "'";
                ResultSet resultSet = statement.executeQuery(s);

                // Display user details in the table
                while (resultSet.next()) {
                    String userName = resultSet.getString("userName");
                    String phone = resultSet.getString("phone");
                    String petBreed = resultSet.getString("petBreed");
                    String appointmentDate = resultSet.getString("appointmentDate");
                    String appointmentTime = resultSet.getString("appointmentTime");
                    String description = resultSet.getString("description");
                    String name = resultSet.getString("name");
                    String status = resultSet.getString("status");
%>
</div>
<div class="form">
    <h2>Appointment Details</h2>
        <div class="grid-details">
            <div class="input">
                <label>Name:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <p><%= userName %></p>
            </div>
            <div class="input">
                <label>Phone:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <p><%= phone %></p>
            </div>
        </div>
        <div class="input">
            <label>Pet Breed:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <p><%= petBreed %></p>
        </div>
        <div class="input">
            <label>Date:</label>&nbsp;
            <p><%= appointmentDate %></p>
        </div>
        <div class="input">
            <label>Time:</label>&nbsp;
            <p><%= appointmentTime %></p>
        </div>
        <div class="input">
            <label>Description:</label>&nbsp;
            <p><%= description %></p>
        </div>
        <div class="input">
            <label>Doctor:</label>&nbsp;
            <p><%= name %></p>
        </div>
        <div class="input">
            <label>Status:</label>&nbsp;
            <p><%= status %></p>
        </div>
        </form>
        </div> 
        <%         
                }

                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("An exception occurred: " + e.getMessage());
            }
        %>
        

    </div>

</body>

</html>
<%
        }
else 
{ 
    response.sendRedirect("login.html");
 }
  %>