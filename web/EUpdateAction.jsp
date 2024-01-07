<%-- 
    Document   : EUpdateAction
    Created on : 4 Nov, 2023, 2:59:39 PM
    Author     : GKV
--%>

<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id=(String)session.getAttribute("id");
String email=request.getParameter("email");

try{
    String query="update updateview set Email='"+email+"' where passengerID='"+id+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
        Queries.getExecuteUpdate("update updateview set P_Email='"+email+"' where passengerID='"+id+"'");
     %>
     <script type="text/javascript">
         window.alert("Successfully Updated...!!!");
         window.location="UpdateProfile.jsp";
     </script>
     <%
    }else{
 %>
     <script type="text/javascript">
         window.alert("Failed To Update...!!!");
         window.location="UpdateProfile.jsp";
     </script>
     <%
}
    
    
    
}catch(Exception e){
    out.println(e);
}



%>