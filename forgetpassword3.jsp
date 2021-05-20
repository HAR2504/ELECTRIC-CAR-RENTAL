
;<%-- 
    Document   : checkotp
    Created on : 10 Jul, 2018, 9:44:44 AM
    Author     : kartik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/style2.css">


        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/nice-select.css">					
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">			
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                font-family: "Lato", sans-serif;
            }

            .sidenav {
                height: 1000px;
                width: 200px;
                position: absolute;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: rgba(40,57,101,.9);
                overflow-x: hidden;
                padding-top: 20px;
            }
            .sidenav a, .dropdown-btn {
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 20px;
                color: #818181;
                display: block;
                border: none;
                background: none;
                width: 100%;
                text-align: left;
                cursor: pointer;
                outline: none;
            }

            .sidenav a:hover, .dropdown-btn:hover {
                color: #f1f1f1;
            }

            .main {
                margin-left: 200px; /* Same as the width of the sidenav */
                font-size: 20px; /* Increased text to enable scrolling */
                padding: 0px 10px;
            }
            .active {
                background-color: green;
                color: white;
            }
            .dropdown-container {
                display: none;
                background-color: #262626;
                padding-left: 8px;
            }
            .fa-caret-down {
                float: right;
                padding-right: 8px;
            }
            @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 18px;}
            }
        </style>
       
    </head>
    <body>
 <div>
            <br> <img src="logo.png" height="150" width="150" style="margin-left:600px;">
        </div>
        <div class="mail">
        <%

            String x ="567382";

            String y = request.getParameter("otp");

            

            if (x.equals(y)) {

                out.print("otp correct");

            } else {

                out.print("otp incorrect");

            }

        %>

    </body>


</html>
