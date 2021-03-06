﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TIcketReport.aspx.vb" Inherits="TIcketReport" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>PSL ADMIN</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">PSL ADMIN</a></h1>
</div>
<!--close-Header-part--> 

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome User</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
        <li class="divider"></li>
        <li><a href="login.html"><i class="icon-key"></i> Log Out</a></li>
      </ul>
    </li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>
    <li class=""><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>

<!--start-top-serch-->
<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-serch--> 

<!--sidebar-menu-->

<div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-th"></i>Tables</a>
  <ul>
    <li><a href="index.html"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
    <li><a href="charts.html"><i class="icon icon-signal"></i> <span>Charts &amp; graphs</span></a> </li>
    <li><a href="widgets.html"><i class="icon icon-inbox"></i> <span>Widgets</span></a> </li>
    <li class="active"><a href="tables.html"><i class="icon icon-th"></i> <span>Tables</span></a></li>
    <li><a href="grid.html"><i class="icon icon-fullscreen"></i> <span>Full width</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>Forms</span> <span class="label label-important">3</span></a>
      <ul>
        <li><a href="form-common.html">Basic Form</a></li>
        <li><a href="form-validation.html">Form with Validation</a></li>
        <li><a href="form-wizard.html">Form with Wizard</a></li>
      </ul>
    </li>
    <li><a href="buttons.html"><i class="icon icon-tint"></i> <span>Buttons &amp; icons</span></a></li>
    <li><a href="interface.html"><i class="icon icon-pencil"></i> <span>Eelements</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-file"></i> <span>Addons</span> <span class="label label-important">5</span></a>
      <ul>
        <li><a href="index2.html">Dashboard2</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li><a href="calendar.html">Calendar</a></li>
        <li><a href="chat.html">Chat option</a></li>
      </ul>
    </li>
    <li class="submenu"> <a href="#"><i class="icon icon-info-sign"></i> <span>Error</span> <span class="label label-important">4</span></a>
      <ul>
        <li><a href="error403.html">Error 403</a></li>
        <li><a href="error404.html">Error 404</a></li>
        <li><a href="error405.html">Error 405</a></li>
        <li><a href="error500.html">Error 500</a></li>
      </ul>
    </li>
    <li class="content"> <span>Monthly Bandwidth Transfer</span>
      <div class="progress progress-mini progress-danger active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
      <span class="percent">77%</span>
      <div class="stat">21419.94 / 14000 MB</div>
    </li>
    <li class="content"> <span>Disk Space Usage</span>
      <div class="progress progress-mini active progress-striped">
        <div style="width: 87%;" class="bar"></div>
      </div>
      <span class="percent">87%</span>
      <div class="stat">604.44 / 4000 MB</div>
    </li>
  </ul>
</div>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Tables</a> </div>
    <h1>PSL- REPORTS</h1>
  </div>

   
   
   <div class="container-fluid">
     <div class="row-fluid">
	<div class="span12" style="border: 1px solid #cdcdcd;">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-list"></i> </span>
            <h5>Zone Details</h5>
          </div>
		   <div class="span11">
          <div class="widget-content form-horizontal" style="border-bottom: none;"> 
		 
		 <div class="control-group span3" style="border-top: none;">
              <label class="control-label">From</label>
              <div class="controls">
                <div data-date="12-02-2017" class="input-append date datepicker">
                  <input type="text" id="from" value="" data-date-format="mm-dd-yyyy" class="span11">
                  <span class="add-on"><i class="icon-th"></i></span> </div>
              </div>
            </div>
			
			 <div class="control-group span4" style="border-top: none;">
              <label class="control-label">To</label>
              <div class="controls">
                <div data-date="12-02-2017" class="input-append date datepicker">
                  <input type="text" id="to" value="" data-date-format="mm-dd-yyyy" class="span11">
                  <span class="add-on"><i class="icon-th"></i></span> </div>
              </div>
            </div>
			
			 <div class="control-group" style="border-top: none;">
              <label class="control-label">Matches</label>
              <div class="controls span3" style="padding: 15px 0;">
                <select id="event_list" >
                  <option eid="0">Select All Matches</option>
                </select>
              </div>
			   <button class="btn btn-primary " id="details" style="margin: 15px auto;">Submit</button>
            </div>
			
		</div>

   
   
   
   
   
   
   
   
   
   
   
   
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Reports</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Date</th>
                  <th>Match</th>
                  <th>Catagory</th>
                  <th>Print Qty</th>
                  <th>Admited Qty</th>
                </tr>
              </thead>
              <tbody>
                <tr class="odd gradeX">
                  <td>19-02-2017</td>
                  <td>Peshawar Zalmi vs Karachi Kings</td>
                  <td>North Stand</td>
                  <td class="center"> 8300</td>
                  <td class="center">5267</td>
                </tr>
                <tr class="even gradeC">
                  <td>8-2-2017</td>
                  <td>Lahore Qalandars vs Quetta Gladiators</td>
                  <td>East Stand</td>
                  <td class="center">2665</td>
                  <td class="center">890</td>
                </tr>
                <tr class="odd gradeA">
                  <td>12-2-2017</td>
                  <td>Karachi Kings vs Quetta Gladiators</td>
                  <td>West Stand</td>
                  <td class="center">835</td>
                  <td class="center">100</td>
                </tr>
                <tr class="even gradeA">
                  <td>15-2-2017</td>
                  <td>Karachi Kings vs Islamabad United</td>
                  <td>North Stand</td>
                  <td class="center">220</td>
                  <td class="center">60</td>
                </tr>
              </tbody>
            </table>
          </div>
<form runat="server">
            <asp:GridView ID="gridview1" runat="server">

            </asp:GridView>
			</form>
            <div></div>
            
        </div>

          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Date</th>
                  <th>Match</th>
                  <th>Catagory</th>
                  <th>Barcode</th>
                  <th> Qty</th>
                </tr>
              </thead>
              <tbody>
                <tr class="odd gradeX">
                  <td>19-02-2017</td>
                  <td>Peshawar Zalmi vs Karachi Kings</td>
                  <td>North Stand</td>
                  <td class="center"> 4566464654</td>
                  <td class="center">5267</td>
                </tr>
                <tr class="even gradeC">
                  <td>8-2-2017</td>
                  <td>Lahore Qalandars vs Quetta Gladiators</td>
                  <td>East Stand</td>
                  <td class="center">26545465</td>
                  <td class="center">890</td>
                </tr>
                <tr class="odd gradeA">
                  <td>12-2-2017</td>
                  <td>Karachi Kings vs Quetta Gladiators</td>
                  <td>West Stand</td>
                  <td class="center">836665</td>
                  <td class="center">100</td>
                </tr>
                <tr class="even gradeA">
                  <td>15-2-2017</td>
                  <td>Karachi Kings vs Islamabad United</td>
                  <td>North Stand</td>
                  <td class="center">211520</td>
                  <td class="center">60</td>
                </tr>
              </tbody>
            </table>
          </div>
        
      </div>
    </div>
  </div>
</div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in">Themedesigner.in</a> </div>
</div>
<!--end-Footer-part-->
<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.uniform.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/jquery.dataTables.min.js"></script> 
<script src="js/matrix.js"></script> 
<script src="js/matrix.tables.js"></script>
</body>
</html>

