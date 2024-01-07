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
			<li class="first current_page_item"><a href="UserHome.jsp">Home</a></li>
			<li><a href="UpdateProfile.jsp">Update Profile</a></li>
                        <li><a href="SearchTrains.jsp">Search Trains</a></li>
                        <li><a href="ViewBookings.jsp">View Bookings</a></li>
                        <li><a href="ViewCoachNumber.jsp">View CoachNumber</a></li>
                        <li><a href="User.jsp">Logout</a></li>
			
                       
              
		</ul>
		<br class="clearfix" />
	</div>
	<div id="splash">
		<img class="pic" src="images/railways.jpg" width="870" height="230" alt="" />
	</div>
	<br/>
	<center>
            <%
            
String id=(String)session.getAttribute("id");
String email=(String)session.getAttribute("email");
String mobile=(String)session.getAttribute("mobile");
            
            
       String searchname=request.getParameter("name");     
        

%>
            <hr>
           <h4>Your Coach Number(nested with ANY)</h4>

                <table border="1">
                                
                    <tr>
                 <th>Reservation ID</th>  
                 <th>Coach Number</th>
                 <th>View Train Details</th>
                     
              <%
              try{
String q="SELECT coach_number, reservation_id FROM ticket where reservation_id = ANY (SELECT reservation_id FROM reservations WHERE passenger_id = ANY (SELECT PassengerID from passenger WHERE PassengerID='"+id+"'))";
                  ResultSet r=Queries.getExecuteQuery(q);
                   while(r.next()){
                   
                      %>
                    <tr>
                        <td><%=r.getInt(2)%></td>
                        <td><%=r.getInt(1)%></td>
                        <td><a href="ViewCoachNumber.jsp?reservation_id=<%=r.getInt(2)%>">View Train Details</a></td>
                    </tr>
                    <%
                  }
                  
                  
              }catch(Exception e){
                  out.println(e);
              }
              
              

              %>      

                 <a href="UserHome.jsp">Back</a> 
                </table>
        
              <%String reservation_id=request.getParameter("reservation_id");
              if(reservation_id!=null){%>
              <hr>
                  <h4>Details</h4>
                  <table border="1">
                                
                    <tr>
                   <th>Train Name</th>
                   <th>Source_station</th>
                   <th>Destination_station</th>
                   <th>Destination_time</th>
                   <th>Arrival_time</th>
                      
                 
              <%
              try{
                  String query="SELECT * FROM trains WHERE train_id = ANY (SELECT train_id FROM reservations WHERE reservation_id='"+reservation_id+"');";
                  ResultSet r=Queries.getExecuteQuery(query);

                  while(r.next()){
                    
                      %>
                    <tr>
                       
                                      
                         <td><%=r.getString("trains.train_name")%></td>
                         <td><%=r.getString("trains.source_station")%></td>
                         <td><%=r.getString("trains.destination_station")%></td>
                     <td><%=r.getString("trains.travel_time")%></td>
                      <td><%=r.getString("trains.arrival_time")%></td>
               
                    
                <%  }
                  
                  
              }catch(Exception e){
                  out.println(e);
              }
              
              
              
              %>      

                  
                </table>
            
                  
                  <a href="ViewCoachNumber.jsp">Back</a>   
                  
                <%}%>  
              
        </center>
       
</p>
</body>
</html>