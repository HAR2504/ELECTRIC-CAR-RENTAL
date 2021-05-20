
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>MAIL</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="CSS/MF.css">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
    </head>   
    <body background="Images/bg1.jpg" style="background-repeat: no-repeat;background-attachment: fixed;background-position: top;">
<%
    //Creating a result for getting status that messsage is delivered or not!
    String result="";
    // Get recipient's email-ID, message & subject-line from index.html page
    final String messg = "OTP is 567382";
    final String subject = "OTP To CHANGE PASSWORD";
    final String to = request.getParameter("mail");
 
    // Sender's email ID and password needs to be mentioned
    final String from = "kartikmalhotra06@gmail.com";
    final String pass = "kartik6398";
 
    // Defining the gmail host
    String host = "smtp.gmail.com";
 
    // Creating Properties object
    try {
        Properties props = new Properties();

        // Defining properties
        props.put("mail.smtp.host", host);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.user", from);
        props.put("mail.password", pass);
        props.put("mail.port", "587");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");


        // Authorized the Session object.
        Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        });

    
          //  Class.forName("org.apache.derby.jdbc.ClientDriver");
           // Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/trendz");
           // PreparedStatement st = cn.prepareStatement("select em from user_details");
           // ResultSet rs = st.executeQuery();
           // while (rs.next()) 
            //{
                    
            // Create a default MimeMessage object.
                MimeMessage message = new MimeMessage(mailSession);
                // Set From: header field of the header.
                message.setFrom(new InternetAddress(from));
                // Set To: header field of the header.
                message.addRecipient(Message.RecipientType.TO,
                        new InternetAddress(to));
                // Set Subject: header field
                message.setSubject(subject);
                // Now set the actual message
                message.setText(messg);
                // Send message
                Transport.send(message);
                %>
                <jsp:forward page="forgetpassword2.jsp"/>
             <% }
    catch (MessagingException mex) {
        //mex.printStackTrace();
        out.println(mex);
        result = "Error: unable to send mail....";
    }
    catch (Exception mex) {
        //mex.printStackTrace();
        out.println(mex);
        result = "Error: unable to send mail....";
    }
%>

<div class="sentbox">
            <img src="logo.jpg" alt="Avatar" class="avatar">
            <center><h1 style="color:black;margin-top: 40px;"><% out.println(result);%></h1></center>
            </div>
           
 </body>
</html>   
