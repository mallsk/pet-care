<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Appointment Booking Form</title>
            <% // Check if the user is logged in 
            Boolean loggedIn=(Boolean) session.getAttribute("loggedIn"); 
            if(loggedIn !=null && loggedIn) 
            { // User is logged in, show the home page content 
                %>
                <script>
                    // Function to redirect to login page after session timeout
                    function redirectLogout() {
                        window.location.href = "login.html";
                    }

                    // Start session timeout timer
                    setTimeout(redirectLogout, 600000); // 10 minutes in milliseconds
                    </script>
                    <script>
                    const appointmentDateInput = document.getElementById("appointmentDate");
        
        // Get the current date
        const currentDate = new Date();
        
        // Format the current date to match the input format (YYYY-MM-DD)
        const currentFormattedDate = currentDate.toISOString().split("T")[0];
        
        // Set the minimum date for the input to the next day after the current date
        appointmentDateInput.min = currentFormattedDate;
                </script>
                <link rel="stylesheet" href="appointment.css">
        </head>

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
                            <li><a href="doctor.jsp">Doctors</a></li>
                            <li><a href="view_appointment.jsp">View Appointment</a></li>
                            <li><a href="profile.jsp">Profile</a></li>

                        </ul>
                    </div>



                </div>
                <div class="form">
                    <h2>Book Appointment</h2>
                    <form action="submit_appointment.jsp" method="post">
                        <div class="grid-details">
                            <div class="input">
                                <label for="userName">UserName:&nbsp;</label>
                                <input type="text" id="userName" name="userName" required><br>
                            </div>
                            <div class="input">
                                <label for="phone">Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <input type="text" id="phone" name="phone" required><br>
                            </div>
                            <div class="input">
                                <label for="petBreed">Pet Breed:&nbsp;&nbsp;</label>
                                <input type="text" id="petBreed" name="petBreed" required><br>
                                <div class="input">
                                    <label for="appointmentDate">Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <input type="date" id="appointmentDate" name="appointmentDate" required><br>
                                </div>
                                <div class="input">
                                    <label for="appointmentTime">Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <input type="time" id="appointmentTime" name="appointmentTime" required min="10:00" max="16:00"><br>
                                </div>
                                <div class="input">
                                    <label for="description">Description:</label>
                                    <textarea id="description" name="description" rows="4" cols="50"
                                        required></textarea><br>
                                </div>
                                <div class="input">
                                    <label for="doctor">Doctor:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <select id="name" name="name">
                                        <% // Replace the following with your actual database connection code 
                                        try 
                                        {
                                            Class.forName("com.mysql.jdbc.Driver"); 
                                            Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                                            Statement statement=connection.createStatement(); 
                                            String query="SELECT name FROM doctor" ; 
                                            ResultSet resultSet=statement.executeQuery(query); 
                                            while (resultSet.next()) 
                                            { 
                                                String name=resultSet.getString("name"); %>
                                            <option value="<%= name %>">
                                                <%= name %>
                                            </option>
                                            <% 
                                             } 
                                                statement.close(); 
                                                connection.close(); 
                                        } 
                                    catch (Exception e) 
                                    {
                                                e.printStackTrace(); 
                                            } 
                                            %>
                                    </select><br>
                                </div>
                                
                                <button type="submit" class="btnn">Submit</button>
                            </div>
                        </div>

                    </form>
                </div>
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