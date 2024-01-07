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
			<li class="first current_page_item"><a href="index.html">Home</a></li>
			<li><a href="User.jsp">User</a></li>
                        <li><a href="Admin.jsp">Admin</a></li>
			
                       
              
		</ul>
		<br class="clearfix" />
	</div>
	<div id="splash">
		<img class="pic" src="images/railways.jpg" width="870" height="230" alt="" />
	</div>
	<br/>
	<center>
            
            <h2>User Registration</h2>
            <%String msg=request.getParameter("msg");
            if(msg!=null){
                %>
                <%=msg%>
                <%
}%>
          <form action="UserRegAction.jsp" method="post">
          <table>
            
               <tr><th>First Name</th><td><input type="text" name="fname" required=""></tD></tr>
               <tr><th>Last Name</th><td><input type="text" name="lname" required=""></tD></tr>
               <tr><th>Age</th><td><input type="number" name="age" required=""></tD></tr>
               <tr><th>Mobile</th><td><input type="number" name="mobile" required=""></tD></tr>
               <tr><th>Email</th><td><input type="email" name="email" required=""></tD></tr>          
               <tr><th></th><td><input type="submit" value="Register">
                  
                      <a href="User.jsp">Login</a>
                  </tD></tr>
          </table>
      </form>
        </center>


</p>
</body>
</html>