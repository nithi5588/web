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
            %>
            
           <h2>View All Booking Details(inner join)</h2>

                <table border="1">
                                
                    <tr>
                       <th>UserName</th>
                   
                 <th>Train Name</th>
                   <th>Source_station</th>
                   <th>Destination_station</th>
                   <th>Destination_time</th>
                   <th>Arrival_time</th>
                       <th>No.of Seats Booked</th>
                        <th>Date of Booked</th>
                         <th>Booking Status</th>
                 
              <%
              try{
                  String query="SELECT * FROM ((reservations INNER JOIN passenger ON reservations.passenger_id = passenger.passengerid  and passenger.passengerid='"+id+"')INNER JOIN trains ON reservations.train_id = trains.train_id)";
                  ResultSet r=Queries.getExecuteQuery(query);

                  while(r.next()){
                    
                      %>
                    <tr>
                       
                        <td><%=r.getString("passenger.firstname")%></td>                  
                         <td><%=r.getString("trains.train_name")%></td>
                         <td><%=r.getString("trains.source_station")%></td>
                         <td><%=r.getString("trains.destination_station")%></td>
                     <td><%=r.getString("trains.travel_time")%></td>
                      <td><%=r.getString("trains.arrival_time")%></td>
                     <td><%=r.getString("reservations.seat_number")%></td>
                     <td><%=r.getString("reservations.reservation_date")%></td>
                      <td><%=r.getString("reservations.status")%></td>
                    
                <%  }
                  
                  
              }catch(Exception e){
                  out.println(e);
              }
              
              
              
              %>      

                  
                </table>
            
         
        </center>
            
            
    

</p>
</body>
</html>