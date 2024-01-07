<%-- 
    Document   : UpdateAction
    Created on : May 21, 2020, 1:04:43 PM
    Author     : KishanVenky
--%>


<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id=request.getParameter("id");

try{
    String query="delete from trains where train_id='"+id+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
     %>
     <script type="text/javascript">
         window.alert("Successfully Deleted...!!!");
         window.location="ViewRailwayDetails.jsp";
     </script>
     <%
    }else{
 %>
     <script type="text/javascript">
         window.alert("Failed To Delete...!!!");
         window.location="ViewRailwayDetails.jsp";
     </script>
     <%
}
    
    
    
}catch(Exception e){
    out.println(e);
}



%>