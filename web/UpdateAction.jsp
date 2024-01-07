<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.database.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%

 try{
     String id=request.getParameter("id");
   
        String seats=request.getParameter("seats");
       
     
          
            Connection con=Dbconnection.getcon();
            PreparedStatement pst=con.prepareStatement("update trains set available_seats='"+seats+"' where train_id='"+id+"'");
          
            int i=pst.executeUpdate();
            if(i>0){
                %>
                <script type="text/javascript">
                    window.alert("Updated Successfully...!!");
                    window.location="ViewRailwayDetails.jsp";
                </script>
                <%
            
            }else{
              %>
                <script type="text/javascript">
                    window.alert("Updation Failed");
                    window.location="ViewRailwayDetails.jsp";
                </script>
                <%
            }
            
            
        
    }catch(Exception e){
    System.out.println(e);    
    }

%>