<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>

<!DOCTYPE html>
<html lang="en">
    
<head>
        <title>Q-Tickets Admin Panel</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="css/matrix-login.css" />
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

    </head>
    <body>
        <div id="loginbox">  
<img src="images/qt_logo.png" alt="Logo" style="width:60%;margin: 10px 70px;" />		
          
				 <form class="form-signin form-vertical" id="loginform" action='checkLogin.aspx' method='POST'>
				<div class="control-group normal_text"> 
				 <h3>Sign In</h3>
				 </div>
				
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"> </i></span>
							<input type="text" name="username" placeholder="Username" required="">
							
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span>
							<input type="password" name="password"  placeholder="Password" required="">
                        </div>
                    </div>
                </div>
				   <% If Request("msg")<> "" then %>
							<font style="color:#FF5722;font-size:15px;    margin-left: 40px;"><%= Request("msg") %></font>
						<% End if %>
                <div class="form-actions" >
                    <span class="pull-left" style="visibility:hidden;"><a href="#" class="flip-link btn btn-info" id="to-recover">Lost password?</a></span>
                    <span class="pull-right">
					<button class="btn btn-success" type="submit">Sign in</button>
					</span>
					
                </div>
            </form>
            <form id="recoverform" action="#" class="form-vertical">
				<p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>
				
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">&laquo; Back to login</a></span>
                    <span class="pull-right"><a class="btn btn-info"/>Reecover</a></span>
                </div>
            </form>
        </div>
        
        <script src="js/jquery.min.js"></script>  
        <!-- <script src="js/matrix.login.js"></script>  -->
    </body>

</html>
