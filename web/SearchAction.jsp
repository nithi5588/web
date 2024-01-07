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
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String mobile=(String)session.getAttribute("mobile");
            
            
       String searchname=request.getParameter("name");     
        

String train_id=request.getParameter("train_id");


if(train_id!=null){
    %>
    <h2>CONFIRM BOOKING</h2>
    <form action="BookRailwaysDetails.jsp" method="post">
        <table style="margin-bottom: 100px;">
            
            <tr><th>Train ID</th><td><input type="text" name="tid" value="<%=train_id%>" readonly=""></tD></tr>
            <tr><th>Date</th><td><input type="date" name="date" required></tD></tr>
            <tr><th>No.of Seats</th><td><input type="number" name="seats"  required=""></tD></tr>
            <tr><th></th><td><input type="submit" value="Confirm Book"></tD></tr>
            
            <tr><th></th><td><a href="SearchAction.jsp?name=<%=searchname%>"> <input type="button" value="BACK"></a></tD></tr>
        </table>
    
        </form>
    <%
}
            %>
            <hr>
           <h2>Search Result</h2>

                <table border="1">
                                
                    <tr>
                    
                 <th>Train Name</th>
                   <th>Source Station</th>
                     <th>Destination Station</th>
                     <th>Travel time(hrs)</th>
                       <th>Arrival Time(hrs)</th>
                     
                       <th>Available Seats</th>
                   
                     <th>Book Ticket </th></tr>
              <%
              try{
                  String query="select * from trains where train_name like '%"+searchname+"%' or source_station like '%"+searchname+"%' or destination_station like '%"+searchname+"%'";
                  ResultSet r=Queries.getExecuteQuery(query);
                  int c=0;
                  while(r.next()){
                      c=c+1;
                 
                      %>
                    <tr>
                        <td><%=r.getString("train_name")%></td>
                        <td><%=r.getString("source_station")%></td>
                        <td><%=r.getString("destination_station")%></td>
                        <td><%=r.getString("travel_time")%></td>
                        <td><%=r.getString("arrival_time")%></td>
                        
                       
                        <td><%=r.getString("available_seats")%></td>
                      
                        <td><a href="SearchAction.jsp?train_id=<%=r.getString("train_id")%>&name=<%=searchname%>">Book Ticket</a></td>
                       
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