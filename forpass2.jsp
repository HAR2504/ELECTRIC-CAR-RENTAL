<%-- 
    Document   : forpass2
    Created on : Jul 5, 2018, 9:53:42 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FORGOT PASSWORD</title>
    </head>
    <body>
         <%
            
            String email_id;
            
            email_id=request.getParameter("em");
            
            try
            {
               Class.forName("org.apache.derby.jdbc.ClientDriver");
               Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/trendz");
               PreparedStatement st=cn.prepareStatement("select * from login where email_id=?");
               st.setString(1,email_id);
               ResultSet rs= st.executeQuery();
                if(rs.next())
                {
                    session.setAttribute("email",email_id);
                            %> 
                                <jsp:forward page="forgetpassword.jsp"/>
                            <%
                      }
                      
                     
              
                else
                {
                  
                    %>
                    <jsp:forward page="error.jsp"/>
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

       
