
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NEW PASSWORD</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        
    </head>
     <body background="Images/bg1.jpg" style="background-repeat: no-repeat;background-attachment: fixed;background-position: top;">
        
         <div class="loginbox">
            <img src="Images/logo.png" alt="Avatar" class="avatar">
            <form action="forpass10.jsp" method="post">
                <p>ENTER YOUR NEW PASSWORD TWICE</p>
                <input type="password" name="pass">
                <input type="password" name="passw">
                <br/><br/>
                <input type="submit" name="submit" value="SUBMIT">

            </form>
        </div>
    
    </body>
</html>
