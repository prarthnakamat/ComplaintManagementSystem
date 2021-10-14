<%-- 
    Document   : deleteComplaint
    Created on : 9 Oct, 2021, 10:04:33 PM
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
        <title>Delete Complaint</title>
        <link rel="stylesheet" href="./styles/styles.css">
    </head>
    <body>
        <%
            int cid = Integer.parseInt(request.getParameter("id"));
            session.setAttribute("id",cid);
                try
                {
                    
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/MiniProjectDB ","prar","1303");
                    PreparedStatement stmt=con.prepareStatement("DELETE FROM COMPLAINTSDB WHERE ID="+cid+"");
                    stmt.execute();
        %>
            <div class="containerTable">
                    <p class="heading" style="text-align: center;">Complaint was successfully deleted</p>
                    <form action="index.html" method="post">
                            <br><input class="btn" type="submit" value='DONE'><br>
                    </form>  
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
