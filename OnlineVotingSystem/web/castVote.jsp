

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="candidate.CandidateContainer"%>
<%@page import="candidate.CandidateProvider"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page errorPage="errorPage.jsp" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/main.css"/>
        <link rel="stylesheet" href="css/castVote.css">
        <script src="https://kit.fontawesome.com/3019de9751.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css?family=Audiowide|Public+Sans:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <div id="bgImage"></div>
            
       <%  
//           session.setAttribute("filterCastVote", "filterCastVote"); 
           
           String voter=(String)session.getAttribute("voterName");
          // String id=(String)session.getAttribute("voterIdentity");
           
           // session.setAttribute("vtr_id",id); 
          // String posId=(String)session.getAttribute("psnId");
           
           String pos=request.getParameter("pos");
           String vtrId=request.getParameter("voterId");
           session.setAttribute("currentVoterId",vtrId);
           String posId=request.getParameter("posId");
           session.setAttribute("posId",posId);
           int psnId=Integer.parseInt(posId);
           
           
           
           Connection con=ConnectionProvider.getConnection();
           
           CandidateProvider provider=new CandidateProvider();
           List<CandidateContainer> li=provider.getAllCandidates(con);
           
       %>
    
           
       <div class="container-fluid m-0 p-0 text-center">
           <div class="jumbotron bg-primary">

               <h4 class="display-4">Welcome</h4> <h4 class="text-white display-4"><%= voter %></h4> <h4 class="display-4">You are here to cast your vote for position of </h4> <h4 class="text-white display-4"><%= pos %></h4>
           </div>
       </div>
           
               
       
          
           <div class="container" id="form-body">
               
       <% 
            for(CandidateContainer cc:li)
            {
                if(cc.getPosition().equalsIgnoreCase(pos))
                {
                    %>
                    
                    <!--change-->
                     <ul class="list-unstyled">
            <li class="media pb-3 border-bottom">
                <img class="img-thumbnail img-fluid" src="images/<%= cc.getPic() %>" class="mr-3" alt="">
                <div class="media-body">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mt-0 mb-1 ml-4"><%= cc.getName() %></h5>
                    </div>
                    <p class="ml-4"><%= cc.getAbout() %></p>
                    <form class="text-right" action="#" method="post">
                        
                         <!--start of voted action-->
                                  <%
                                      String query="select p_name from positions where id="+psnId;
                                      String pname="";
                                      try
                                      {
                                          
                                      Statement st1=con.createStatement();
                                       ResultSet rs1=st1.executeQuery(query);
                                        
                                       while(rs1.next())
                                       {
                                          pname=rs1.getString("p_name");
                                        
                                       }  
                                       
                                             if(pname.equalsIgnoreCase(pos))
                                      {
                                          
                                     
                                        String qry="select status from voters where id="+vtrId;
                                        Statement st=con.createStatement();
                                        ResultSet rs=st.executeQuery(qry);
                                        while(rs.next())
                                        {
                                            String votedPosition=rs.getString("status");
                                            String strPosArr[]=votedPosition.split(" ");
                                            int l=strPosArr.length;
                                            int posArr[]=new int[l];
                                            int re=1;
                                            for(int i=0;i<l;i++)
                                            {
                                                posArr[i]=Integer.parseInt(strPosArr[i]);
                                            }
                                            for(int i=1;i<l;i++)
                                            {
                                                if(posArr[i]==psnId)
                                                {
                                                   re=0;
                                                }
                                            }
                                            
                                            if(re==0)
                                            {
                                                %>
                                                <div class="btn btn-danger"> Not Allowed ! </div>
                                                <%
                                            }

                                            else
                                                {
                                                    %>
                                                    <a href="VoteCounterServlet?candId=<%= cc.getId() %>" class="btn btn-outline-warning"><b>Cast Vote</b></a>
                                                    <%
                                                }
                                                     }

                                        }
                                      }
                                      catch(Exception e)
                                      {
                                          
                                      }
                                
                                    %>
                                    <!--end of voted action-->
                        
                        
                    </form>
                </div>
            </li>
        </ul>
                                          
                    <%
                }
            }
       
       
       %>
        <div class= " text-right mt-4 mb-4">
                            <a href="logoutServlet" type="submit"><b>Not sure? Vote Later</b></a>
                </div>
                        </div>
               
              
     
       
       
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--        <script src="https://kit.fontawesome.com/yourcode.js"></script>-->
<!--        <script>
            $(document).ready(function(){
                $(".hideMe").click(function(){
                    $(".jumbotron").toggle();
                })
            });
        </script>-->
    </body>
</html>
