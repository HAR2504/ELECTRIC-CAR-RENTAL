<%-- 
    Document   : newuser
    Created on : 10-Jul-2018, 16:38:21
    Author     : Kartik Manral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
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
	<style>
		th,td{
			color:white;
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
                PreparedStatement st=cn.prepareStatement("select * from customer");
                
                ResultSet rs=st.executeQuery();
                
             
                %>
                
                <body style="background-color:#04091e;">

  
	<header id="header" id="home">
	<div class="container">
	<div class="row align-items-center justify-content-between d-flex">
	<div id="logo">
		<a href="index.html"><img src="download.png" height="50" width="200"></a>
	</div>
	<nav id="nav-menu-container">
	<ul class="nav-menu">	
            <a href="index.html">
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

<div style="padding: 130px 20px 15px 300px; ">
	<table border="1" bgcolor="3498db" cellpadding="30"> 
	<tr>
                            
<th>Name</th>
                            
<th>Email ID</th>
                           
<th>Address</th>
                            
<th>Phone Number</th>
                            
<th>Licence Number</th>
                            
<th>Status</th>

<th>Age</th>               

</tr>
<%
                while(rs.next())
                {
                    %>
                    <tr>
                        <td>
                          <%=rs.getString(1)%>
                        </td>
                        <td>
                           <%=rs.getString(2)%>  
                        </td>
                        <td>
                           <%=rs.getString(3)%>  
                        </td>
                        <td>
                            <%=rs.getString(4)%> 
                        </td>
                        <td>
                           <%=rs.getString(5)%>  
                        </td>
                        <td>
                            <%=rs.getString(6)%> 
                        </td>
                        <td>
                            <%=rs.getString(7)%> 
                        </td>
                    </tr>
                    
                        
                    <%
                }

%>

</table>
</div>

        <table border="1" bgcolor="3498db">
                        

        </table>
        <%
             
            }
            catch(Exception ex)
            {
                out.print(ex);
            }
        %>
        
         
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
    </body>
</html>
