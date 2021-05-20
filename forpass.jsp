
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>LOST PASSWORD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/nice-select.css">					
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">			
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/style2.css">
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
    <body background="loginimages.jpeg" style="background-size:100% 700px;background-attachment: fixed;">
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
     
        <div class="forgetbox">
            <form action="forpass2.jsp" method="post">
                
                <p>USERNAME</p>
                <input type="text" name="em" placeholder="Enter your registered email" required>
                <input type="submit" name="submit" value="ENTER">
            </form>
                </div>
      <%
                     
                
                }      
                cn.close();
                      
                
                
            }
            catch(Exception ex)
            {
                out.print(ex);
            }
        %>      
    </body>
</html>
