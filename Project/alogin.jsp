<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<body>
   
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if ("admin".equals(username) && "admin".equals(password)) {
        // Redirect to ahome.jsp if credentials are correct
        response.sendRedirect("ahome.jsp");
    } else {
        // Redirect to alogin.html (login page) if credentials are incorrect
        response.sendRedirect("alogin.html");
    }
%>

</body>
</html>