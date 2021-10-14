<%-- 
    Document   : login
    Created on : 8 Oct, 2021, 8:22:06 PM
    Author     : prart
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="./styles/styles.css">
    </head>
    <body>
        <%
        String uname=request.getParameter("uname");
        String pass=request.getParameter("upass");
        ResultSet rs=null;
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/MiniProjectDB ","prar","1303");
            Statement stmt=con.createStatement();
            rs=stmt.executeQuery("select password,username from credentialsDB where username='"+uname+"'");
            rs.next();
            if(pass.equals(rs.getString(1)))
            {
                String name=rs.getString(2);
                out.println("<div class='container'>");
                out.println("<p class='heading' style='text-align:center;'>"+name+", you are successfully logged in!</p>");
                out.println("<a class='btn'  href='viewComplaints.jsp'>My Complaints</a>");
                out.println("<a class='btn'  href='complaint.html'>New Complaint</a>");
                out.println("<a class='btn'  href='profile.jsp'>My Profile</a>");
                session.setAttribute("username",rs.getString(2));
                session.setAttribute("password",rs.getString(1));
                out.println("</div>");
                
            }
            else
            {
            out.println("<p>Incorrect Credentials!</p>");
            %>
            <jsp:include page="index.html"></jsp:include>
            <%
            }
        }catch(Exception e){
        out.println("<h1>User does not exist!!!!!</h1>");
        %>
        <jsp:include page="index.html"></jsp:include>
        <%
        }
        %>
    </body>
</html>
