<%@ Page Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="eventbookings_list_consolidate.aspx.vb" Inherits="eventbookings_list_consolidate" %>
<asp:Content ContentPlaceHolderId="html_body" runat="server">
   <div id="content">
      <div id="content-header">
         <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Booking List</a> </div>
         <h1>Paid Booking List</h1>
      </div>
      <div class="container">
         <div class="span6" style="display:none;">
            <label>
            <input type="radio" name="radios"  class="rButton" value="venue" />
            Venue</label>
            <div class="span4 venuefilter" style="display:none;">
               <select id="venue_list">
                 <!--  <option value="All">All</option> -->
                 
                  <option value="Dubai">Dubai</option>
				   <option value="Sharjah">Sharjah</option>
               </select>
            </div>
         </div>
         <div class="span6" style="margin-top: 20px;">
            <label>
            <input type="radio" name="radios" checked class="rButton" value="matches" />
            Matches</label>
            <div class="span4 matchesfilter" >
               <select id="event_list" >
<option eid="504">Opening Ceremony-Peshawar Zalmi vs Islamabad United | Feb  9,2017</option>
               </select>
            </div>
         </div>
      </div>
      <div class="control-group" style="margin-left: 60px;margin-top:20px;display:none;">
         <div class="controls">
            <div data-toggle="buttons-radio" class="btn-group">
               <button class="btn btn-primary active" id="allshow"  type="button">All Stadium</button>
               <button class="btn btn-primary " id="shshow"  type="button">Sharjah</button>
               <button class="btn btn-primary" id="dushow" type="button">Dubai</button>
            </div>
         </div>
      </div>
      <div class="container-fluid sharjah_container" style="display:none;">
         <div class="row-fluid">
            <div class="span12" style="border: 1px solid #cdcdcd;">
               <div class="widget-box">
                  <div class="widget-title">
                     <span class="icon"> <i class="icon-list"></i> </span>
                     <h5>Zone Details</h5>
                  </div>
                  <div class="span11">
                     <div class="widget-content form-horizontal" style="border-bottom: none;">
                        <div class="control-group span3" style="border-top: none;">
                           <label class="control-label">From</label>
                           <div class="controls">
                              <div data-date="12-02-2017" class="input-append date datepicker">
                                 <input type="text" id="from" value="" data-date-format="mm-dd-yyyy" class="span11">
                                 <span class="add-on"><i class="icon-th"></i></span> 
                              </div>
                           </div>
                        </div>
                        <div class="control-group span4" style="border-top: none;">
                           <label class="control-label">To</label>
                           <div class="controls">
                              <div data-date="12-02-2017" class="input-append date datepicker">
                                 <input type="text" id="to" value="" data-date-format="mm-dd-yyyy" class="span11">
                                 <span class="add-on"><i class="icon-th"></i></span> 
                              </div>
                           </div>
                        </div>
                        <div class="control-group" style="border-top: none;">
                           <label class="control-label">Matches</label>
                           <div class="controls span3" style="padding: 15px 0;">
                              <!--  <select id="event_list" >
                                 <option eid="0">Select All Matches</option>
                                 </select> -->
                           </div>
                           <button class="btn btn-primary " id="details" style="margin: 15px auto;">Submit</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <hr>
         <div class="row-fluid">
            <div class="span12">
               <div class="widget-box">
                  <div class="widget-content tab-content">
                     <div id="tab1" class="tab-pane active">
                        <div class="widget-box">
                           <div class="widget-title">
                              <span class="icon"> <i class="icon-th"></i> </span>
                              <h5>PSL 2017</h5>
                           </div>
                           <div class="widget-content nopadding">
                              <table class="table table-bordered table-striped">
                                 <thead>
                                    <tr>
                                       <th>Zone</th>
                                       <th>Total Tickets</th>
                                       <th>Sold</th>
                                       <th class="center" style='display:none;'>Available</th>
                                       <th class="center">Stadium</th>
                                       <th class="center">Match Name</th>
                                    </tr>
                                 </thead>
                                 <tbody id="PSLbody">
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="container-fluid All_container" style="display:none;">
         <div class="row-fluid">
            <div class="span12">
               <div class="widget-box">
                  <div class="widget-content tab-content">
                     <div id="tab1" class="tab-pane active">
                        <div class="widget-box">
                           <div class="widget-title">
                              <span class="icon"> <i class="icon-th"></i> </span>
                              <h5>PSL 2017</h5>
                           </div>
                           <div class="widget-content nopadding">
                              <table class="table table-bordered table-striped">
                                 <thead>
                                    <tr>
                                       <th>Zone</th>
                                       <th>Total Tickets</th>
                                       <th>Online Sold</th>
									   <th>Offline Sold</th>
									   <th>Scanned</th>
                                       <th class="center" style='display:none;'>Available</th>
                                       <th>Stadium</th>
                                    </tr>
                                 </thead>
                                 <tbody id="PSLbodyall">
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
					 <a href="http://admin.q-tickets.com/psl/report_ticket.aspx" class="btn btn-success btn-mini" style="display:none;">Complimentary</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script_body" runat="Server">
   <script type="text/javascript">
      $(document).ready(function() { 
      $( ".matchesfilter" ).show();
	 // load_allmatches();
	   
      var today = new Date();
      var dd = today.getDate();
      var mm = today.getMonth()+1; //January is 0!
      
      var yyyy = today.getFullYear();
      if(dd<10){
         dd='0'+dd;
      } 
      if(mm<10){
         mm='0'+mm;
      } 
      var today = mm+'/'+dd+'/'+yyyy;
      $('#from').val(today);
       $('#to').val(today);  
      
       //alert("came");
      //load_matches() ;
      
      
          
      $( "#venue_list" ).change(function() {
       
      // alert($(this).val());
	  var filter=$(this).val();
	  if(filter =="Dubai" || filter =="Sharjah")
	  {
	   load_allmatchesbyfilter(filter);
	   }
	   else
	   {
	    load_allmatches();
	   }
      });	
        
     
       
      GetPSLEvent();
	 var eventidpsl1 = $("#event_list option:selected").attr("eid")
	 load_matchesByfilter(eventidpsl1);
      $("#details").click(function () {  
                 load_matches();
       });
      
       
         
      $( ".rButton" ).change(function() {
       
       
        switch($(this).val()) {
             case 'matches' :
      	
      	$( ".matchesfilter" ).show();
      	$( ".venuefilter" ).hide();
                // alert("Allot Thai Gayo Bhai");
                 break;
             case 'venue' :
      	$( ".matchesfilter" ).hide();
      	$( ".venuefilter" ).show();
               //  alert("Transfer Thai Gayo");
                 break;
         }
      });	
       
	   
	   
	    $( "#event_list" ).change(function() {
		
       var eventidpsl = $("#event_list option:selected").attr("eid");
	   
       load_matchesByfilter(eventidpsl);
      
      });	
       
	   
       $("#shshow").click(function () {  
       $('.sharjah_container').show();
        $('.All_container').hide();
       });
      $("#allshow").click(function () {  
	 load_allmatches();
         $('.sharjah_container').hide();       
      	   
       });
       $("#dushow").click(function () {  
                // load_matches();
       });
      
       });
      
      
	  
	   function load_allmatchesbyfilter(filterpsl) {
    
                $.ajax({
                url: "/event_ajax.aspx",
                dataType: "json",
                type: "get",
                async:false,
               data: { type: "37",filterpsl: filterpsl},
                success: function (res) {
      	  
      	   var tabcontent = "";
		   
      	    if (res.total.length > 0) {
                        
                         for (var i = 0; i < res.total.length; i++) {
                        if(res.total[i].Ticketname.indexOf('Complimentary') != 0)
      					{
						//Comp Corporate East		
						//Comp Corporate West		
						//Comp VIP Hospitality - East		
						//Comp VIP Hospitality - West		
						
						 
      					var sold=0;
      					var total=res.total[i].Total_tickets;
      					var avail=res.total[i].availability;
      					sold=total-avail;
      						//alert(res.total[i].Total_tickets);
      				
      				tabcontent += " <tr class='odd gradeX'>"
                      tabcontent += " <td>"+res.total[i].Ticketname+"</td>"
                     tabcontent += " <td>"+res.total[i].Total_tickets+"</td>"
                      tabcontent += "  <td>"+res.total[i].online+"</td>"
					 
					 tabcontent += "  <td>"+res.total[i].offline+"</td>"
					  tabcontent += "  <td>"+res.total[i].scanned+"</td>"
                      tabcontent += "  <td style='display:none;'>"+res.total[i].availability+"</td>"
      			   tabcontent += "  <td>"+res.total[i].country+"</td>"
                    tabcontent += " </tr>"
      				
      				}
						}
      				
					}
      				else
      				{
      				//alert(res.items.length);
      				 tabcontent += "<h2>No data found</h2>"
      				}
                         $("#PSLbodyall").html(tabcontent);
      				 $('.All_container').show();
      	  
      	   
      	   
      	   },
                error: function (res) {
                    alert("error");
                }
            });
          }
       
	  
           function load_matches() {
      	   
        //$("#PSLbody").html("<img src='/images/loading.gif'style='margin-left:40%;margin-top:10%;'/>");
             
      	var eventid = $("#event_list option:selected").attr("eid");
          
            var fromdate = $('#from').val();
             var todate  = $('#to').val();
            //alert(fromdate);
         // alert(todate);
      	//alert(eventid);
      	
                $.ajax({
                url: "/event_ajax.aspx",
                dataType: "json",
                type: "get",
                async:false,
               data: { type: "25",  fromdate: fromdate , todate: todate , eventid: eventid },
                success: function (res) {
      	  
      	   var tabcontent = "";
      	    if (res.items.length > 0) {
                        
                         for (var i = 0; i < res.total.length; i++) {
                             var sold=0;
      					var total=res.total[i].Total_tickets;
      					var avail=res.total[i].availability;
      					sold=total-avail;
      					
      					//alert(res.total.Total_tickets);
      				tabcontent += " <tr class='odd gradeX'>"
                      tabcontent += " <td>"+res.total[i].Ticketname+"</td>"
                     tabcontent += " <td>"+res.total[i].Total_tickets+"</td>"
                     tabcontent += "  <td>"+sold+"</td>"
                      tabcontent += "  <td style='display:none;'>"+res.total[i].availability+"</td>"
      			 
      			   tabcontent += "  <td>"+res.items[i].country+"</td>"
      			    tabcontent += "  <td>"+res.items[i].title+"</td>"
      			  
                    tabcontent += " </tr>"
      				
      				}
      				}
      				else
      				{
      				//alert(res.items.length);
      				 tabcontent += "<h2>No data found</h2>"
      				}
                         $("#PSLbody").html(tabcontent);
      				
      	  
      	   
      	   
      	   },
                error: function (res) {
                    alert("error");
                }
            });
          }
       
         function load_allmatches() {
      	   
       // $("#PSLbody").html("<img src='/images/loading.gif'style='margin-left:40%;margin-top:10%;'/>");
             
     // alert(filter);
                $.ajax({
                url: "/event_ajax.aspx",
                dataType: "json",
                type: "get",
                async:false,
               data: { type: "26"},
                success: function (res) {
      	  
      	   var tabcontent = "";
      	   //alert(res.online.length);
      	    if (res.total.length > 0) {
                        
                         for (var i = 0; i < res.total.length; i++) {
                        if(res.total[i].Ticketname.indexOf('Complimentary') != 0 && res.total[i].Ticketname.indexOf('Comp') != 0)
      					{
      					var sold=0;
      					var total=res.total[i].Total_tickets;
      					var avail=res.total[i].availability;
      					sold=total-avail;
      						//alert(res.total[i].Total_tickets);
      				
      				tabcontent += " <tr class='odd gradeX'>"
                      tabcontent += " <td>"+res.total[i].Ticketname+"</td>"
                     tabcontent += " <td>"+res.total[i].Total_tickets+"</td>"
                     tabcontent += "  <td>"+res.total[i].online+"</td>"
					 
					 tabcontent += "  <td>"+res.total[i].offline+"</td>"
                      tabcontent += "  <td style='display:none;'>"+res.total[i].availability+"</td>"
      			   tabcontent += "  <td>"+res.total[i].country+"</td>"
                    tabcontent += " </tr>"
      				
      				}
						}
      				
					}
      				else
      				{
      				//alert(res.items.length);
      				 tabcontent += "<h2>No data found</h2>"
      				}
                         $("#PSLbodyall").html(tabcontent);
      				 $('.All_container').show();
      	  
      	   
      	   
      	   },
                error: function (res) {
                    alert("error");
                }
            });
          }
       
       
         function GetPSLEvent() {
          
         $.ajax({
                 url: "/QTA_ajax.aspx",
                 dataType: "json",
                 type: "post",
                 async: true,
                 data: { type: "3", state: "1"},
                 success: function (res) {
      		 alert(res.items.length);
                     if (res.items.length > 0)
                         {
                               QTAevent = '<option eid="504">Opening Ceremony-Peshawar Zalmi vs Islamabad United | Feb  9,2017</option>';
                              for (var i = 0; i < res.items.length; i++)
                              {
							 // if(i==0)
							 if(res.items[i].id != "504")
							 {
							  QTAevent += "<option eid='" + res.items[i].id + "'>" + res.items[i].name + " | " + res.items[i].Start_Date+",2017</option>";
							  
							  }
							}
      
                              //var selecttab = $("#Qtaevent").parent().hasClass("active");
                             // if (selecttab)
                                  $("#event_list").html(QTAevent);
      				     
      			}
      			else
      			{
      			//var selecttab = $("#Qtaevent").parent().hasClass("active");
      			if (status==0 )
      			{
      			 QTAevent = '<option eid="0">all</option>';
      			 $("#event_list").html(QTAevent);
      			 }
      			}
                 },
                 error: function () {
                     alert("something went wrong");
                 }
             });
         }
  

           function load_matchesByfilter(eventidpsl) {
      	   
        //$("#PSLbody").html("<img src='/images/loading.gif'style='margin-left:40%;margin-top:10%;'/>");
             
      //	var eventidpsl = $("#event_list option:selected").attr("eid");
         
         // alert(todate);
      
      		<% if(Session("user_id_psl") = "20" ) then %>
   
      	  // alert(eventidpsl);
		      	<% end if %>
				//alert(eventidpsl);
                $.ajax({
                url: "/event_ajax.aspx",
                dataType: "json",
                type: "get",
                async:false,
               data: { type: "37",  eventidpsl: eventidpsl },
                success: function (res) {
      	 
      	   var tabcontent = "";
      	   
      	    if (res.total.length > 0) {
                        
                         for (var i = 0; i < res.total.length; i++) {
                        if(res.total[i].Ticketname.indexOf('Complimentary') != 0 )
      					{
      					var sold=0;
      					var total=res.total[i].Total_tickets;
      					var avail=res.total[i].availability;
      					sold=total-avail;
						var online=0;
						var offline=0;
      						//alert(res.total[i].Total_tickets);
      				//alert(res.total[i].online);
					if(res.total[i].online == "")
					{
					online=0;
					}
					else
					{
					online=res.total[i].online;
					}
					if(res.total[i].online == "")
					{
					offline=0;
					}
					else
					{
					offline=res.total[i].offline;
					}
				
				
      				tabcontent += " <tr class='odd gradeX'>"
                      tabcontent += " <td>"+res.total[i].Ticketname+"</td>"
                     tabcontent += " <td>"+res.total[i].Total_tickets+"</td>"
                   tabcontent += "  <td>"+res.total[i].online+"</td>"
					 
					 tabcontent += "  <td>"+res.total[i].offline+"</td>"
					  tabcontent += "  <td>"+res.total[i].scanned+"</td>"
                      tabcontent += "  <td style='display:none;'>"+res.total[i].availability+"</td>"
      			   tabcontent += "  <td>"+res.total[i].country+"</td>"
                    tabcontent += " </tr>"
      				
      				}
						}
      				
					}
      				else
      				{
      				//alert(res.items.length);
      				 tabcontent += "<h2>No data found</h2>"
      				}
                         $("#PSLbodyall").html(tabcontent);
      				 $('.All_container').show();
      	  
      	   
      	   
      	   
      	   },
                error: function (res) {
                    alert("error");
                }
            });
          }
       
  </script>
   <script src="js/jquery.uniform.js"></script> 
   <script src="js/matrix.form_common.js"></script> 
</asp:Content>