<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%
    String id=(String)session.getAttribute("id");
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String mobile=(String)session.getAttribute("mobile");
            
    
    
String tid=request.getParameter("tid");
String date=request.getParameter("date");
String seats=request.getParameter("seats");


int aseats=Integer.parseInt(seats);

try{
    ResultSet r=Queries.getExecuteQuery("select * from trains where train_id='"+tid+"'");
    int available=0;
    
    while(r.next()){
        available=Integer.parseInt(r.getString("available_seats"));
    }
    
   int cc=available-aseats;
   
   int i=Queries.getExecuteUpdate("insert into reservations values(null,'"+id+"','"+tid+"','"+date+"','"+seats+"','waiting')");
   if(i>0){
     Queries.getExecuteUpdate("update trains set available_seats='"+cc+"'where train_id='"+tid+"'");
     %>
     <script type="text/javascript">
         window.alert("Booking Request Sent to Railway Admin Wait for Accepts");
         window.location="SearchTrains.jsp";
         </script>
     
     <%
   }else{
%>
     <script type="text/javascript">
         window.alert("Booking Request Sending Failed");
         window.location="SearchTrains.jsp";
         </script>
     
     <%
}
   
   
    
}catch(Exception e){
  out.println(e);  
}



%>