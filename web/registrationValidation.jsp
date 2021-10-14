<%-- 
    Document   : home
    Created on : 8 Oct, 2021, 6:52:16 PM
    Author     : prart
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Account</title>
        <link rel="stylesheet" href="./styles/styles.css">
    </head>
    <body>
        <%
            String uname=request.getParameter("uname");
            String ucon=request.getParameter("ucon");
            String umail=request.getParameter("umail");
            String pass1=request.getParameter("upass1");
            String pass2=request.getParameter("upass2");
            if(pass1.equals(pass2))
            {
                try
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/MiniProjectDB ","prar","1303");
                    PreparedStatement stmt=con.prepareStatement("insert into credentialsDB (username,password,contact,email) values(?,?,?,?)");
                    stmt.setString(1,uname);
                    stmt.setString(2,pass1);
                    stmt.setString(3,ucon);
                    stmt.setString(4,umail);
                    int row=stmt.executeUpdate();
                    if(row==1)
                    {
                        out.println("<div class='container'");
                        out.println("<p class='heading' style='text-align:center;'>"+uname+", your account has been created!</p>");
                        out.println("</div>");
                    }
                    else
                    {
                        out.println("<div class='container'");
                        out.println("<p class='heading' style='text-align:center;'>Registration was not done. Please try again</p>");
                        out.println("</div>");
        %>
                    <jsp:include page="index.html"></jsp:include>
        <%
                    }
                }catch(Exception e){out.println(e);}
            }
            else
            {
                out.println("<h1>Password Mismatch</h1>");
        %>
            <jsp:include page="index.html"></jsp:include>
        <%
            }
        %>
    </body>
</html>
