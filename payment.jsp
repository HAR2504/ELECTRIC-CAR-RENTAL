<%-- 
    Document   : payment
    Created on : 10-Jul-2018, 15:55:15
    Author     : Kartik Manral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
	<title>Payment</title>
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
dd { margin-left: 75px; }
    
#mode_margin { margin-left: 0px; }
</style>
</head>
    <body>
       <%
            String uid= (String) session.getAttribute("email_id");
            String a,b,c,d,e,f,g,h,code;
            int s,count=0;
            double price=0;
            a=request.getParameter("car");
            b=request.getParameter("pickup");
            c=request.getParameter("pdate");
            d=request.getParameter("drop0ff");
            e=request.getParameter("ddate");
            f=request.getParameter("name");
            g=request.getParameter("email");
            h=request.getParameter("phone");
            code=request.getParameter("code");
            
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/Car_Rental");
                PreparedStatement st=cn.prepareStatement("select max(book_id) from booking");
                ResultSet rs=st.executeQuery();
                PreparedStatement st2,st3,st4,st5;
                ResultSet rs2,rs3,rs4;
                if(rs.next())
                {
                    s=rs.getInt(1)+1;
                }
                else{
                    s=101;
                }
                
                st=cn.prepareStatement("select * from offer where code=?");
                st.setString(1, code);
                rs=st.executeQuery();
                if(rs.next())
                {
                    count=1;
                    st3=cn.prepareStatement("select * from driver where availability='Yes'");
                    rs2=st3.executeQuery();
                    if(rs2.next())
                    {
                         st4=cn.prepareStatement("select * from car where car_type=? and status='Available'");
                         st4.setString(1, a);
                         rs3=st4.executeQuery();
                         if(rs3.next())
                         {
                            st2=cn.prepareStatement("insert into booking values(?,?,?,?,?,?,?,?,?)");
                            st2.setString(1, code);
                            st2.setString(2, rs3.getString(8));
                            st2.setInt(3, rs2.getInt(1));
                            st2.setString(4, c );
                            st2.setString(5, "Availabe");
                            st2.setString(6, e);
                            st2.setInt(7, s);
                            st2.setString(8, uid);
                            st2.setDouble(9,rs3.getDouble(11));
                            st2.executeUpdate();
                            
                            
                         }
                         
                    }
                }
                else{
                    count=0;
                    
                    st3=cn.prepareStatement("select * from driver where availability='Yes'");
                    rs2=st3.executeQuery();
                    if(rs2.next())
                    {
                        
                         st4=cn.prepareStatement("select * from car where car_type=? and status='Available'");
                         st4.setString(1, a);
                         rs3=st4.executeQuery();
                         if(rs3.next())
                         {
                             
                            st2=cn.prepareStatement("insert into booking values(?,?,?,?,?,?,?,?,?)");
                            st2.setString(1, "non");
                            st2.setString(2, rs3.getString(8));
                            st2.setInt(3, rs2.getInt(1));
                            st2.setString(4, c );
                            st2.setString(5, "Available");
                            st2.setString(6, e);
                            st2.setInt(7, s);
                            st2.setString(8, uid);
                            st2.setDouble(9,rs3.getDouble(11));
                            st2.executeUpdate();
                            
                            price=rs3.getDouble(11);
                         }      
                        
                    }
                }
                if(count==1)
                {
                    st=cn.prepareStatement("select * from booking where book_id=?");
                    st.setInt(1, s);
                    rs=st.executeQuery();
                    if(rs.next())
                    {
                        st2=cn.prepareStatement("select * from car where reg_no=?");
                        st2.setString(1, rs.getString(2));
                        rs2=st2.executeQuery();
                        if(rs2.next())
                        {
                            st3=cn.prepareStatement("select * from offer where code=?");
                            st3.setString(1,rs.getString(1));
                            rs3=st3.executeQuery();
                            if(rs3.next())
                            {
                                
                                if(rs.getString(1).trim().equals("CR20")){
                                    
                                price=(rs2.getDouble(11)-(rs2.getDouble(11)*0.20));
                                st5=cn.prepareStatement("update booking set price=? where book_id=?");
                                st5.setDouble(1,price);
                                st5.setInt(2,s);
                                st5.executeUpdate();
                                }
                                else if(rs.getString(1).trim().equals("CR100")){
                                    
                                
                                price=(rs2.getDouble(11)-100);
                                st5=cn.prepareStatement("update booking set price=? where book_id=?");
                                st5.setDouble(1,price);
                                st5.setInt(2,s);
                                st5.executeUpdate();
                                }
                                else if(rs.getString(1).trim().equals("CR40")){
                                
                                price=(rs2.getDouble(11)-(rs2.getDouble(11)*0.4));
                                st5=cn.prepareStatement("update booking set price=? where book_id=?");
                                st5.setDouble(1,price);
                                st5.setInt(2,s);
                                st5.executeUpdate();
                                }
                                else if(rs.getString(1).trim().equals("CR10")){
                                
                                price=(rs2.getDouble(11)-(rs2.getDouble(11)*0.1));
                                st5=cn.prepareStatement("update booking set price=? where book_id=?");
                                st5.setDouble(1,price);
                                st5.setInt(2,s);
                                st5.executeUpdate();
                                }
                                else if(rs.getString(1).trim().equals("SP35s")){
                                    if(rs2.getString(9).trim().equals("SUV"))
                                    {
                                        price=3500;
                                        st5=cn.prepareStatement("update booking set price=? where book_id=?");
                                        st5.setDouble(1,price);
                                        st5.setInt(2,s);
                                        st5.executeUpdate();
                                    }
                                    
                                }
                                else if(rs.getString(1).trim().equals("CR-First")){
                                price=2500;
                                
                                st5=cn.prepareStatement("update booking set price=? where book_id=?");
                                st5.setDouble(1,price);
                                st5.setInt(2,s);
                                st5.executeUpdate();
                                }
                            }
                        }
                    }
                }
                
                
                
                st=cn.prepareStatement("select * from customer where email_id=?");
                st.setString(1,uid);
                rs=st.executeQuery();
                if(rs.next())
                {
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
                                <%
                }
                                st=cn.prepareStatement("select * from booking where book_id=?");
                st.setInt(1,s);
                rs=st.executeQuery();
                if(rs.next())
                {
                                
                                
                                %>
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
  		<li><a href="profile.html">Profile</a></li>
  		
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
	<h4 class="text-white pb-30"><center>Payment</center></h4>
	<form class="form"  autocomplete="off" action="pay.jsp" method="post">
	<div class="form-group">
								    
		<div class="from-group">
			 <label for="Booking ID" class="label" style="color: white">Booking ID</label>
			<input class="form-control txt-field" type="text" name="Booking id" placeholder="<%=s%>">
                         <label for="price" class="label" style="color: white">Amount</label>
			<input class="form-control txt-field" type="text" name="price" placeholder="<%=rs.getDouble(9)%>">
		</div>
		<h4 class="text-white pb-30"><center>Card Details</center></h4>
		<div class="from-group">
                    
                    <%
                }
                    st=cn.prepareStatement("select * from customer where email_id=?");
                    st.setString(1, uid);
                    rs=st.executeQuery();
                    if(rs.next())
                    {
                    
                    %>
                         <input class="form-control txt-field" type="text" name="name" placeholder="<%=rs.getString(2)%>"><%}%>
			<input class="form-control txt-field" type="text" name="cno" placeholder="Card Number">       
        	<dt style="color:white">Expiry Date</dt>
        	<dd>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td><select id="cc_exp_mm" name="cc_exp_mm">
                            <option value="">Month</option>
                            <option value="1" selected="selected">January</option>                                
                            <option value="2">February</option>                             
                            <option value="3">March</option>                          
                            <option value="4">April</option>                          
                            <option value="5">May</option>                           
                            <option value="6">June</option>                           
                            <option value="7">July</option>                          
                            <option value="8">August</option>                            
                            <option value="9">September</option>                    
                            <option value="10">October</option>                             
                            <option value="11">November</option>                            
                            <option value="12">December</option>                            
                        </select></td>                        
                    <td width="20">&nbsp;</td>                        
                    <td><select id="cc_exp_yyyy" name="cc_exp_yyyy">
					<option value="">Month</option>
                            <option value="2016" selected="selected">2016</option>                                
                            <option value="2017">2017</option>                             
                            <option value="2018">2018</option>                          
                            <option value="2019">2019</option>                          
                            <option value="2020">2020</option>                           
                            <option value="2021">2021</option>                           
                            <option value="2022">2022</option>                          
                            <option value="2023">2023</option>                            
                            <option value="2024">2024</option>                    
                            <option value="2025">2025</option>                             
                            <option value="2026">2026</option>                            
                            <option value="2027">2027</option>
                            <option value="2028">2028</option>                            
                            <option value="2029">2029</option>
                            <option value="2030">2030</option>
                        </select>                        
                    </td>                    
                </tr>                
            </table>            
        	</dd><br>
			<input class="form-control txt-field" type="tel" name="cvv" placeholder="CVV">
		</div>
		<div class="form-group row">
			<div class="col-md-12">
				<button type="submit" value="CONFIRM PAYMENT" class="btn btn-default btn-lg btn-block text-center text-uppercase"></button>
			</div>
		</div>
		</form>
	</div>											
	</div>
	</div>					
	</section>

				

			
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
            catch(Exception ex)
            {
                out.print(ex);
            }
        %>
    </body>
</html>
