<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="profile.css">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page import="java.sql.*" %>
        <script>
            function logout(){
                sessionStorage.clear();

                var xhr=new XMLHttpRequest();
                xhr.open("GET","logout.jsp",true);
                xhr.onreadystatechange=function(){
                    if(xhr.readyState === 4 && xhr.status === 200){
                        window.location.href="dlogin.html";
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
                    <!--<li><a href="request.html">Request Appointment</a></li>
                    <li><a href="confirm.html">Confirmed Appointment</a></li>-->
                    <!-- <li><a href="#">Pet Details</a></li> -->
                    <li><a href="dhome.jsp">HOME</a></li>

                </ul>
            </div>



        </div>
    
        <div class="form">
            <h2>Personal Details</h2>
            <form action="" method="post">
                <div class="grid-details">
                    <div class="input">
                        <label>Name:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <p>
                            <%= session.getAttribute("name") %>
                        </p>
                    </div>
                    <div class="input">
                        <label>Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <p>
                            <%= session.getAttribute("email") %>
                        </p>
                    </div>
                </div>
                <div class="input">
                    <label>Phone:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <p>
                        <%= session.getAttribute("phone") %>
                    </p>
                </div>
                <div class="input">
                    <label>Address:</label>&nbsp;
                    <p>
                        <%= session.getAttribute("address") %>
                    </p>
                </div>
                <button class="btnn" onclick="logout()">Log Out</button>
            </form>
        </div>
    </div>

</body>

</html>