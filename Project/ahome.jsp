<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="dhome.css">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
        <script>
            function logout(){
                sessionStorage.clear();

                var xhr=new XMLHttpRequest();
                xhr.open("GET","logout.jsp",true);
                xhr.onreadystatechange=function(){
                    if(xhr.readyState === 4 && xhr.status === 200){
                        window.location.href="alogin.html";
                    }
                };
                xhr.send();
            }
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
                    <li><a href="#" onclick="logout()">Logout</a></li>
                </ul>
            </div>

        </div>
    
    <h4>User Details</h4>
    <table>
        <tr>
            <th>Unique ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
        <% 
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                Statement statement = connection.createStatement();

                // Retrieve user details from the database
                String s = "SELECT * FROM register";
                ResultSet resultSet = statement.executeQuery(s);

                // Display user details in the table
                while (resultSet.next()) {
                    String uniqueId = resultSet.getString("uniqueId");
                    String fname = resultSet.getString("fname");
                    String lname = resultSet.getString("lname");
                    String email = resultSet.getString("email");
                    String phone = resultSet.getString("phone");


                    out.println("<tr>");
                    out.println("<td>" + uniqueId + "</td>");
                    out.println("<td>" + fname + "</td>");
                    out.println("<td>" + lname + "</td>");
                    out.println("<td>" + email + "</td>");
                    out.println("<td>" + phone + "</td>");
                    out.println("</tr>");
                }

                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("An exception occurred: " + e.getMessage());
            }
        %>
    </table>

    <!--<h4>Pet Details</h4>
    <table>
        <tr>
            <th>Unique ID</th>
            <th>Pet ID</th>
            <th>Pet Name</th>
            <th>Pet Breed</th>
            <th>Pet Age</th>
        </tr>
        <% 
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                Statement statement = connection.createStatement();

                // Retrieve user details from the database
                String s = "SELECT * FROM petdetails";
                ResultSet resultSet = statement.executeQuery(s);

                // Display user details in the table
                while (resultSet.next()) {
                    String uniqueId = resultSet.getString("uniqueId");
                    String petId = resultSet.getString("petId");
                    String petname = resultSet.getString("petname");
                    String petbreed = resultSet.getString("petbreed");
                    String petage = resultSet.getString("petage");


                    out.println("<tr>");
                    out.println("<td>" + uniqueId + "</td>");
                    out.println("<td>" + petId + "</td>");
                    out.println("<td>" + petname + "</td>");
                    out.println("<td>" + petbreed + "</td>");
                    out.println("<td>" + petage + "</td>");
                    out.println("</tr>");
                }

                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("An exception occurred: " + e.getMessage());
            }
        %>
    </table>-->


    <h4>Doctor Details</h4>
    <table>
        <tr>
            <th>Dr. Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Specialist</th>
            <th>Password</th>
        </tr>
        <% 
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                Statement statement = connection.createStatement();

                // Retrieve user details from the database
                String s = "SELECT * FROM doctor";
                ResultSet resultSet = statement.executeQuery(s);

                // Display user details in the table
                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String phone = resultSet.getString("phone");
                   
                    String address = resultSet.getString("address");
                    String speciality = resultSet.getString("speciality");
                    String pass = resultSet.getString("pass");


                    out.println("<tr>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + email + "</td>");
                    out.println("<td>" + phone + "</td>");
                    out.println("<td>" + address + "</td>");
                    out.println("<td>" + speciality + "</td>");
                    out.println("<td>" + pass + "</td>");

                    out.println("</tr>");
                }

                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("An exception occurred: " + e.getMessage());
            }
        %>
    </table>

    <h4>Contact Form</h4>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
        </tr>
        <% 
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                Statement statement = connection.createStatement();

                // Retrieve user details from the database
                String s = "SELECT * FROM contact";
                ResultSet resultSet = statement.executeQuery(s);

                // Display user details in the table
                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String message = resultSet.getString("message");
                   


                    out.println("<tr>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + email + "</td>");
                    out.println("<td>" + message + "</td>");
                    out.println("</tr>");
                }

                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("An exception occurred: " + e.getMessage());
            }
        %>
    </table>

    <h4>Feedback Form</h4>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
        </tr>
        <% 
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                Statement statement = connection.createStatement();

                // Retrieve user details from the database
                String s = "SELECT * FROM feedback";
                ResultSet resultSet = statement.executeQuery(s);

                // Display user details in the table
                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String message = resultSet.getString("message");
                   


                    out.println("<tr>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + email + "</td>");
                    out.println("<td>" + message + "</td>");
                    out.println("</tr>");
                }

                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("An exception occurred: " + e.getMessage());
            }
        %>
    </table>

    <h4> Appointment Details</h4>
    <table>
        <tr>
            <th>Name</th>
            <th>Phone</th>
            <th>Pet Breed</th>
            <th>Date</th>
            <th>Time</th>
            <th>Description</th>
            <th>Doctor Name</th>
            <th>Status</th>
            <th>Delete</th>
        </tr>
        <% 
         
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                Statement statement = connection.createStatement();

                // Retrieve user details from the database
                String s = "SELECT * FROM appointments";
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
                    String appointmentId = resultSet.getString("appointmentId");




                    out.println("<tr>");
                    out.println("<td>" + userName + "</td>");
                    out.println("<td>" + phone + "</td>");
                    out.println("<td>" + petBreed + "</td>");
                    out.println("<td>" + appointmentDate + "</td>");
                    out.println("<td>" + appointmentTime + "</td>");
                    out.println("<td>" + description + "</td>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + status + "</td>");
                    out.println("<td><button class=\"btnn\"><a href=\"delete_appointment.jsp?appointmentId=" + appointmentId + "\">Delete</a></button></td>");

                    out.println("</tr>");
                }

                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("An exception occurred: " + e.getMessage());
            }
        %>
    </table>

    <h4>Add Doctor Details</h4>
    <form action="add_doctor.jsp" method="post">
        <label for="doctorName">Doctor Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input type="text" id="name" name="name" required><br>

        <label for="doctorEmail">Doctor Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input type="email" id="email" name="email" required><br>

        <label for="doctorPhone">Doctor Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input type="text" id="phone" name="phone" required><br>

        <label for="doctorAddress">Doctor Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input type="text" id="address" name="address" required><br>

        <label for="doctorSpeciality">Doctor Speciality:&nbsp;&nbsp;&nbsp;</label>
        <input type="text" id="speciality" name="speciality" required><br>

        <label for="doctorPassword">Doctor Password:&nbsp;&nbsp;&nbsp;</label>
        <input type="text" id="pass" name="pass" required><br>

        <button type="submit" class="btnn">Add Doctor</button>
    </form>
    </div><!-- Repeat the same structure for doctor details, pet details, and contact form details -->
</body>
</html>

</body>
</html>