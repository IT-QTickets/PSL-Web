<%@ Page Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="event_bookings_list.aspx.vb" Inherits="event_bookings_list" %>

<asp:Content ContentPlaceHolderId="html_body" runat="server">
  
<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->

	<input type="hidden" id="SomeHiddenvalue" name="SomeHiddenvalue" value="" />
    <%-- For Booking List--%>
  <div>
         <input type="hidden" value="<%=Session("user_id_psl") %>" id="se_userid" />
         <table  width="500px"  border=2 class="table" id="eventdata">
         <tr>
         <td align="left"><input type="radio" checked="checked" class="radio" id="radioactive" value="1" name="events" />&nbsp;<b>Active Events</b>&nbsp;&nbsp;
         <input type="radio" class="radio" id="radioenactive" value="0" name="events" />&nbsp;<b>Inactive Events</b></td>
         <td>&nbsp;</td>
         </tr>
         <tr>
         <td> 
		 <div id="Div2" style=" margin:10px; "> <b>From:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         </b><input type="text" id="from" readonly="readonly" name="day1" /></div>
		  <div class="control-group">
              <label class="control-label">Date Picker (mm-dd)</label>
              <div class="controls">
                <div  data-date="12-02-2012" class="input-append date datepicker">
                  <input type="text" value="12-02-2012"  data-date-format="mm-dd-yyyy" class="span11" >
                  <span class="add-on"><i class="icon-th"></i></span> </div>
              </div>
            </div>
		 </td>
         <td rowspan="4" width="45%"> <div id="total"></div></td>
         </tr>
         <tr><td><div id="Div3" style=" margin:10px; "><b>To:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="to" name="day2" readonly /></div></td></tr>
         <tr>
        <td><div id="drop_div" ><b>Event Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><select id="event_list"   name="event_name" class="span3"></select></div></td>
        </tr>
              
          <tr><td><input type="button" id="details" value="Submit" class="btn btn-primary"/></td></tr>
        </table> 
      </div>
      <%--  Tab Option --%>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" id="bkingdet" href="#divBooking">Booking Details</a></li>
        <li><a data-toggle="tab" id="consolidate" href="#Cdetails">Consolidated Details</a></li>
		 <% If Session("UserType") = "9" Then%>
        <li><a data-toggle="tab" id="Qtaevent" href="#QTAFreedetails">QTA Free Event</a></li>
        <% End If%>
    </ul>

    <div class="tab-content">

        <div id="divBooking" class="tab-pane fade in active">
                       <table width="100%" align="center" style="margin: 0px auto;">
        <div id="main">
            <tr align="center">
                <td width="50%">
                    <h3>BookingDetails</h3>
                    <% If (Session("user_id_psl") = 15533) Then%>
                  <span id="ofline" style="float: right; margin-top: -46px;"><a id="booking" href="/GetGymnastDetails.aspx"><input type="button" id="bookings" value="Offline bookings" class="btn btn-primary"></a></span>
                  <% end if %>
                                      </td>
               </tr><tr> <td align="right"><div id="totaltickets"></div></td></tr>
            <tr>
                <td>
                    <div id="total1">
                    </div>
                </td>
            </tr>
        </div>
        <tr>
 
            <td colspan="2">
                <form id="Form1" action="/event_bookings_list1.aspx"  method="post">
                 <div style="float:right;display:block; margin-top="20px;""> 
                 <input type="hidden"  ID="hfrom" name="hfrom" Value="" />
                  <input type="hidden" ID="hto" name="hto" Value="" />
                   <input type="hidden" ID="e_id" name="e_id" Value="" />
                   <input type="hidden" ID="type" name="type" Value="1" />
                  <% if "9".contains(session("UserType").tostring)= true Or Session("user_id_psl") ="4523"  Then %>  
                      <input type="button"   ID="btnExcelDetails"  value="Export to excel"  class="btn btn-success"/>
                    <% else %>
					<input type="button" style="display:none;"  ID="btnExcelDetails"  value="Export to excel"  class="btn btn-success"/>
                   
					<% end if %>
					 </form>
                     <%-- <asp:Button ID="btnpdfDetails" runat="server" Text="Export to pdf" class="btn btn-success" />--%>
                      
                      
                      <form id="Form1" runat="server"><asp:GridView ID="GridView1" runat="server" CssClass="gridview" HeaderStyle-ForeColor=  "BlueViolet" HeaderStyle-BackColor= "AntiqueWhite" 

RowStyle-BackColor= "AliceBlue" RowStyle-ForeColor="Cyan" Font-Size="Small" Font-Bold="true"  PagerStyle-Font-Size="Smaller"></asp:GridView>
</form>
                 </div>
               
            </td>
        </tr>
    </table>
        </div>
        <%--Anothe Tab  --%>
        <div id="Cdetails" class="tab-pane fade">
        <div style="text-align:center"><h3>Consolidated Details List</h3></div>
        <div id="detailsList"></div>
		 <div align="right"><input type="button" id="exportexcelbutton" class="btn btn-success" value="Export To Excel" /></div>
        </div>
		 <%-- QTA Free Event --%>
         <div id="QTAFreedetails" class="tab-pane fade">
            <h3>QTA Event Details </h3>
            <table width="100%" id="QTAEvent" class="table table-striped tableqtaevent">
             <thead>
               <tr>
                <th>SLNo.</th>
                <th>Event Name</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile No.</th>
                <th>Order Reference</th>
                <th>Event Date</th>
                <th>Event Time</th>
				<th>InsertedDate</th>
				<th>IS Register</th>
               </tr>
             </thead>
            <tbody id="QTAbody">

            </tbody>
            </table>
         </div>
          
        <%-- End of QTaFree Div --%>
    </div>
    <%-- End of Tab Option --%>

    
    <input type="hidden" value="" id="hdn_evnt"/>
    <input type="hidden" value="<%= Session("user_id_psl") %>" id="user_id" />
</asp:Content>
<%--Script Content start Here --%>
<asp:Content ID="Content4" ContentPlaceHolderID="script_body" runat="Server">
    <script src="/jsfiles/jquery-1.10.3-ui.js" type="text/javascript"></script>
    <%--<script src="jsfiles/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="/jsfiles/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="/jsfiles/jquery.dataTables.js"></script>
	<script type="text/javascript" src="/jsfiles/jquery.table2excel.js"></script>
    <script type="text/javascript">
     var activeevent=null;
     var inactiveevent=null;
     var flag=0;
	  var QTAevent = null;
	  var exportexcel ='';
     $(document).ready(function () {
	
		$.fn.dataTableExt.sErrMode = 'throw';
     //Event type radio bution change event 
       $("input[name=events]:radio").change(function () {

         var evtype=$(this).val();
         if(evtype==1)
         {
		 //alert(activeevent);
          $("#event_list").html(activeevent);
		   GetQTAEvent(1); 
         }
         else{
		  //alert(inactiveevent);
          $("#event_list").html(inactiveevent);
		  GetQTAEvent(0);
         }
         //load_cinemas();
       });
       $("#btnExcelDetails").click(function () {
            $("#hfrom").val($('#from').val()) ;
            $("#hto").val($('#to').val()) ;
            $("#e_id").val( $("#event_list option:selected").attr("eid")) ;
            $("#Form1").submit();                  
        });
	$("#exportexcelbutton").click(function () {
	  var	b = encodeURIComponent(exportexcel);
        window.open('data:application/vnd.ms-excel,' + b);
	    
	 });
	 
      $("#total1").html("<img src='/images/loading.gif'style='margin-left:40%;margin-top:10%;'/>")
       $("#total").html("<img src='/images/loading.gif'style='margin-left:40%;margin-top:20%;'/>")

           
        //var evnt = $('input:radio[name=events]:checked').val();
       
		load_cinemas(1);
        load_cinemas(0);
		//alert("came");
        $("#event_list").html(activeevent);

        $("#event_list").change(function(){
        $('#hdn_evnt').val($("#event_list").find(':selected').attr("eid"));
         });

     $('#hdn_evnt').val($("#event_list option:selected").attr("eid"));

          function load_cinemas(eventtype) {

          var fromdate1 = $('#from').val();
          var todate1 = $('#to').val(); 
          //var ev = $('input:radio[name=events]:checked').val();
           var ev=eventtype;
          //alert(ev);
           $.ajax({
           url: "/event_ajax.aspx",
           dataType: "json",
           type: "get",
           async:false,
           data: { type: "5", fromdate1: fromdate1, todate1: todate1, eventtype : ev},
           success: function (res) {
           var len = res.items.length
           var data = ""
           if (len > 1){
                data = '<option eid="0">all</option>'; }
               for (var i = 0; i < res.items.length; i++) {
                   data += "<option eid='" + res.items[i].id + "'>" + res.items[i].name + "</option>";
               }
       
               //$("#event_list").html(data);
               if(eventtype==1)
               {
                activeevent= data;
               }
               else if(eventtype==0)
               {
                 inactiveevent= data;
               }


           },
           error: function (res) {
               alert("error");
           }
       });
     }

      $("#hfrom").val($('#from').val()) ;
      $("#hto").val($('#to').val()) ;
      $("#e_id").val( $("#event_list option:selected").attr("eid")) ;

    $("#event_list").change(function () {
             $("#hfrom").val($('#from').val()) ;
             $("#hto").val($('#to').val()) ;
             $("#e_id").val( $("#event_list option:selected").attr("eid")) ;
         get_details_onclick();

        // get_Consolidate();
		 //new updated
             var selecttab = $("#Qtaevent").parent().hasClass("active");
             if (selecttab)
                 loadQTAEvetDetails();

       });
	   
	    //QTA Event Changing
    GetQTAEvent(1);
    loadQTAEvetDetails();

    $("#bkingdet").click(function () {
        bindddl();
    });

    $("#consolidate").click(function () {
        bindddl();
    });

    function bindddl() {
	alert("");
        var rbselect = $("input[name=events]:checked").val();
        if(rbselect==1)
        {
            $("#event_list").html(activeevent);
        }
        else {
            $("#event_list").html(inactiveevent);
        }
        $("#total").show();
    }

    $("#Qtaevent").click(function () {
        //$("#event_list").html(QTAevent);
		var rbselect = $("input[name=events]:checked").val();
		if(rbselect==1)
		{ 
			GetQTAEvent(1);
		}
		else{
			GetQTAEvent(0);
		}
        $("#total").hide();
    });

    
    function loadQTAEvetDetails() {
        var fdate = $("#from").val();
        var tdate = $("#to").val();
        var eventid = $("#event_list option:selected").attr("eid");

        $("#QTAbody").html("<img src='/images/loading.gif'style='margin-left:40%;margin-top:10%;'/>");
        $.ajax({
            url: "/QTA_ajax.aspx",
            dataType: "json",
            type: "post",
            async: true,
            data: { type: "2", frmdate: fdate, todate: tdate, eventid: eventid },
            success: function (res) {
                if (res.items.length > 0) {
                    var tabcontent = "";
                    for (var i = 0; i < res.items.length; i++) {
                        tabcontent += "<tr><td>" + (i + 1) + "</td><td>" + res.items[i].ename + "</td><td>" + res.items[i].name + "</td><td>" + res.items[i].email + "</td>";
                        tabcontent += "<td>" + res.items[i].phone + "</td><td>" + res.items[i].bokingid + "</td><td>" + res.items[i].booked_date + "</td><td>" + res.items[i].booktime + "</td><td>"+res.items[i].inserted_date+"</td><td>"+res.items[i].isregister+"</td></tr>";
                    }
                    $("#QTAbody").html(tabcontent);
					 $('#QTAEvent').dataTable({
                        "sPaginationType": "bootstrap",
                        "aaSorting": [[6, "desc"]],
                        "aLengthMenu": [[100, 150, 175, -1], [100, 150, 175, "All"]],
                        "iDisplayLength": 100,
                        "bJQueryUI": true
                    });
                }
                else {
                    $("#QTAbody").html("<h3> No Records </h3>");
                }
            },
            error: function () { }
        });

    }
	
    function GetQTAEvent(status) {
        $.ajax({
            url: "/QTA_ajax.aspx",
            dataType: "json",
            type: "post",
            async: true,
            data: { type: "1", state: status},
            success: function (res) {
                if (res.items.length > 0)
                    {
                          QTAevent = '<option eid="0">all</option>';
                         for (var i = 0; i < res.items.length; i++)
                         {
                          QTAevent += "<option eid='" + res.items[i].id + "'>" + res.items[i].name + "</option>";
                         }

                         var selecttab = $("#Qtaevent").parent().hasClass("active");
                         if (selecttab)
                             $("#event_list").html(QTAevent);
					     
				}
				else
				{
				var selecttab = $("#Qtaevent").parent().hasClass("active");
				if (status==0 && selecttab)
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


     //End of QTA new UPdates
	   
  $("#details").click(function () {  
             get_details_onclick(); 
            // get_Consolidate(); 
			loadQTAEvetDetails();  //new 
  });
        
  // get_Consolidate();
        
   get_details_onclick();
     function get_details_onclick() {
      $("#total1").html("<img src='images/loading.gif'style='margin-left:40%;margin-top:10%;'/>")
       $("#total").html("<img src='images/loading.gif'style='margin-left:40%;margin-top:20%;'/>")
      var eventid = $("#event_list option:selected").attr("eid");
      //alert(eventid);
       var fromdate = $('#from').val();
        var todate  = $('#to').val();
		//alert(fromdate);
		//alert(todate);
		
		
      $.ajax({
          url: "/event_ajax.aspx",
          dataType: "json",
          type: "post",
          async:true,
          data: { type: "3", req: "req", fromdate: fromdate , todate: todate , eventid: eventid },
          success: function (res) {
		  
              var constr = "", constr1 = "",i,total="";
               constr = constr + '<table class="table table-striped datatable" id=""movie_data"" style="width: 100%; font-size: 13px;"><thead>';
                for ( i = 0; i < res.items.length; i++){ 
                  if (i == 0) {
                      constr += '<tr ><th>S.no</th>';
                      constr += '<th>Name</th>';
					   <% if "492".contains(session("UserType").tostring)= true  Or session("UserType")="16" Then %>
					  //67117
					  if ($('#user_id_psl').val() != 48645 || $('#user_id_psl').val() != 48646 ){
					  constr += '<th>Email</th>';
					  }
					 
					  <% end if %>
					   if ($('#user_id_psl').val() == 15499 || $('#user_id_psl').val() == 55135){
					    constr += '<th>Email</th>';
					  }
                      constr += '<th>Event Name</th>';
                      constr += '<th>No.of tickets </th>';
                      constr += '<th>Confirmation Code </th>';
					  
					  if ($('#user_id_psl').val() == 60526) {
						constr += '<th>Mobile Number</th>';
					  }

                       <% if "492".contains(session("UserType").tostring)= false  Then %>
		               if ($('#user_id_psl').val() == 16399 || $('#user_id_psl').val() == 27027 || $('#user_id_psl').val() == 45435 || $('#user_id_psl').val() == 28372 || $('#user_id_psl').val() == 15499 || $('#user_id_psl').val() == 55135){
					   constr += '<th>Mobile Number</th>'; 
					   }
					   constr += '<th>Event Date</th>';
					 
                       constr += '<th>Booked time</th>';
					 
                       if ($('#user_id_psl').val() == 16399 ){
					    constr += '<th>BusFacility Required</th>';
						//constr += '<th>City</th>';
                      }
					   constr += '<th>Booking TimeStamp</th>';
					 
                       <% end if%>
                      <% if "492".contains(session("UserType").tostring)= true Or session("UserType")="16"  Then %>
                       constr += '<th>Mobile Number</th>';
					   constr += '<th>Order Reference</th>';
					   constr += '<th>Amount</th>';
                       constr += '<th>Booked_Date</th>';
                       constr += '<th>Booked time</th>';
					    constr += '<th>Booking TimeStamp</th>';
                       constr += '<th>email Status</th>';
                       constr += '<th>SMS Status</th>';
                       constr += '<th>Collected Status </th>';
                       constr += '<th>Action</th>';
                      <% end if %>
                      constr += '</thead></tr>';
                  }
                  constr1+="<tr><td>"+ parseInt(i+1)  + "</td>";
				  constr1 += '</td><td>' + res.items[i].name;
				   <% if "492".contains(session("UserType").tostring)= true Or session("UserType")="16"  Then %>
					  if ($('#user_id_psl').val() != 48645 || $('#user_id_psl').val() != 48646 ){
				   constr1 += '</td><td>' + res.items[i].email;
				   }
				   <% end if%>
				    if ($('#user_id_psl').val() == 15499 || $('#user_id_psl').val() == 55135){
					    constr1 += '</td><td>' + res.items[i].email;
					  }
                  constr1 += '<td>' + res.items[i].event_name;
				  constr1 += '</td><td>' + res.items[i].total_tickets;
                  if (res.items[i].tname != ''){
                    constr1 += "("+ res.items[i].tname+ ")";
                  }
                  constr1 += '</td><td>' + res.items[i].confirmation_code+'</td>';
				  
				  if ($('#user_id_psl').val() == 60526) {
						constr1 += '</td><td>' + res.items[i].phone;
					  }
				 
                   <% if "492".contains(session("UserType").tostring)= false Then %>
				  if ($('#user_id_psl').val() == 16399 || $('#user_id_psl').val() == 27027 || $('#user_id_psl').val() == 45435 || $('#user_id_psl').val() == 28372 || $('#user_id_psl').val() == 15499 || $('#user_id_psl').val() == 55135) {
				    constr1 += '</td><td>' + res.items[i].phone;}
				   constr1 += '</td><td>' + res.items[i].booked_date;
				  console.log(res.items[i].event_name);
                  constr1 += '</td><td>' + res.items[i].booked_time;
                  if ($('#user_id_psl').val() == 16399 ){
					   if(res.items[i].IsRequired == 1){
                   constr1 += '</td><td style="color:green"><b>Yes</b>'; }
                  else{ 
                    constr1 += '</td><td>No';}
					 
                   }
				  constr1 += '</td><td>' + res.items[i].booking_timestamp;
                  //constr1 += '</td><td>' + res.items[i].City;
                   <%end if%>
                   <% if "492".contains(session("UserType").tostring)= true Or session("UserType")="16"  Then %>
				   constr1 += '</td><td>' + res.items[i].phone;
                   constr1 += '</td><td> E ' + res.items[i].booking_id;
                   constr1 += '</td><td>' + res.items[i].total_price;
                   constr1 += '</td><td>' + res.items[i].booked_date;
                   constr1 += '</td><td>' + res.items[i].booked_time;
				   constr1 += '</td><td>' + res.items[i].booking_timestamp;
                   constr1 += '</td><td>' + res.items[i].email_status;
                   constr1 += '</td><td>' + res.items[i].sms_status;
                   if(res.items[i].collected_status == 0 ){
                    constr1 += '</td><td><input type="checkbox"  class="is_collected"  value= "1"   data-bookingid=' + res.items[i].booking_id + ' />';
                    }
                    else {
                        constr1 += '</td><td><input type="checkbox"  class="is_collected"  value= "0"   checked="checked" data-bookingid=' + res.items[i].booking_id + ' />';
                    }
                    constr1 += '</td><td><a href="#" data-booking_id = "'+ res.items[i].booking_id + '" class="resend" > resend</a>' ;
                   <% end if %>
                  constr1 += '</td></tr>';
			 
			 }

			
             for ( var j = 0; j <=res.total.length-1; j++) {
      
             if (j == 0) {total = '<table>'}
           
                  total+='<tr><td><h3> Number Of Tickets Sold : ' + res.total[j].total + '</h3></td></tr>' 
		  
			 <% if "9".contains(session("UserType").tostring)= true Or Session("user_id_psl") ="4523" Or Session("user_id_psl") ="53733" Or Session("user_id_psl") ="67117" Or Session("user_id_psl") ="60547"   Then %>              
				total+='<tr><td><h3> Total Amount (In Qatari Riyals):' + res.total[j].price + '</h3></td></tr>'
				  <% else %>
				  	total+='<tr><td><h3> Total Amount (In Qatari Riyals):XXXX</h3></td></tr>'
					<% end if %>
              }
              total+= '</table>'
             
              $("#total").html(total);
                        var tabcontent=""; 
                $("#detailsList").html("");
                  tabcontent += "<table id='tabeData' class='table table-striped datatable'><thead><tr><th>Event Name</th>";
				  <% if "492".contains(session("UserType").tostring)= false Then %>
				  if($('#user_id_psl').val() !=45435){
				  tabcontent += "<th>Ticket Type</th>";}
				  <% end if %>
				  <% if "492".contains(session("UserType").tostring)= true Or session("UserType")="16"  Then %>
				  tabcontent += "<th>Ticket Type</th>";
				  <% end if %>
				  tabcontent += "<th>Total Sold</th><th>Collected Tickets</th>";
				  if( $('#hdn_evnt').val() == 303){
				  tabcontent += "<th>EventTime</th></tr></thead><tbody>";
				  }
				  else{
				  tabcontent += "<th>EventDate</th></tr></thead><tbody>";
				  }
                  if(res.Consolidateitems.length > 0)
                  {
                     for(var k=0;k<res.Consolidateitems.length;k++)
                     {
                         tabcontent += "<tr><td>"+res.Consolidateitems[k].event_name+"</td>";
						   <% if "492".contains(session("UserType").tostring)= false Then %>
						   if($('#user_id').val() !=45435){
						 tabcontent += "<td>"+res.Consolidateitems[k].tickettype+"</td>";}
						 <% end if %>
						  <% if "492".contains(session("UserType").tostring)= true Or session("UserType")="16" Then %>
						 tabcontent += "<td>"+res.Consolidateitems[k].tickettype+"</td>";
						 <% end if %>
						 tabcontent += "<td>"+res.Consolidateitems[k].totaltickets+"</td><td>"+res.Consolidateitems[k].collectedTickets+"</td><td>"+res.Consolidateitems[k].EventDate+"</td></tr>" ;
                     }

                     tabcontent +="</tbody></table>";
                     $("#detailsList").html("");
                     $("#detailsList").html(tabcontent);
					 exportexcel = tabcontent;
                   }
                   else{
                      $("#detailsList").html("<span><h3>No Details Found</h3></span>");
                   }
                  
             
              if (res.items.length == 0) { $("#total1").html('<h3> No Results Found</h3>'); }
              else { $("#total1").html(constr + constr1 + '</table>'); }
              $('.datatable').dataTable({
                  "sPaginationType": "bootstrap",
                  "aaSorting": [[9,"desc"]],
				          "aLengthMenu": [[25, 50, 75, -1],[100, 150, 175, "All"]],
                  "iDisplayLength": 100,
                  "bJQueryUI": true
              });
            

                $(document).on("change", ".is_collected", function() {
                   var status = $(this).is(':checked');
                   var displaystatus=$(this).val();
                   var booking_id = $(this).attr("data-bookingid");
                var x=confirm("Are You sure to change the status of the printing ticket");
                if (x==true)
                {
                if ($(this).is(':checked')) {
                        $.ajax({
                            url: "/event_ajax.aspx",
                            data: { booking_id: booking_id, displaystatus : 1, type:2 },
                            async: false,
                            method: "POST",
                            success: function (a) {
                                                      if (a != "1") { $(this).removeAttr('checked');}
                                                  },
                            error: function (a) {
                                                 $(this).removeAttr('checked');
                                                  },
                          });
                 }
                 else {
                    $.ajax({
                        url: "/event_ajax.aspx",
                        data: { booking_id: booking_id, displaystatus: 0, type:2 },
                        async: false,
                        method: "POST",
                        success: function (a) {
                            if (a == "2") {$(this).prop("checked",true) }
                        },
                        error: function(a){
                                $(this).prop("checked",true);
                        },  
                    });
                }
               
               //window.location.reload();
                }else{
                   
                   if(status){$(this).removeAttr('checked');}
                   else{ $(this).prop("checked",true);}
                }
                
              });
               },
          error: function (res) {
              alert("error in data base");
          }
      });
 
    }
     });
	 


     function get_Consolidate(){
      var fromdate = $('#from').val();
      var todate  = $('#to').val();
      var eventid = $("#event_list option:selected").attr("eid");
      if(eventid=='undefined')
       eventid=0;
      $.ajax({
          url: "/event_ajax.aspx",
          dataType: "json",
          type: "post",
          async:true,
          data: { type: "35", fromdate: fromdate , todate: todate , eventid: eventid },
          success: function (res) {
          
          //Bind to detailsList div 
           $("#detailsList").html("");
          var tabcontent="<table id='tabeData' class='table'><thead><tr><th>Event Name</th><th>Ticket Type</th><th>Total Sold</th></tr></thead><tbody>";
          if(res.State==1)
          {
          //var l= res.items.length;
           if(res.items.length>0)
           {
           for(var i=0;i<res.items.length;i++)
           {
             tabcontent += "<tr><td>"+res.items[i].events+"</td><td>"+res.items[i].ticket_name+"</td><td>"+res.items[i].totak_sold+"</td></tr>" ;
           }

           tabcontent +="</tbody></table>";
           $("#detailsList").html("");
           $("#detailsList").html(tabcontent);
           }
           else{
           $("#detailsList").html("<span><h3>No Details Found</h3></span>");
           }
          }
          else{
             $("#detailsList").html("");
             $("#detailsList").html("<span><h3>No Details Found</h3></span>");
             //alert(res.item.toString());
          }
          },
          error : function(){
           alert("Some Error occured ");
          }
        });


        }
	  $(document).on("click",".resend",function(){
                var bid = $(this).attr("data-booking_id");
               // alert(bid);
                 $.ajax({
                        url: "/event_ajax.aspx",
                        async: false,
                        dataType: "json",
                        type: "post",
                        data: { booking_id: bid, type: 4 },
                        success: function(res) {
                            if (res.status == 2) {//success                       
                                alert("confirmation code sent sucessfully");
								
                                }
                            else { }
                        },
                        error: function (res) { console.log(res); }
                    });
              });
    </script>
	</div>
</asp:Content>
