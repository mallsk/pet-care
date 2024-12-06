<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pet Registration</title>
    <link rel="stylesheet" href="addpet.css">
    <style>
        .pet-details {
            margin-bottom: 20px;
        }
    </style>
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
                    <li><a href="profile.jsp">Profile</a></li>

                </ul>
            </div>



        </div>
    
    <div class="form">
        <h2>Pet Registration</h2>
    <form action="save_pet.jsp" method="post">
        <div class="grid-details">
            <div class="input">
                <label for="petName">Pet Name:</label>
                <input type="text" id="petname" name="petname" required><br>
            </div>
            <div class="input">
                <label for="petAge">Pet Age:&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <input type="text" id="petage" name="petage" required><br>
            </div>
            <div class="input">
                <label for="petBreed">Pet Breed:</label>
                <input type="text" id="petbreed" name="petbreed" required><br>
            </div>
            <button type="submit" class="btnn">Save</button>
        </div>
    </form>
</div>

    

    <% 
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
            Statement statement = connection.createStatement();
            String query = "SELECT * FROM petdetails WHERE uniqueId = '" + session.getAttribute("uniqueId") + "'";
            ResultSet resultSet = statement.executeQuery(query);
            
            while (resultSet.next()) {
                String petId = resultSet.getString("petId");
                String petname = resultSet.getString("petname");
                String petage = resultSet.getString("petage");
                String petbreed = resultSet.getString("petbreed");
    %>  
    
    <div id="petForm" class="pet-details">

        
    </div>
        <div class="form" >
            <!--<h3>Pet Details</h3>-->
            <div class="input">
            <label>Pet Name:</label> 
            <p>
               <%= petname %>
            </p>
            </div>
            <div class="input">
            <label>Pet Age:</label> 
            <p>
                <%= petage %>
            </p>
        </div>
        <div class="input">
            <label>Pet Breed:</label> 
            <p>
                <%= petbreed %>
            </p>
        </div>
            <button class="btnn" ><a href="delete_pet.jsp?petId=<%= petId %>">Delete</a></button>
        </div>
    <% 
            }
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <script>
    

    
    </script>
    </div>
</body>
</html>
