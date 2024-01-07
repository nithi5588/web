<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Railways Reservation</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="table.css" />
<style>
    ul li{
        list-style: none;
        margin-top: 20px;
    }
    </style>
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
	
            <%
            
String id=(String)session.getAttribute("id");

String email=(String)session.getAttribute("email");
String mobile=(String)session.getAttribute("mobile");
            %>
            <div id="main" style="border:none;height:300px;">
                <div id="right" style="border:none;width:450px;height:300px;float: right;">
                    <h3>Menu Bar</h3>
                <ul style="margin-top:20px;">
                    <li><a href="SearchTrains.jsp">Home</a></li>
                    <li><a href="SearchTrainName.jsp">View No.of Trains Using Train Name</a></li>
                    <li><a href="SearchSourceName.jsp"  style="color:red;">View No.of Trains From Source To Destination Stations</a></li>
           
                </ul>
                </div>
            
                <center>
                    <h1  style="margin-top: 50px;">Search By Train Name</h1>
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;
            <form action="TrainSourceDestAction.jsp" method="post">
                <table>
                    <tr><th>Source Station</th><td><input type="text" name="source" placeholder="Source Station" style="width:300px;height:50px;" required=""></td></tr>
                    <tr><th>Destination Station</th><td><input type="text" name="dest" placeholder="Destination Station" style="width:300px;height:50px;" required=""></td></tr>
                    
                        
<tr><th></th><td><input type="submit" value="get Details" required="">
<input type="reset" value="Reset"></td></tr>
                  
                </table>
            
            </form>  
           


                </center>
            
            </div>    
</div>
</body>
</html>