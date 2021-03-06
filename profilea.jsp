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
        <link rel="stylesheet" href="css/style3.css">

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
            
    </head>
    <body background="loginimage.jpeg" style="background-size:100% 700px;background-attachment: fixed;">
        <%
            String uid= (String) session.getAttribute("email_id");
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/Car_Rental");
                PreparedStatement st=cn.prepareStatement("select * from admin where email_id=?");
                st.setString(1, uid);
                
                ResultSet rs=st.executeQuery();
                if(rs.next())                
                {
                
                %>
        
        <header id="header" id="home">
            <div class="container">
                <div class="row align-items-center justify-content-between d-flex">
                    <div id="logo">
                        <a href="index.html"><img src="download.png" height="50" width="200"></a>
                    </div>
                    <nav id="nav-menu-container">
                        <ul class="nav-menu">
                            <li>
                                <p>
                                            hello <%=rs.getString(2)%>
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
                <li><a href="profile.html">Profile</a></li>
                
                <li><a href="cartable.jsp">Cars</a></li>
                <li><a href="payment.html">Payment</a></li>
                <li><a href="booking.html">Booking</a></li>
                <li><a href="feedback.html">Feedback</a></li>
                <li><a href="employeetable.jsp"> Employee</a></li>
                <li><a href="drivertable.jsp">Driver</a></li>
            </ul>
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

                            <label for="Name" class="label" style="color: white">Name</label>

                            <input name="Name" type="text" class="input" placeholder="<%=rs.getString(2)%>">

                        </div>
                        <div class="group">

                            <label for="Mobile Number" class="label" style="color: white">Mobile Number</label>

                            <input name="Mobile Number" type="text" class="input" placeholder="<%=rs.getString(3)%>">

                        </div>
                        <div class="group">

                            <label for="user" class="label" style="color: white">Email Address</label>

                            <input name="user" type="text" class="input" placeholder="<%=rs.getString(4)%>">

                        </div>
                       
                        
                        <div class="group">

                            <input type="submit" class="button" value="Update">

                        </div>


                    </div>

                </div>
                </form>

            </div>

        </div>

        <footer class="footer-area section-gap">

            <div class="container">

                <div class="row">

                    <div class="col-lg-2 col-md-6 col-sm-6">

                        <div class="single-footer-widget">

                            <h6><a href="about.html">About Us</a></h6>

                            <ul>

                                <li><a href="about.html">Our Team</a></li>

                                <li><a href="about.html">Our Vision</a></li>

                                <li><a href="about.html">Car on Rent in your city</a></li>


                            </ul>								

                        </div>

                    </div>

                    <div class="col-lg-2 col-md-6 col-sm-6">

                        <div class="single-footer-widget">

                            <h6><a href="contact.html">Contact Us</a></h6>

                            <ul>

                                <li><a href="contact.html">Address</a></li>

                                <li><a href="contact.html">Phone Number</a></li>

                                <li><a href="contact.html">Feedback</a></li>

                            </ul>								

                        </div>

                    </div>

                    <div class="col-lg-2 col-md-6 col-sm-6 social-widget">

                        <div class="single-footer-widget">

                            <h6>Follow Us</h6>

                            <p>Let us be social</p>

                            <div class="footer-social d-flex align-items-center">

                                <a href="#"><i class="fa fa-facebook"></i></a>

                                <a href="#"><i class="fa fa-twitter"></i></a>

                            </div>

                        </div>

                    </div>							

                    <div class="info"></div>

                    </form>

                </div>

            </div>

        </div>	

        <p class="mt-50 mx-auto footer-text col-lg-12">

        </p>											

    </div>

</div>

</footer>	



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
            }
            catch(Exception ex)
            {
                out.print(ex);
            }
        %>
</body>
</html>
