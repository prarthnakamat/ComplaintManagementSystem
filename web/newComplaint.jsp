<%-- 
    Document   : newComplaint
    Created on : 8 Oct, 2021, 8:58:15 PM
    Author     : prart
--%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.*" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
        <link rel="stylesheet" href="./styles/styles.css">
    </head>
    <body>
        <%
            String username = session.getAttribute("username").toString();
            String subject=request.getParameter("subject");
            String complaint=request.getParameter("complaint");
            
            String date = (new java.util.Date()).toLocaleString();
                try
                {
                    
                    
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/MiniProjectDB ","prar","1303");
                    PreparedStatement stmt=con.prepareStatement("insert into complaintsDB (id,username,subject,complaint,date,status)values(?,?,?,?,?,?)");
                    PreparedStatement stmt2=con.prepareStatement("SELECT max(id) FROM complaintsDB");
                    ResultSet rs = stmt2.executeQuery();
                   rs.next();
                           int i = Integer.parseInt(rs.getString(1));
                    stmt.setInt(1,i+1);
                    stmt.setString(2,username);
                    stmt.setString(3,subject);
                    stmt.setString(4,complaint);
                    stmt.setString(5,date);
                    stmt.setString(6,"no response");
                    out.println("<div class='container'>");
                    
                    int row=stmt.executeUpdate();
                    if(row==1)
                    {
                        out.println("<p class='heading' style='text-align:center; margin-top:40px'>Complaint has been registered successfully</p>");
                    }
                    else
                    {
                        out.println("<p class='heading' style='text-align:center; margin-top:40px'>Error in registering complaint.<br><br>  Please try again</p>");
                    }
                    out.println("</div>");
                    
                }
                catch(Exception e){out.println(e);
                }
        %>
        
    </body>
</html>
