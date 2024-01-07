<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Railways Reservation</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
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
            <h1>Welcome To ::<%=email%></h1>
            
            
            
        </center>


</p>
</body>
</html>