<%-- 
    Document   : UpdateProfile
    Created on : 4 Nov, 2023, 2:55:51 PM
    Author     : GKV
--%>
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
            
           <h2>Update Profile(View)</h2>

                
                                
                  
              <%
              try{
                  String query="SELECT * FROM passenger where passengerID='"+id+"'";
                  ResultSet r=Queries.getExecuteQuery(query);

                  if(r.next()){
                    
                      %>
                      <form action="EUpdateAction.jsp" method="post">
                      <table border="1">
                    <tr>
                       
                        <th>Your ID</th><td><%=r.getString("passengerID")%></td>  </tr>                
                        <tr><th>Update Email</th><td><input type="email" name="email" value="<%=r.getString("email")%>" required=""></td></tr>
                        <tr><th></th><td><input type="submit" value="Update"</td></tr>
                       </table>
                      </form>
                <%  }
                  
                  
              }catch(Exception e){
                  out.println(e);
              }
              
              
              
              %>      

                  
               
            
         
        </center>
            
            
    

</p>
</body>
</html>