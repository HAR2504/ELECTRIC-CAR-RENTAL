<%-- 
    Document   : login
    Created on : 03-Jul-2018, 11:02:08
    Author     : Kartik Manral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            String un,p;
            
            un=request.getParameter("user");
            p=request.getParameter("pass");
            
            try 
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/Car_Rental");
                PreparedStatement st=cn.prepareStatement("select * from login where email_id=? and password=?");
                st.setString(1,un);
                st.setString(2,p);
                
                ResultSet rs= st.executeQuery();
                if(rs.next())
                {   
                    
                    //out.print(un+ " "+ p + " "+ rs.getString(2)+ " "+"abc");
                    if(rs.getString(2).trim().equals("customer"))
                    {
                        session.setAttribute("email_id",un);
              
                        %>
                        <jsp:forward page="profile.jsp"/>
                        <%
                    }
                    else if(rs.getString(2).trim().equals("admin"))
                    {
                        session.setAttribute("email_id",un);
                        %>
                        <jsp:forward page="profilea.jsp"/>
                        <%
                    }
                    else if(rs.getString(2).trim().equals("employee"))
                    {
                        session.setAttribute("email_id",un);
                        %>
                        <jsp:forward page="profilee.jsp"/>
                        <%
                    }
                 
                }
                else
                {
                      %>
                        <jsp:forward page="login.html"/>
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
