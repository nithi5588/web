<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.database.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%

 try{

               String name=request.getParameter("name");
       String from=request.getParameter("sstation");
       String to=request.getParameter("dstation");
       String ttime=request.getParameter("ttime");
         String arrival=request.getParameter("arrival");
        String seats=request.getParameter("seats");
       
          
            Connection con=Dbconnection.getcon();
            PreparedStatement pst=con.prepareStatement("insert into trains values(null,'"+name+"','"+from+"','"+to+"','"+ttime+"','"+arrival+"','"+seats+"')");
          
            int i=pst.executeUpdate();
            if(i>0){
                %>
                <script type="text/javascript">
                    window.alert("Successfully Added...!!");
                    window.location="AddRailwayDetails.jsp";
                </script>
                <%
            
            }else{
              %>
                <script type="text/javascript">
                    window.alert("Adding Failed");
                    window.location="AddRailwayDetails.jsp";
                </script>
                <%
            }
            
            
        
    }catch(Exception e){
    System.out.println(e);    
    }

%>