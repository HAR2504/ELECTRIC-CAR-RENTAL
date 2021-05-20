
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHECK</title>
    </head>
    <body>
        <%
            String password;
            String email_id=(String) session.getAttribute("email");
            password=request.getParameter("pass");
            
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn=DriverManager.getConnection("jdbc:derby://localhost:1527/trendz");
                
                PreparedStatement st=cn.prepareStatement("update login set password=? where email_id=?");
                st.setString(1,password);
                st.setString(2,email_id);
                st.executeUpdate();
                cn.close();
                
                %>
                
                <jsp:forward page="login.html"/>
                <%
               
               
              
            }
            catch(Exception ex)
            {
                out.print(ex);
            }
        %>
    </body>
</html>
