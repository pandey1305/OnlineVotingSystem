

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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/3019de9751.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/main.css"/>
        <link href="https://fonts.googleapis.com/css?family=Audiowide|Public+Sans:400,700&display=swap" rel="stylesheet">
       
        <title>Online Voting System</title>
    </head>
    <body>
        <div class="container-fluid m-0 p-0">
            <div class="jumbotron bg-primary text-center text-white">
                <h1 class="display-1"><i class="fas fa-vote-yea"></i></h1>
                <h5 id="appName" class="display-3"><b>Online Voting System</b></h5>
                                     
                
              
                
               
            </div>
        </div>    
           
            <main>
                <div class="container p-0">
                    <div class="row">
                        <div class="col-md-4 offset-md-4">
                            <div class="card">
                                <div class="backdrop card-header text-center">
                                    <h4>Please Login</h4>
                                    
                                </div>
                                 <form action="loginServlet" method="POST">
                                <div class="card-body text-center">
                                           
                                                <div class="form-group">
                                                  <label for="exampleInputEmail1">Email address <span><i class="far fa-address-card"></i></span></label>
                                                  <input type="email" class="form-control-plaintext shadow p-3 mb-3 bg-white rounded text-center" name="email" aria-describedby="emailHelp" placeholder="Enter email">
                                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                                </div>
                                                <div class="form-group">
                                                  <label for="exampleInputPassword1">Password <span><i class="fas fa-lock"></i></span> </label>
                                                  <input type="password" class="form-control-plaintext shadow p-3 mb-3 bg-white rounded text-center" name="password" placeholder="Password">
                                                </div>
                                               
                                </div>
                                      <div class="backdrop card-footer text-center">
                                                     <button type="submit" class="btn btn-primary">Login</button>
                                                </div>
                                 </form>
                                
                                           
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            

                 
               
        
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/yourcode.js"></script>

    </body>
</html>
