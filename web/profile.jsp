<%-- 
    Document   : profile.jsp
    Created on : 9 Oct, 2021, 5:43:37 PM
    Author     : prart
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <link rel="stylesheet" href="./styles/styles.css">
    </head>
    <body>
        
        <%
            String username = session.getAttribute("username").toString();
            try
                {
                   Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/MiniProjectDB ","prar","1303");
                    PreparedStatement stmt=con.prepareStatement("SELECT username,contact,email from credentialsDB where username='"+username+"'");
                    ResultSet rs = stmt.executeQuery();
                    rs.next();
        %>
        <div class="container">
            <p class="heading" style="text-align: center;">My Profile</p>
            <p>&nbsp;Username : <%=rs.getString(1)%>&nbsp;</p>
            <p>&nbsp;Contact : <%=rs.getString(2)%>&nbsp;</p>
            <p>&nbsp;Email : <%=rs.getString(3)%>&nbsp;</p>
        </div>
        
                
                    
        <%
                }
                catch(Exception e)
                {
                    out.println(e);
                }     
        %>
            
    </body>
</html>
