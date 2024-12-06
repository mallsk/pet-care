<!DOCTYPE html>
<html>

<head>
    <title>Doctors List</title>
    <link rel="stylesheet" type="text/css" href="doctor.css">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
</head>

<body>
    <header>

        <div class="icon">
            <h2 class="logo">Pet Health Care </h2>
        </div>
        <nav>
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
        </nav>
    </header>

    <div class="card-container">
        <div class="card">
            <img src="vet-3895477_1280.jpg" alt="Image 1">
            <div class="card-info">
                <h2>Dr.Mallikarjun </h2>
                <p>Card 1 description goes here.</p>
                <button class="btnn"><a href="appointment.jsp">Book Appointment &rarr;</a></button>

            </div>
        </div>

        <div class="card">
            <img src="veterinary-6819364_1280.png" alt="Image 2">
            <div class="card-info">
                <h2>Dr.Likhith</h2>
                <p>Card 2 description goes here.</p>
                <button class="btnn"><a href="appointment.jsp">Book Appointment &rarr;</a></button>
            </div>
        </div>
        <!--
        <div class="card">
            <img src="cat-ga0fb5e05c_1280.jpg" alt="Image 2">
            <div class="card-info">
                <h2>Card 2</h2>
                <p>Card 2 description goes here.</p>
                <button class="btnn"><a href="#">Book Appointment &rarr;</a></button>
            </div>
        </div>
        <div class="card">
            <img src="cat-ga0fb5e05c_1280.jpg" alt="Image 2">
            <div class="card-info">
                <h2>Card 2</h2>
                <p>Card 2 description goes here.</p>
                <button class="btnn"><a href="#">Book Appointment &rarr;</a></button>
            </div>
        </div>
        
        <div class="card">
            <img src="cat-ga0fb5e05c_1280.jpg" alt="Image 2">
            <div class="card-info">
                <h2>Card 2</h2>
                <p>Card 2 description goes here.</p>
                <button class="btnn"><a href="#">Book Appointment &rarr;</a></button>
            </div>
        </div>
        <div class="card">
            <img src="cat-ga0fb5e05c_1280.jpg" alt="Image 2">
            <div class="card-info">
                <h2>Card 2</h2>
                <p>Card 2 description goes here.</p>
                <button class="btnn"><a href="#">Book Appointment &rarr;</a></button>
            </div>
        </div>
        <div class="card">
            <img src="cat-ga0fb5e05c_1280.jpg" alt="Image 2">
            <div class="card-info">
                <h2>Card 2</h2>
                <p>Card 2 description goes here.</p>
                <button class="btnn"><a href="#">Book Appointment &rarr;</a></button>
            </div>
        </div>
        <div class="card">
            <img src="cat-ga0fb5e05c_1280.jpg" alt="Image 2">
            <div class="card-info">
                <h2>Card 2</h2>
                <p>Card 2 description goes here.</p>
                <button class="btnn"><a href="#">Book Appointment &rarr;</a></button>
            </div>
        </div>
        -->

        <!-- Add more cards here -->

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