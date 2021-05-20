<%-- 
    Document   : updateprofile
    Created on : 27-Jun-2018, 21:26:45
    Author     : kartik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
            String uid=(String) session.getAttribute("email_id");
            
            String nm=request.getParameter("Name");
            String ph=request.getParameter("Mobile Number");
            
            String ad=request.getParameter("user");
            String gn=request.getParameter("age");
            String dob=request.getParameter("Licence");
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/Car_Rental");
                PreparedStatement st=cn.prepareStatement("update customer set name=?,ph_no=?,address=?,age=?,licence_no=? where email_id=?");
                
                st.setString(1, nm);
                st.setInt(2,Integer.parseInt(ph));
                st.setString(3,ad);
                st.setInt(4,Integer.parseInt(gn));
                st.setString(5,dob);
                st.setString(6,uid);
                st.executeUpdate();
                
                %>
                <jsp:forward page="profile.jsp"/>
                <%
            }
            catch(Exception ex)
            {
                out.print(ex);
            }
        %>    
    </body>
</html>
