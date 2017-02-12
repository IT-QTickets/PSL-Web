<%@ Page Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="financial_report.aspx.vb" Inherits="financial_report" %>
<asp:Content ID="Content5" ContentPlaceHolderID="css_body" runat="Server">
  <link rel="stylesheet" href="css/datepicker.css" />
  </asp:Content>
  
<asp:Content ContentPlaceHolderId="html_body" runat="server">
   <div id="content">
      <div id="content-header">
         <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Booking List</a> </div>
         <h1>Paid Booking List</h1>
      </div>
      <div class="container">
         <div class="span6">
            <label>
            <input type="radio" name="radios" checked class="rButton" value="venue" />
            Venue</label>
            <div class="span4 venuefilter" style="display:none;">
               <select id="venue_list">
                  <option value="All">All</option>
                  <option value="Sharjah">Sharjah</option>
                  <option value="Dubai">Dubai</option>
               </select>
            </div>
         </div>
         <div class="span6" style="margin-top: 20px;">
            <label>
            <input type="radio" name="radios" class="rButton" value="matches" />
            Matches</label>
            <div class="span4 matchesfilter" style="display:none;">
               <select id="event_list" >
                  <option eid="0">Select All Matches</option>
               </select>
            </div>
         </div>
      </div>
	  
	    <div class="container">
         <div class="span6" style="margin-top: 20px;">
            <label>
            <input type="radio" name="radios"  class="rButton" value="date" />
            Date Range</label>
            <div class="span4 datefilter" style="display:none;">
                <label class="control-label">From</label>
			  <div class="controls">
                <div  data-date="12-02-2012" class="input-append date datepicker">
                  <input type="text" value="12-02-2012"  data-date-format="mm-dd-yyyy" id="from" class="span11" style="width:70%;" >
                  <span class="add-on"><i class="icon-th"></i></span> </div>
              </div>
			  
			   <label class="control-label">To</label>
			  <div class="controls">
                <div  data-date="12-02-2012" class="input-append date datepicker">
                  <input type="text" value="12-02-2012"  data-date-format="mm-dd-yyyy" id="to" class="span11" style="width:70%;" >
                  <span class="add-on"><i class="icon-th"></i></span> </div>
              </div>
			  <input type="button" class="btn btn-success" value="submit" id="datesubmit" />
            </div>
         </div>
         <div class="span6" style="margin-top: 20px;">
            <label>
            <input type="radio" name="radios" class="rButton" value="merchant" />
            Merchant</label>
            <div class="span4 merchantfilter" style="display:none;">
               <select id="merchant_list" >
                  <option eid="0">Select All Matches</option>
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
									
                                       <th>Booking Id</th>
                                       <th>No_of_tickets</th>
                                       <th>Transaction Date</th>
                                       <th class="center">Amount(AED)</th>
                                       <th class="center">Service Fee</th>
                                       <th class="center">Zone</th>
									    <th class="center">Match</th>
										 <th class="center">Match Date</th>
										  <th class="center">Stadium</th>
										   <th class="center">Pay Mode</th>
										    <th class="center">Email</th>
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
                                       <th>Booking Id</th>
                                       <th>No_of_tickets</th>
                                       <th>Transaction Date</th>
                                       <th class="center">Amount(AED)</th>
                                       <th class="center">Service Fee</th>
                                       <th class="center">Zone</th>
									    <th class="center">Match</th>
										 <th class="center">Match Date</th>
										  <th class="center">Stadium</th>
										   <th class="center">Pay Mode</th>
										    <th class="center">Email</th>
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
	
      $( ".venuefilter" ).show();
	 
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
      
      // alert("came");
      //load_matches() ;
      // load_allmatches();
     // load_allmatchesbyfilter(filterpsl)
          load_allmatchesbyfilter("0","0","0","0","0","0") ;
      $( "#venue_list" ).change(function() {
       
      // alert($(this).val());
	  var filter=$(this).val();
	 // var load_allmatchesbyfilter(match,venue,To,From,Mode,Merchant);
	  if(filter =="Dubai" || filter =="Sharjah")
	  {
	 // load_allmatchesbyfilter(match,venue,To,From,Mode,Merchant)
	    load_allmatchesbyfilter('0',filter,'0','0','0','0') ;
	   }
	   else
	   {
	    load_allmatchesbyfilter('0','0','0','0','0','0') ;
	   }
      });	
        
     
       
      GetPSLEvent();
	  GetMerchant();
      $("#datesubmit").click(function () {  
        
		//load_allmatchesbyfilter(match,venue,To,From,Mode,Merchant)
	     load_allmatchesbyfilter('0','0',$('#from').val(), $('#to').val(),'0','0') ;
       //load_matchesByfilter(eventidpsl);
       });
      
       
         
       $( ".rButton" ).change(function() {
       
       
        switch($(this).val()) {
             case 'matches' :
      	
      	$( ".matchesfilter" ).show();
      	$( ".venuefilter" ).hide();
		$( ".datefilter" ).hide();
			$( ".merchantfilter" ).hide();
                // alert("Allot Thai Gayo Bhai");
                 break;
             case 'venue' :
      	$( ".matchesfilter" ).hide();
      	$( ".venuefilter" ).show();
		$( ".datefilter" ).hide();
			$( ".merchantfilter" ).hide();
               //  alert("Transfer Thai Gayo");
                 break;
				 
				 case 'date' :
				 
		$( ".datefilter" ).show();

      	$( ".matchesfilter" ).hide();
      	$( ".venuefilter" ).hide();
			$( ".merchantfilter" ).hide();
               //  alert("Transfer Thai Gayo");
                 break;
				 
				 
				  case 'merchant' :
			$( ".merchantfilter" ).show();
			 
		$( ".datefilter" ).hide();

      	$( ".matchesfilter" ).hide();
      	$( ".venuefilter" ).hide();
			
               //  alert("Transfer Thai Gayo");
                 break;
         }
      });	
       
	   $( "#event_list" ).change(function() {
		
       var eventidpsl = $("#event_list option:selected").attr("eid");
	   //load_allmatchesbyfilter(match,venue,To,From,Mode,Merchant)
	     load_allmatchesbyfilter(eventidpsl,'0','0','0','0','0') ;
       //load_matchesByfilter(eventidpsl);
      
      });	
	  
	   $( "#merchant_list" ).change(function() {
		
       var eventidpsl = $("#merchant_list option:selected").attr("eid");
	   //load_allmatchesbyfilter(match,venue,To,From,Mode,Merchant)
	     load_allmatchesbyfilter('0','0','0','0','0',eventidpsl) ;
       //load_matchesByfilter(eventidpsl);
      
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
      
      
	  
	   function load_allmatchesbyfilter(match,venue,To,From,Mode,Merchant) {
    
	
	
                $.ajax({
                url: "/event_ajax.aspx",
                dataType: "json",
                type: "get",
                async:false,
               data: { type: "34",match: match,venue: venue,To: To,From: From,Mode: Mode,Merchant: Merchant},
                success: function (res) {
      	  
      	   var tabcontent = "";
		   
      	    if (res.total.length > 0) {
                        
                         for (var i = 0; i < res.total.length; i++) {
                        if(res.total[i].Ticketname.indexOf('Complimentary') != 0 && res.total[i].Ticketname.indexOf('Comp') != 0)
      					{
      					
      				//match: match,venue: venue,To: To,From: From,Mode: Mode,Merchant: Merchant
      				tabcontent += " <tr class='odd gradeX'>"
                      tabcontent += " <td>"+res.total[i].booking_id+"</td>"
                     tabcontent += " <td>"+res.total[i].no_of_tickets+"</td>"
                      tabcontent += "  <td>"+res.total[i].inserted_ts+"</td>"
					 
					 tabcontent += "  <td>"+res.total[i].total_price+"</td>"
					 if(res.total[i].pay_type == "Cash" || res.total[i].pay_type == 'Credit_Card')
					 {
					  tabcontent += "  <td>0</td>"
					 }
					 else
					 {
                      tabcontent += "  <td>"+res.total[i].service_fee+"</td>"
					  }
      			   tabcontent += "  <td>"+res.total[i].Ticketname+"</td>"
				     tabcontent += "  <td>"+res.total[i].Title+"</td>"
					   tabcontent += "  <td>"+res.total[i].Start_Date+"</td>"
					     tabcontent += "  <td>"+res.total[i].country+"</td>"
						   tabcontent += "  <td>"+res.total[i].pay_type+"</td>"
						    tabcontent += "  <td>"+res.total[i].email+"</td>"
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
      		// alert(res.items.length);
                     if (res.items.length > 0)
                         {
                               QTAevent = '<option eid="0" selected="selected">All</option>';
                              for (var i = 0; i < res.items.length; i++)
                              {
                               QTAevent += "<option eid='" + res.items[i].id + "'>" + res.items[i].name + " | " + res.items[i].Start_Date+",2017</option>";
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
  
  
         function GetMerchant() {
          
         $.ajax({
                 url: "/QTA_ajax.aspx",
                 dataType: "json",
                 type: "post",
                 async: true,
                 data: { type: "4", state: "1"},
                 success: function (res) {
      		// alert(res.items.length);
                     if (res.items.length > 0)
                         {
                               QTAevent = '<option eid="0" selected="selected">All</option>';
                              for (var i = 0; i < res.items.length; i++)
                              {
                               QTAevent += "<option eid='" + res.items[i].AdminUserId + "'>" + res.items[i].Email + "</option>";
                              }
      
                              //var selecttab = $("#Qtaevent").parent().hasClass("active");
                             // if (selecttab)
                                  $("#merchant_list").html(QTAevent);
      				     
      			}
      			else
      			{
      			//var selecttab = $("#Qtaevent").parent().hasClass("active");
      			if (status==0 )
      			{
      			 QTAevent = '<option eid="0">all</option>';
      			 $("#merchant_list").html(QTAevent);
      			 }
      			}
                 },
                 error: function () {
                     alert("something went wrong");
                 }
             });
         }
  

  </script>
   <script src="js/jquery.uniform.js"></script> 
   <script src="js/matrix.form_common.js"></script> 
   <script src="js/bootstrap-datepicker.js"></script> 
</asp:Content>