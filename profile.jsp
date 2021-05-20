<%-- 
    Document   : profile
    Created on : 03-Jul-2018, 17:33:22
    Author     : Kartik Manral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>




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
    <body background="loginimage.jpeg" style="background-size:100% 700px;background-attachment: fixed;">

        <%
            String uid = (String) session.getAttribute("email_id");
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/Car_Rental");
                PreparedStatement st = cn.prepareStatement("select * from customer where email_id=?");
                st.setString(1, uid);

                ResultSet rs = st.executeQuery();
                if (rs.next()) {

        %>

        <header id="header" id="home">
            <div class="container">
                <div class="row align-items-center justify-content-between d-flex">
                    <div id="logo">
                        <a href="index.html"><img src="logo.jpg" height="80" width="150"></a>
                    </div>
                    <nav id="nav-menu-container">
                        <ul class="nav-menu">
                            <li>
                                <p>
                                <h4 style="color:white"> Hello <%=rs.getString(1)%></h4>
                                </p>
                            </li>
                            <li><a href="index.html">	

                                    <div class="group">

                                        <input type="submit" class="button" value="Logout">

                                    </div></a></li>

                        </ul>
                    </nav>
                </div>
        </header>
        <div class="sidenav"><br><br><br><br>

            <ul>
                <li style="margin: 5px; color: white;"><a href="profile.jsp">Profile</a></li>
                <li style="margin: 5px; "><a href="pay.html">Payment</a></li>
                <li style="margin: 5px; "><a href="booking.jsp">Booking</a></li>
                <li style="margin: 5px; "><a href="feedback.jsp">Feedback</a></li>
                <li style="margin: 5px; "><a href="prebooking.html">Previous Booking</a></li>
            </ul>
        </div>
    </div>
    <script>
        /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
        var dropdown = document.getElementsByClassName("dropdown-btn");
        var i;

        for (i = 0; i < dropdown.length; i++) {
            dropdown[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                    dropdownContent.style.display = "none";
                } else {
                    dropdownContent.style.display = "block";
                }
            });
        }
    </script>

    <div class="login-wrap">


        <div class="login-html">
            <br>
            <br>
            <br>
            <br>
            <br>	
            <div style="position:absolute;top:100px;left:220px;height:150px;width:150px;border-radius:50%;">
                <img src="img/profile.png">
            </div>	
            <form action="updateprofile.jsp" method="post">
                <h3 style="color:white">Profile</h3>
                <br>			
                <div class="profile-form">

                    <div class="login-password-htm">

                        <div class="group">

                            <label for="Name" class="label" style="color:white">Name</label>

                            <input name="Name" type="text" class="input" value="<%=rs.getString(1)%>">

                        </div>
                        <div class="group">

                            <label for="Mobile Number" class="label" style="color:white">Mobile Number</label>

                            <input name="Mobile Number" type="text" class="input" value="<%=rs.getString(4)%>">

                        </div>
                        <div class="group">

                            <label for="user" class="label" style="color:white">Address</label>

                            <input name="user" type="text" class="input" value="<%=rs.getString(3)%>">

                        </div>
                        <div class="group">

                            <label for="user" class="label" style="color:white">Age</label>

                            <input name="age" type="text" class="input" value="<%=rs.getString(7)%>">

                        </div>
                        <div class="group">

                            <label for="Licence" class="label" style="color:white">Licence</label>

                            <input name="Licence" type="number" class="input" value="<%=rs.getString(5)%>">

                        </div>

                        <div class="group">


                            <input type="submit" class="button" value="Update">


                        </div>


                    </div>

                </div>
            </form>

        </div>

    </div>




    <!-- End footer Area -->		

    <script src="js/vendor/jquery-2.2.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="js/vendor/bootstrap.min.js"></script>			
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>			
    <script src="js/easing.min.js"></script>			
    <script src="js/hoverIntent.js"></script>
    <script src="js/superfish.min.js"></script>	
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>	
    <script src="js/owl.carousel.min.js"></script>			
    <script src="js/jquery.sticky.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>	
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>					
    <script src="js/parallax.min.js"></script>		
    <script src="js/mail-script.js"></script>	
    <script src="js/main.js"></script>	

    <%
            }
        } catch (Exception ex) {
            out.print(ex);
        }
    %>
</body>
</html>
