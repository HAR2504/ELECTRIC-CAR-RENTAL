<%-- 
    Document   : signup
    Created on : 03-Jul-2018, 14:30:44
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
            String un,p,e,nm,en,km,ss,ry,hp,y,z,u;
            
            un=request.getParameter("us");
            p=request.getParameter("p1");
            e=request.getParameter("p2");
            nm=request.getParameter("em");
            en=request.getParameter("ut");
            km=request.getParameter("ag");
            ss=request.getParameter("ty");
            ry=request.getParameter("th");
            hp=request.getParameter("ad");
            y=request.getParameter("ph");
            z=request.getParameter("ln");
            u=request.getParameter("adn");
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/Car_Rental");
                PreparedStatement st=cn.prepareStatement("insert into customer values(?,?,?,?,?,'no',?)");
                st.setString(1, un);
                st.setString(2, nm);
                st.setString(3, hp);
                st.setString(4, y);
                st.setString(5, z);
                st.setString(6,km);
                st.executeUpdate();
                
                st=cn.prepareStatement("insert into login values(?,'customer',?)");
                st.setString(1,p);
                st.setString(2,nm);

                st.executeUpdate();
                
                
                %>
                <jsp:forward page="login.html"/>
                <%
                
                
                cn.close();
            }
            catch(Exception ex)
            {
                out.print(ex);
            }
        %>
    </body>
</html>
