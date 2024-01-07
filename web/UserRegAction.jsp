<%-- 
    Document   : WaverRegAction
    Created on : 9 Apr, 2021, 2:56:57 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.database.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%try{
       
         String fname=request.getParameter("fname"); 
         String lname=request.getParameter("lname");
         String email=request.getParameter("email"); 
         String mobile=request.getParameter("mobile"); 
         String age=request.getParameter("age"); 
          
      
       
         Connection con=Dbconnection.getcon();
           Statement s=con.createStatement();
           ResultSet r=Queries.getExecuteQuery("select count(*) from passenger where email='"+email+"' and mobilenumber='"+mobile+"'");
         int c=0;
         while(r.next())
         {
           c=r.getInt(1);  
         }
         
         if(c==0){
         PreparedStatement pst=con.prepareStatement("insert into passenger values(null,'"+fname+"','"+lname+"','"+age+"','"+mobile+"','"+email+"')");
         
         int i=pst.executeUpdate();
         if(i>0){%>
         <script type="text/javascript">
             window.alert("Registration Successful..!!");
             window.location="Register.jsp";
             </script>
         <%
           
         }else{
            %>
         <script type="text/javascript">
             window.alert("Registraion Failed..!!");
             window.location="Register.jsp";
             </script>
         <%
             
         }
         }else{
%>
         <script type="text/javascript">
             window.alert("User Already Exist..!!");
             window.location="Register.jsp";
             </script>
         <%
         
         }
       }catch(Exception e){
        System.out.println(e);
       }
 %>