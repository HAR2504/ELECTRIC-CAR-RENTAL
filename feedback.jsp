<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/nice-select.css">					
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">			
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/main.css">
        <style>
            body {
                font-family: "Lato", sans-serif;
            }
            .sidenav {
                height: 655px;
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
                        <li class="menu-active"><a href="index.html">Home</a></li>
                        <li><a href="cars.html">Cars</a></li>
                        <li><a href="drivers.html">Drivers</a></li>
                        <li><a href="offers.html">Offers</a></li>
                        <li><a href="offers">Booking</a></li>	
                        <li><a href="index.html">	
                                <div class="group">
                                    <input type="submit" class="button" value="Logout">
                                </div></a>
                        </li>		
                    </ul>
                </nav>
            </div>
    </header>
    <div class="sidenav"><br><br><br><br>
        <ul>
            <li><a href="profile.html">Profile</a></li>
            <li><a href="cars.html">Cars</a></li>
            <li><a href="payment.html">Payment</a></li>
            <li><a href="booking.html">Booking</a></li>
            <li><a href="feedback.html">Feedback</a></li>
            <li><a href="prebooking.html">Previous Booking</a></li>
        </ul>
    </div>

    <section class="banner-area relative" id="home">
        <div class="overlay overlay-bg"></div>	
        <div class="container">
            <div class="row fullscreen d-flex align-items-center justify-content-center">
                <div class="col-lg-5  col-md-6 header-right">
                    <h4 class="text-white pb-30"><center>Feedback</center></h4>

                    <div class="form-group">

                        <div>
                            <div>
                                <p style="color:white">
                                    Please provide your feedback below:
                                </p>
                                <form role="form" action="updatefeedback.jsp" method="post" id="reused_form">
                                    <div class="row">
                                        <div class="col-sm-12 form-group">
                                            <label style="color:white">How do you rate your overall experience?</label>
                                            <p style="color:white">
                                                <label class="radio-inline">
                                                    <input type="radio" name="experience" id="radio_experience" value="bad" >
                                                    Bad
                                                </label>

                                                <label class="radio-inline">
                                                    <input type="radio" name="experience" id="radio_experience" value="average" >
                                                    Average
                                                </label>

                                                <label class="radio-inline">
                                                    <input type="radio" name="experience" id="radio_experience" value="good" >
                                                    Good
                                                </label>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 form-group" style="color:white">
                                            <label for="comments">
                                                Comments:</label>
                                            <textarea class="form-control" type="textarea" name="com" id="comments" placeholder="Your Comments" maxlength="6000" rows="7"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6 form-group" style="color:white">
                                            <label for="name">
                                                Your Name:</label>
                                            <input type="text" class="form-control" id="name" name="name" value="<%=rs.getString(1)%>" required>
                                        </div>
                                        <div class="col-sm-6 form-group" style="color:white">
                                            <label for="email">
                                                Email:</label>
                                            <input type="email" class="form-control" id="email" name="email" value="<%=rs.getString(2)%>" required>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12 form-group">
                                            <button type="submit" class="btn btn-lg btn-warning btn-block" >Post </button>
                                        </div>
                                    </div>


                                    <div id="success_message" style="width:100%; height:100%; display:none; ">
                                        <h3>Posted your feedback successfully!</h3>
                                    </div>
                                    <div id="error_message"
                                         style="width:100%; height:100%; display:none; ">
                                        <h3>Error</h3>
                                        Sorry there was an error sending your form.

                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>	

                    </section>


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