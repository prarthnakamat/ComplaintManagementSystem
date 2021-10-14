<%-- 
    Document   : adminLogin
    Created on : 9 Oct, 2021, 12:25:17 PM
    Author     : prart
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link rel="stylesheet" href="./styles/styles.css">
    </head>
    <body>
        <%
            String aname=request.getParameter("aname");
            String pass=request.getParameter("upass");
            ResultSet rs=null;
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/MiniProjectDB ","prar","1303");
                Statement stmt=con.createStatement();
                rs=stmt.executeQuery("select password,username from adminDB where username='"+aname+"'");
                rs.next();
                if(pass.equals(rs.getString(1)))
                {
                    String name=rs.getString(2);
                    out.println("<div class='container'>");
                    out.println("<p class='heading' style='text-align:center;'>"+name+", you are successfully logged in!</p>");
                    out.println("<a class='btn' href='adminComplaintsPage.jsp' style='text-align:center'>View and Update Complaints</a>");
                    out.println("</div>");
                    session.setAttribute("aname",rs.getString(2));
                }
                else
                {
                out.println("<p class='heading' style='text-align:center;'>Incorrect credentials!</p>");
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
