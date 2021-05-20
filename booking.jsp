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
    height: 650px;
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
    <%
            String uid= (String) session.getAttribute("email_id");
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/Car_Rental");
                PreparedStatement st=cn.prepareStatement("select * from customer where email_id=?");
                st.setString(1, uid);
                ResultSet rs=st.executeQuery();
                if(rs.next()){
                
             
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
                                            
                                             
					</div></a>
				</li>		
                		
	</ul>
	</nav>
	</div>
	</header>
         <div class="sidenav"><br><br><br><br>
            
            <ul>
                <li style="margin: 5px; color: white;"><a href="profile.html">Profile</a></li>
                <li style="margin: 5px; "><a href="pay.html">Payment</a></li>
                <li style="margin: 5px; "><a href="booking.jsp">Booking</a></li>
                <li style="margin: 5px; "><a href="feedback.html">Feedback</a></li>
                <li style="margin: 5px; "><a href="prebooking.html">Previous Booking</a></li>
            </ul>
            </div>
	<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>	
	<div class="container">
	<div class="row fullscreen d-flex align-items-center justify-content-center">
	<div class="col-lg-5  col-md-6 header-right">
	<h4 class="text-white pb-30">Book Your Car Today!</h4>
        <form class="form" role="form" autocomplete="off" action="payment.jsp" method="post">
	<div class="form-group">
		<div class="default-select" id="default-select">
		<select name="car">
			<option value="" disabled selected hidden>Select Your Car</option>
			<option value="Hatchback">Hatchback</option>
			<option value="Sedan">Sedan</option>
			<option value="SUV">SUV</option>
		</select>
		</div>
		</div>
		<div class="form-group row">
			<div class="col-md-6 wrap-left">
				<div class="default-select" id="default-select"">
					
 					<input class="form-control txt-field" type="text" name="Pickup" placeholder="Pickup">
				</div>
			</div>
			<div class="col-md-6 wrap-right">
				<div class="input-group dates-wrap">                                          
					<input id="datepicker" class="dates form-control" id="exampleAmount" name="pdate" placeholder="Date & time" type="date">                        
					<div class="input-group-prepend">
						<span  class="input-group-text"><span class="lnr lnr-calendar-full"></span></span>
					</div>											
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-md-6 wrap-left">
				<div class="default-select" id="default-select"">
					<form action=" ">
 					<input class="form-control txt-field" type="text" name="Drop-off" placeholder="Drop-off">
				</div>
			</div>
			<div class="col-md-6 wrap-right">
				<div class="input-group dates-wrap">                                              
					<input id="datepicker2" class="dates form-control" id="exampleAmount" name="ddate" placeholder="Date & time" type="date">                        
					<div class="input-group-prepend">
						<span  class="input-group-text"><span class="lnr lnr-calendar-full"></span></span>
					</div>											
				</div>
			</div>
		</div>							    
		<div class="from-group">
			<input class="form-control txt-field" type="text" name="name" placeholder="<%=rs.getString(1)%>">
			<input class="form-control txt-field" type="email" name="email" placeholder="<%=rs.getString(2)%>">
			<input class="form-control txt-field" type="tel" name="phone" placeholder="<%=rs.getString(4)%>">
                        <input class="form-control txt-field" type="text" name="code" placeholder="Enter offer code">
		</div>
		<div class="form-group row">
			<div class="col-md-12">
				<input type="submit" class="btn btn-default btn-lg btn-block text-center text-uppercase" value="Confirm Car Booking">
			</div>
		</div>
		</form>
	</div>											
	</div>
	</div>					
	</section>
<section class="model-area section-gap" id="cars">

<div class="container">

<div class="row d-flex justify-content-center pb-40">

<div class="col-md-8 pb-40 header-text">

<h1 class="text-center pb-10">Choose your Desired Car Model</h1>

<p class="text-center">
	Who are in extremely love with eco friendly system.
</p>
	
</div>

</div>
<div class="active-model-carusel">

<div class="row align-items-center single-model item">

<div class="col-lg-6 model-left">

<div class="title justify-content-between d-flex">

<h4 class="mt-20">Ford Freestyle</h4>

</div>

<p>
We have the following features in this car 
</p>

<ul class="unordered-list">
	<li>Seating Capacity:5</li>
	<li>Fuel Type:Petrol</li>
	<li>Mileage:19kmpl</li>
	<li>Transmission Type:Manual</li>
	<li>Max Power:95bhp</li>
	<li>Airbags:6</li><br><br>
</ul>
</div>

<div class="col-lg-6 model-right">

<img class="img-fluid" src="img/freestyle.jpg" alt="">

</div>

</div>

<div class="row align-items-center single-model item">

<div class="col-lg-6 model-left">

<div class="title justify-content-between d-flex">

<h4 class="mt-20">Maruti Swift</h4>

</div>

<p>
We have the following features in this car 
</p>

<ul class="unordered-list">
	<li>Seating Capacity:5</li>
	<li>Fuel Type:Petrol</li>
	<li>Mileage:22kmpl</li>
	<li>Transmission Type:Manual</li>
	<li>Max Power:82bhp</li>
	<li>Airbags:2</li><br><br>
</ul>
</div>

<div class="col-lg-6 model-right">

<img class="img-fluid" src="img/swift.jpeg" alt="">

</div>

</div>
						
<div class="row align-items-center single-model item">

<div class="col-lg-6 model-left">

<div class="title justify-content-between d-flex">

<h4 class="mt-20">Honda Brio</h4>

</div>

<p>
We have the following features in this car 
</p>

<ul class="unordered-list">
	<li>Seating Capacity:5</li>
	<li>Fuel Type:Petrol</li>
	<li>Mileage:16kmpl</li>
	<li>Transmission Type:Manual</li>
	<li>Max Power:87bhp</li>
	<li>Airbags:2</li><br><br>
</ul>
</div>

<div class="col-lg-6 model-right">

<img class="img-fluid" src="img/brio.jpg" alt="">

</div>

</div>
						
						
<div class="row align-items-center single-model item">
							
<div class="col-lg-6 model-left">
								
<div class="title justify-content-between d-flex">
									
<h4 class="mt-20">Honda Amaze</h4>
																	
</div>
								
<p>


We have the following cars in this category</p>
								
<ul class="unordered-list">
	<li>Seating Capacity:5</li>
	<li>Fuel Type:Petrol</li>
	<li>Mileage:19.5kmpl</li>
	<li>Transmission Type:Manual</li>
	<li>Max Power:89bhp</li>
	<li>Airbags:2</li><br><br>	
</ul>							
</div>
							
<div class="col-lg-6 model-right">
								
<img class="img-fluid" src="img/amaze.jpg" alt="">
							
</div>
						
</div>
	
<div class="row align-items-center single-model item">
							
<div class="col-lg-6 model-left">
								
<div class="title justify-content-between d-flex">
									
<h4 class="mt-20">Maruti Suzuki Dezire</h4>
																	
</div>
								
<p>


We have the following cars in this category</p>
								
<ul class="unordered-list">
	<li>Seating Capacity:5</li>
	<li>Fuel Type:Petrol</li>
	<li>Mileage:28.4kmpl</li>
	<li>Transmission Type:Manual</li>
	<li>Max Power:74bhp</li>
	<li>Airbags:2</li><br><br>	
</ul>							
</div>
							
<div class="col-lg-6 model-right">
								
<img class="img-fluid" src="img/dzire.jpg" alt="">
							
</div>
						
</div>
	
<div class="row align-items-center single-model item">
							
<div class="col-lg-6 model-left">
								
<div class="title justify-content-between d-flex">
									
<h4 class="mt-20">Honda City</h4>
																	
</div>
								
<p>


We have the following cars in this category</p>
								
<ul class="unordered-list">
	<li>Seating Capacity:5</li>
	<li>Fuel Type:Petrol</li>
	<li>Mileage:17.5kmpl</li>
	<li>Transmission Type:Manual</li>
	<li>Max Power:117bhp</li>
	<li>Airbags:2</li><br><br>	
</ul>							
</div>
							
<div class="col-lg-6 model-right">
								
<img class="img-fluid" src="img/city.png" alt="">
							
</div>
						
</div>
	
					
<div class="row align-items-center single-model item">
							
<div class="col-lg-6 model-left">
								
<div class="title justify-content-between d-flex">
									
<h4 class="mt-20">Mahindra Scorpio</h4>
																	
</div>
								
<p>


We have the following cars in this category
</p>

<ul class="unordered-list">
	<li>Seating Capacity:8</li>
	<li>Fuel Type:Diesel</li>
        <li>Mileage:19kmpl</li>
	<li>Transmission Type:Manual</li>
	<li>Max Power:120bhp</li>
	<li>Airbags:2</li><br><br>
</ul>							
</div>
							
<div class="col-lg-6 model-right">
								
<img class="img-fluid" src="img/mahindrascorpio.jpg" alt="">
							
</div>
						
</div>	
<div class="row align-items-center single-model item">
							
<div class="col-lg-6 model-left">
								
<div class="title justify-content-between d-flex">
									
<h4 class="mt-20">Mahindra TUV 300</h4>
																	
</div>
								
<p>


We have the following cars in this category</p>
								
<ul class="unordered-list">
	<li>Seating Capacity:7</li>
	<li>Fuel Type:Diesel</li>
	<li>Mileage:18.9kmpl</li>
	<li>Transmission Type:Manual</li>
	<li>Max Power:100bhp</li>
	<li>Airbags:2</li><br><br>	
</ul>							
</div>
							
<div class="col-lg-6 model-right">
								
<img class="img-fluid" src="img/tuv.jpg" alt="">
							
</div>
						
</div>
	
<div class="row align-items-center single-model item">
							
<div class="col-lg-6 model-left">
								
<div class="title justify-content-between d-flex">
									
<h4 class="mt-20">Maruti Suzuki Vitara Brezza</h4>
																	
</div>
								
<p>


We have the following cars in this category</p>
								
<ul class="unordered-list">
	<li>Seating Capacity:5</li>
	<li>Fuel Type:Deisel</li>
	<li>Mileage:24.29kmpl</li>
	<li>Transmission Type:Manual</li>
	<li>Max Power:89bhp</li>
	<li>Airbags:2</li><br><br>	
</ul>							
</div>
							
<div class="col-lg-6 model-right">
								
<img class="img-fluid" src="img/brezza.jpg" alt="">
							
</div>
						
</div>
	
										
					
</div>
				
</div>	
			
</section>
			
			
<section class="callaction-area relative section-gap">
				
<div class="overlay overlay-bg"></div>
				
<div class="container">
					
<div class="row justify-content-center">
						
<div class="col-lg-10">
							
<h1 class="text-white">Experience Great Support</h1>
							
<h4 style="color:white">It was great plesaure using your services, as all process being online it was really hassle free experience.</h4>

<h4 style="color:white"><center>-Mustak R</center></h4><br>						
<a class="callaction-btn text-uppercase" href="contact.html">Contact Us</a>	
						
</div>
					
</div>
				
</div>	
			
</section>
			
				
			

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
									

																
</ul>								
							
</div>
						
</div>
						
<div class="col-lg-2 col-md-6 col-sm-6 social-widget">
							
<div class="single-footer-widget">
								
<h6>Follow Us</h6>
								
<p>Let us be social</p>
								
<div class="footer-social d-flex align-items-center">
									
<a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a>
									
<a href="https://www.instagram.com"><i class="fa fa-instagram"></i></a>																
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
				

			
<script src="js/vendor/jquery-2.2.4.min.js"></script>
			
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
</script>
			
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