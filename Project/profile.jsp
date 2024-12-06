<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="profile.css">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page import="java.sql.*" %>
            <script>
                function logout() {
                    sessionStorage.clear();

                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "logout.jsp", true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            window.location.href = "login.html";
                        }
                    };
                    xhr.send();
                }
            </script>
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
                    <li><a href="doctor.jsp">Doctors</a></li>
                    <!--<li><a href="pet_register.jsp">AddPet</a></li>-->


                </ul>
            </div>



        </div>

        <div class="form">
            <h2>Personal Details</h2>
            <form action="" method="post">
                <div class="grid-details">
                    <div class="input">
                        <label>First Name:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <p>
                            <%= session.getAttribute("fname") %>
                        </p>
                    </div>
                    <div class="input">
                        <label>Last Name:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <p>
                            <%= session.getAttribute("lname") %>
                        </p>
                    </div>
                </div>
                <div class="input">
                    <label>Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <p>
                        <%= session.getAttribute("email") %>
                    </p>
                </div>
                <div class="input">
                    <label>Phone Number:</label>&nbsp;
                    <p>
                        <%= session.getAttribute("phone") %>
                    </p>
                </div>
                
                
                <button class="btnn" onclick="logout()">Log Out</button>
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