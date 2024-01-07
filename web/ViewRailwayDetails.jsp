<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Railways Reservation</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="table.css" />
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h3><font size="5" color="white">Railways Reservation</font></h3>
		</div>
		<div id="slogan">
			
		</div>
	</div>
	<div id="menu">
		<ul>
			<li class="first current_page_item"><a href="AdminHome.jsp">Home</a></li>
			<li><a href="AddRailwayDetails.jsp">Add Railway Details</a></li>
                        <li><a href="ViewRailwayDetails.jsp">View Railway Details</a></li>
                        <li><a href="BookingDetails.jsp">Booking Details</a></li>
                        <li><a href="Admin.jsp">Logout</a></li>
			
                       
              
		</ul>
		<br class="clearfix" />
	</div>
	<div id="splash">
		<img class="pic" src="images/railways.jpg" width="870" height="230" alt="" />
	</div>
	<br/>
	<center>
            <%String id=request.getParameter("id");
            if(id!=null){
              try{
                 String query="select * from trains where train_id='"+id+"'";
                  ResultSet r=Queries.getExecuteQuery(query);
                 
                  while(r.next()){
                %>
                <form action="UpdateAction.jsp" method="post">
                <table>
                    <tr>Note: Seats we can able to update here</tr>
                  <tr> 
                      <th>ID</th><td><input type="text" name="id" value="<%=id%>" style="width:200px;" readonly=""></tD></tr>
                    
                        <tr>  <th>Seats</th><td><input type="text" name="seats" value="<%=r.getString("available_seats")%>" style="width:200px;" required=""></tD></tr>
                        
                     <tr>  <th></th><td><input type="submit" value="Update" ></tD></tr>
                 
                </table>
                    </form>
                <%
                    }
            }catch(Exception e){
out.println(e);
}
}
            %>
            
            
            
            
            
            
           <h2>View All Railway Details</h2>

                <table border="1">
                                
                    <tr> <th>Sr.No</th>
                      
                    <th>Train Name</th>
                 
                 <th>Source Station</th>
                   <th>Destination Station</th>                
                     <th>Travel Time</th>
                       <th>arrival_time</th>
                       <th>Available Seats</th>
                     
                     <th>Update </th>
                    <th>Delete </th></tr>
              <%
              try{
                  String query="select * from trains";
                  ResultSet r=Queries.getExecuteQuery(query);
                  int c=0;
                  while(r.next()){
                      c=c+1;
                 
                      %>
                    <tr>
                        <td><%=c%></tD>
                         <td><%=r.getString("train_name")%></td>
                        <td><%=r.getString("source_station")%></td>
                        <td><%=r.getString("destination_station")%></td>
                        <td><%=r.getString("travel_time")%></td>
                        <td><%=r.getString("arrival_time")%></td>
                        <td><%=r.getString("available_seats")%></td>
                        
                        <td><a href="ViewRailwayDetails.jsp?id=<%=r.getString("train_id")%>">Update</a></td>
                        <td><a href="Delete.jsp?id=<%=r.getString("train_id")%>">Delete(Trigger)</a></td>
                       
                    <%
                  }
                  
                  
              }catch(Exception e){
                  out.println(e);
              }
              
              
              
              %>      

                  
                </table>
            
         
        </center>
            
            
    

</p>
</body>
</html>