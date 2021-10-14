<%-- 
    Document   : adminComplaintsPage
    Created on : 9 Oct, 2021, 12:30:41 PM
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
        <title>Complaints</title>
        <link rel="stylesheet" href="./styles/styles.css">
        <style>
            body {
                font-family: 'Muli', sans-serif;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                margin: 0;
                height: 100%;
                background-color:#f2f2f2;
              }
        </style>
    </head>
    <body>
        <%
                try
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/MiniProjectDB ","prar","1303");
                    PreparedStatement stmt=con.prepareStatement("SELECT ID,subject,date,status,complaint,username from complaintsDB ORDER BY id ASC");
                    PreparedStatement stmt2=con.prepareStatement("SELECT COUNT(*) from complaintsDB");
                    ResultSet rs = stmt.executeQuery();
                    ResultSet rs2 = stmt2.executeQuery();
                    rs2.next();
                    int count = rs2.getInt(1);
                    int id=0;
        %>
            <div class="containerTable">
                <p class="heading" style="text-align: center;">Complaints</p>

            
        <%            
                    for(int i=1;i<=count;i++)
                    {
                        rs.next();
                        id=rs.getInt(1);
        %>
        


        <table border='0' class="table">
            <tr class="row1">
                <td  class="id">&nbsp;<%=rs.getInt(1)%>.&nbsp;</td>
                <td  class="subject">&nbsp;<%=rs.getString(2)%>&nbsp;</td>
                <td class="date">&nbsp;(<%=rs.getString(3)%>)&nbsp;</td>
                <td  class="status">&nbsp;<%=rs.getString(4)%>&nbsp;
                <a  class="status edit" href="editStatus.jsp?id=<%=id%>">Edit</a>
                <a  class="delete" href="deleteComplaint.jsp?id=<%=id%>">Delete</a>
                </td>
            </tr>
            <tr class="row2">
                <td></td>
                <td colspan="3">
                    <p class="complaint">&nbsp;<%=rs.getString(5)%></p>
                </td>
            </tr>
            <tr class='row3'>
                <td></td>
                <td class="adminMsg" colspan="3">
                    &nbsp;Complainant:  <%=rs.getString(6)%>
                </td>
            </tr>
            <br>
        </table> 
                    
        <%
                    }
%>         </div>
<%
                }
                catch(Exception e)
                {
                    out.println(e);
                }     
        %>
            
    </body>
</html>
