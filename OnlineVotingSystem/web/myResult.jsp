<%-- 
    Document   : myResult
    Created on : 14 Feb, 2020, 9:59:23 AM
    Author     : NEERAJ PANDEY
--%>

<%@page import="candidate.CandidateContainer"%>
<%@page import="candidate.CandidateProvider"%>
<%@page import="positions.PositionContainer"%>
<%@page import="java.util.List"%>
<%@page import="positions.PositionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/3019de9751.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/main.css"/>
        <link href="https://fonts.googleapis.com/css?family=Audiowide|Public+Sans:400,700&display=swap" rel="stylesheet">
       
    </head>
    <body>
        <div id="bgImage"></div>
        <div class="container-fluid m-0 p-0">
            <div class="jumbotron bg-primary text-center text-white">
                <h1 class="display-1"><i class="fas fa-vote-yea"></i></h1>
                <h5 id="appName" class="display-3"><b>RESULTS</b></h5>
                                     
                
              
                
               
            </div>
        </div>
        
        <%
            Connection con=ConnectionProvider.getConnection();
            
            PositionProvider p=new PositionProvider();
            List<PositionContainer> li=p.getAllPositions(con);
            
            for(PositionContainer pc: li)
            {
                int totalVotes=0;
                
                %>
                <div class="card card-header" href="#collapseExample" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapseExample">
                        <h4>For Position of <%= pc.getP_name() %></h4>
                       <h4>Votes scored are as below by each candidate</h4>
                </div>
                <%
               CandidateProvider cp=new CandidateProvider();
               List<CandidateContainer> lcc=cp.getAllCandidates(con);
               
               for(CandidateContainer cc: lcc)
               {
                   if(pc.getP_name().equalsIgnoreCase(cc.getPosition()))
                   {
                       totalVotes=totalVotes+cc.getVoteCount();
                       %>
                       
                       <div class="card card-body">
                        <h4><%= cc.getName() %> got <b><%= cc.getVoteCount() %></b> votes</h4>
                       </div>
                     
                       <%
                   }
                 
               }
               for(CandidateContainer cc: lcc)
                {
                    if(pc.getP_name().equalsIgnoreCase(cc.getPosition()))
                   {

                       float percentage=(float)((float)cc.getVoteCount()/(float)totalVotes)*100;
                       

                   %>
                   
                   <div class="card card-body">
                       <h4><%= cc.getName() %> got <b><%= percentage %>% </b> votes</h4>
                   </div>
                   
                    <%
                   }
                    
                }
               %>
               
               <hr>
               <%
                   
            }
            
        %>
       
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/yourcode.js"></script>
    </body>
</html>
