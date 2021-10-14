<%-- 
    Document   : updateStatus
    Created on : 9 Oct, 2021, 5:14:57 PM
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
        <title>Edit Complaint</title>
        <link rel="stylesheet" href="./styles/styles.css">
    </head>
    <body>
        <%
            String newStatus=request.getParameter("newStatus");
            String adminMessage=request.getParameter("adminMessage");
            int cid=Integer.parseInt(session.getAttribute("id").toString());
            try
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/MiniProjectDB ","prar","1303");
                    PreparedStatement stmt=con.prepareStatement("update complaintsDB set STATUS='"+newStatus+"',MESSAGE='"+adminMessage+"' WHERE ID="+cid+"");
                    
                    stmt.execute(); 
                    int row=stmt.executeUpdate();
                    if(row==1)
                    {
                        out.println("<div class='container'");
                        out.println("<p class='heading' style='text-align:center;'>Status and message have been updated</p>");
                        out.println("</div>");
                    }
                    else
                    {
                        out.println("<div class='container'");
                        out.println("Operation Unsuccessful");
                        out.println("</div>");
        %>
                    <jsp:include page="index.html"></jsp:include>
        <%
                    }
                }catch(Exception e){out.println(e);}
            
            
        %>
            
    </body>
</html>
