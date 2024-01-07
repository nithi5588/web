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
            
            
       String source=request.getParameter("source");     
        String dest=request.getParameter("dest"); 

%>
            <hr>
           <h2>No.of Trains Available</h2>

                <table border="1">
                                
                    <tr>
                    
                 <th>No.of Trains </th>
                   <th>Train Name</th>
                    <th>Source Station</th>
                     <th>Destination Station</th>
                     
              <%
              try{
                  //String query="select * from trains where train_name like '%"+searchname+"%' or source_station like '%"+searchname+"%' or destination_station like '%"+searchname+"%'";
String q="SELECT COUNT(source_station),train_name,source_station,destination_station FROM trains where source_station like '%"+source+"%' and destination_station like '%"+dest+"%'GROUP BY train_name ";
                  ResultSet r=Queries.getExecuteQuery(q);
                   while(r.next()){
                   
                      %>
                    <tr>
                        <td><%=r.getInt(1)%></td>
                        <td><%=r.getString("train_name")%></td>
                        <td><%=r.getString("source_station")%></td>
                         <td><%=r.getString("destination_station")%></td>
                        
                    <%
                  }
                  
                  
              }catch(Exception e){
                  out.println(e);
              }
              
              

              %>      

                  
                </table>
            
              <a href="SearchSourceName.jsp">Back</a>
        </center>
       
</p>
</body>
</html>