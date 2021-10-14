<%-- 
    Document   : editStatus
    Created on : 9 Oct, 2021, 1:15:23 PM
    Author     : prart
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Status</title>
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
                    PreparedStatement stmt=con.prepareStatement("SELECT ID,subject,date,status,complaint,username from complaintsDB where id="+cid+"");
                    ResultSet rs = stmt.executeQuery();
                    
                        rs.next();
        %>
        <div class="containerTable">
                <p class="heading" style="text-align: center;">Edit Complaint</p>
        <form action="updateStatus.jsp" method="post">
            <table border='0' class="table">
            <tr class="row1">
                <td  class="id">&nbsp;<%=rs.getInt(1)%>.&nbsp;</td>
                <td  class="subject">&nbsp;<%=rs.getString(2)%>&nbsp;</td>
                <td class="date">&nbsp;(<%=rs.getString(3)%>)&nbsp;</td>
                <td  class="status">&nbsp;<%=rs.getString(4)%>&nbsp;</td>
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
                    &nbsp;Admin's Message :  <%=rs.getString(6)%>
                </td>
            </tr>
            <tr><p></p></tr>
            <tr>
                <td></td>
                <td  colspan="2">
                    &nbsp;<label>Message :</label>
                    <input class="" type="text" name="adminMessage"><br>
                </td>
            
                <td colspan="2" >
                    &nbsp;<label>Status :</label>
                    <select id="newStatus" name="newStatus">
                        <option value="No Response">No Response</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Solved">Solved</option>
                        <option value="Unsolved">Unsolved</option>
                    </select>
                </td>
            </tr>
            <br>
            </table>
                <br><input class="btn" type="submit" value='Update'><br>
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