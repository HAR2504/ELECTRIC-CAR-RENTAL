<%-- 
    Document   : updatefeedback
    Created on : 17-Jul-2018, 11:15:19
    Author     : Kartik Manral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String uid= (String) session.getAttribute("email_id");
            
            String rate=request.getParameter("experience");
            String com=request.getParameter("com");
            String name=request.getParameter("name");
            
            
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/Car_Rental");
                PreparedStatement st=cn.prepareStatement("insert into feedback values(?,?,?,?)");
                st.setString(1, rate);
                st.setString(2, com);
                st.setString(3, name);
                st.setString(4, uid);
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
