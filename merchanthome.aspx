<%@ Page Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="merchanthome.aspx.vb" Inherits="merchanthome" %>
<asp:Content ContentPlaceHolderId="html_body" runat="server">
   <div id="content">
      <div id="content-header">
         <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Booking List</a> </div>
         <h1>Merchant Booking List</h1>
      </div>
      <div class="container">
         <div class="span6">
            <label>
            <input type="radio" name="radios" checked class="rButton" value="venue" />
            Venue</label>
            <div class="span4 venuefilter" style="display:none;">
               <select id="venue_list">
                  <option value="all">All</option>
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
                                       <th>Merchant</th>
                                       <th>Total Limit</th>
                                       <th>Used</th>
                                       <th class="center">Available</th>
                                       <th class="center">Pay Type</th>
                                       <th class="center">Country</th>
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
                                       <th>Total Sold</th>
                                       <th>Value Per-Ticket(AED)</th>
                                       <th class="center">Total Amount</th>
                                     <!--   <th class="center">Pay Type</th> -->
                                       <th class="center">Country</th>
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
  
<div class="container-fluid otherfilter" style="display:none;">
<div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-eye-open"></i> </span>
            <h5>Summary statistics</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>Details</th>
                  <th>Value(AED)</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Total Limit</td>
                  <td id="tldetail"></td>
                </tr>
                <tr>
                  <td>Used Dubai</td>
                  <td id="uddetail"></td>
                </tr>
                <tr>
                  <td>Used sharjah</td>
                  <td id="usdetail"></td>
                </tr>
                <tr>
                  <td>Balance Total</td>
                  <td id="btdetail"></td>
                </tr>
                <tr>
                  <td>Cash</td>
                  <td id="csdetail"></td>
                </tr>
				 <tr>
                  <td>Credit</td>
                  <td id="cddetail"></td>
                </tr>
              </tbody>
            </table>
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
	  $("#tldetail").html("");
	  $("#uddetail").html("");
	  $("#usdetail").html("");
	  
	   $("#btdetail").html("");
	  
	  $("#csdetail").html("");
	  
	  $("#cddetail").html("");
      $( ".venuefilter" ).show();
	  var e="all";
	  var v="all";
	
      GetPSLEvent();
		 load_byfilter(e,v);
      $( "#venue_list" ).change(function() {
        $("#tldetail").html("");
	  $("#uddetail").html("");
	  $("#usdetail").html("");
	  
	   $("#btdetail").html("");
	  
	  $("#csdetail").html("");
	  
	  $("#cddetail").html("");
      //alert($(this).val());
	   var venueid='';
	    var  eventidpsl="";
	  if($(this).val() =="all")
	  {
	  venueid=$(this).val();
	  eventidpsl="all";
	  }
	  else
	  {
	  venueid=$(this).val();
	  eventidpsl="0";
	  }
	 
	  
	   
       load_byfilter(eventidpsl,venueid);
	   
	
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
		 $("#tldetail").html("");
	  $("#uddetail").html("");
	  $("#usdetail").html("");
	  
	   $("#btdetail").html("");
	  
	  $("#csdetail").html("");
	  
	  $("#cddetail").html("");
       var eventidpsl = $("#event_list option:selected").attr("eid");
	   var  venueid='0';
       load_byfilter(eventidpsl,venueid);
      
      });	
       
	   
       
       });
      
      
	  
	   function load_byfilter(event_idpsl,venuepsl) {
    //alert(venuepsl);
	//  alert(event_idpsl);
                $.ajax({
                url: "/event_ajax.aspx",
                dataType: "json",
                type: "get",
                async:false,
               data: { type: "30",venuepsl: venuepsl,event_idpsl:event_idpsl},
                success: function (res) {
      	  
      	   var tabcontent = "";
		   if(res.total.length > 0 && res.status == "2")
		   {
		  //alert(res.total.length);
		  for (var i = 0; i < res.total.length; i++) {
					
                    
					   var used=0;
						var amt=0;
      					
      					var avail=0;
      					
      					
      				     used=res.total[i].no_of_tickets;
						 amt=res.total[i].total_price;
      					 avail=parseInt(used) * parseInt(amt);
      				
						 
      				tabcontent += " <tr class='odd gradeX'>"
					  tabcontent += " <td>"+res.total[i].Ticketname+"</td>"
                    tabcontent += " <td>"+res.total[i].no_of_tickets+"</td>"
                    tabcontent += " <td>"+res.total[i].total_price+"</td>"
                    tabcontent += "  <td>"+avail+"</td>"
                  <!--   tabcontent += "  <td>"+res.total[i].pay_type+"</td>" -->
      			    tabcontent += "  <td>"+res.total[i].country+"</td>"
					 
                    tabcontent += " </tr>"
                        }
						 $("#PSLbodyall").html(tabcontent);
      				 $('.All_container').show();
					  $('.otherfilter').hide();
		   }
		   else
		   {
		   	 tabcontent += "<h2>No data found</h2>"
 
  $("#PSLbodyall").html(tabcontent);
 
			$('.All_container').show();
					  $('.otherfilter').hide();
		   }
      	    if (res.total.length > 0 && res.status == "3") {
                        
                       for (var i = 0; i < res.total.length; i++) {
					
                    
					   var used=0;
						var Totallimit=0;
      					
      					var avail=0;
      					
      					if(res.total[i].clientname == "AjSports")
						{
						Totallimit=50000;
						
						}
						else if(res.total[i].clientname == "Wakharesta")
						{
						Totallimit=20000;
						}
						else if(res.total[i].clientname == "Barbequedel")
						{
						Totallimit=20000;
						}
						else if(res.total[i].clientname == "TCS")
						{
						Totallimit=20000;
						}
						else if(res.total[i].clientname =="Client")
						{
						Totallimit=5000;
						}
						else {
						}
      				     used=res.total[i].no_of_tickets;
      					 avail=Totallimit-used;
      				
						 $("#tldetail").html(Totallimit);
						 if(res.total[i].country =="Sharjah")
						 {
						 
						  $("#usdetail").html(used);
						 
						  }
						  else if (res.total[i].country =="Dubai")
						  {
						
						    $("#uddetail").html(used);
							
						  }
						  else
						  {
						   
						  }
						  if(res.total[i].pay_type =="Cash")
						  {
						    $("#csdetail").html(used);
						  }
						  else if(res.total[i].pay_type == "Credit_Card")
						  {
						   $("#cddetail").html(used);
						  }
						  else
						  {
						  }
						    $("#btdetail").html(avail);
							
      				
                        }
				 $('.All_container').hide();
      				 $('.otherfilter').show();
				}
				else
				{
				 tabcontent += "<h2>No data found</h2>"
				  
				}
      	  
      	     
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
                               QTAevent += "<option eid='" + res.items[i].id + "'>" + res.items[i].name + "</option>";
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
	  
  </script>
   <script src="js/jquery.uniform.js"></script> 
   <script src="js/matrix.form_common.js"></script> 
</asp:Content>