<%-- 
    Document   : OwnerRegAction
    Created on : 29 Sep, 2020, 5:52:17 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<link rel="stylesheet" type="text/css" href="table.css" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

    String id=request.getParameter("id");
    %>
    <center>
        <h2>Allocate Coach Number</h2>
        <form action="AcceptDetails.jsp" method="post">
    <table>
        <tr><th>Reservation ID</th><td><input type="number" value="<%=id%>" name="rid" readonly=""></td></tr>
        <tr><th>Coach Number</th><td><input type="number" name="coach" reaquired=""></td></tr>
        <tr><th></th><td><input type="submit" value="Confirm"></td></tr>
    </table>
        </form>
    </center>
    <%
        String rid=request.getParameter("rid");
        String coach=request.getParameter("coach");
    if(rid!=null&& coach!=null){    
    String query="update reservations set status='Accepted' where reservation_id='"+rid+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
     
    Queries.getExecuteUpdate("insert into ticket values(null,'"+rid+"','"+coach+"')");
%>
      <script type='text/javascript'>
          window.alert("Accepted Successful...!!");
          window.location="BookingDetails.jsp";
      </script>
      <%

    }else{
    
%>
      <script type='text/javascript'>
          window.alert("Accepting Failed..!!");
          window.location="BookingDetails.jsp";
      </script>
      <%
}
}
}catch(Exception e){
    out.println(e);
}



%>