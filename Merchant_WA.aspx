<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="MasterPage.master" CodeFile="Merchant_WA.aspx.vb" Inherits="Merchant_WA" %>



<asp:Content ID="Content1" ContentPlaceHolderID="css_body" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_body" Runat="Server">
<form runat="server">
    <div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Super Admin</a> </div>
    <h1>Super Admin </h1>
  </div>
  
   
 <div class="container">
 
 
 
 <%--<div class="span6">
                <label>
                  <input type="radio" name="radios" checked class="rButton" value="venue" runat="server" ID="rdvenue" />
                  Venue</label>
				 <div class="span4 venuefilter" style="display:none;">
				 <asp:DropDownList ID = "ddlVenue" runat="server" AutoPostBack="True" >
				 <asp:ListItem>All</asp:ListItem>
        <asp:ListItem>Sharjah</asp:ListItem>
        <asp:ListItem>Dubai</asp:ListItem>
</asp:DropDownList>
				   <!--<select >
                  <option>All</option>
                  <option>Sharjah</option>
                  <option>Dubai</option>
                 
                </select>-->
				</div>
           </div>--%>
<div class="span6" style="margin-top:20px;">
			   <label>
                 <%-- <input type="radio" name="radios" class="rButton" value="matches" runat="server" ID="rdmatches" />--%>
                  Select User </label>
               <div class="span4 matchesfilter" >
				    <asp:DropDownList ID = "ddlMatches" runat="server" AutoPostBack="True"  >
</asp:DropDownList>
				</div>
               
  </div>
  
  
  
  
  <%--<div  style="margin-top:20px;">
                <label>
                 <!-- <input type="radio" name="radios"  class="rButton" value="Type" />-->
            Ticket Type</label>
				  
				   
				
				  
				 
				
				<asp:RadioButtonList ID="rbIsRepp" runat="server"   AutoPostBack="true" TextAlign="Right" RepeatDirection="Horizontal" CssClass="fixed" style="margin-left:0px !important" >
				<asp:ListItem Value="1" class="span2"  Text="Paid"  ></asp:ListItem>
				<asp:ListItem Value="2" class="span2" Text="Complimentary" ></asp:ListItem>
			</asp:RadioButtonList>
			
			
			
			

				
				
				
				
				
				
				 
				
           </div>--%>
  
  

  
  
  
  
  
  
 </div>
 
  <div class="control-group" style="margin-left: 60px;margin-top:20px;">
 
 <div class="controls">
                <div data-toggle="buttons-radio" class="btn-group">
				  <!-- <asp:Button  runat="server" class="btn btn-primary " ID="btnAllStadium" style="margin: 15px;" Text="All Stadium" />
                <asp:Button runat="server"  class="btn btn-primary " ID="btnSharjah" style="margin: 15px auto;" Text="Sharjah" /> 
                  <asp:Button runat="server"  class="btn btn-primary " ID="btnDubai" style="margin: 15px auto;" Text="Dubai" /> -->
                 
                </div>
              </div>
     </div>
 
	
    <div class="row-fluid">
	
      <div class="span12">
        
        <div class="widget-box">
         
          <div class="widget-content tab-content">
            <div id="tab1" class="tab-pane active">
            
			<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Super Admin Data</h5>
          </div>
          
            </div>
           
		   
          </div>
        </div>
        
        
        
      </div>
	  
	  
	 
   </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
	<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
<ProgressTemplate>
    <div class="modal">
        <div class="center">
            <img alt="" src="loader.gif" />
        </div>
    </div>
</ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional"> 
<Triggers> 

<asp:AsyncPostBackTrigger ControlID="ddlMatches" EventName="SelectedIndexChanged" /> 

</Triggers> 
   <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-striped" visible="false" AutoGenerateColumns="false" >
			<columns>
    <asp:BoundField HeaderText="User" DataField="Email" />
    <asp:BoundField HeaderText="Zone" DataField="ZoneName" />
	  <asp:BoundField HeaderText="Total" DataField="Total" />
	<asp:BoundField HeaderText="Available" DataField="Available" />
	<asp:BoundField HeaderText="Total Sold" DataField="Nooftickets" />

   </columns>
			</asp:GridView>
			    <asp:GridView ID="GridView2" class="table table-bordered table-striped" runat="server"  AutoGenerateColumns="false" > 
<columns>
    <asp:BoundField HeaderText="Clientname" DataField="Clientname" />
    <asp:BoundField HeaderText="Total" DataField="Total" />
	<asp:BoundField HeaderText="International" DataField="International" />
	<asp:BoundField HeaderText="General Admission Green" DataField="GeneralAdmissionGreen" />
<asp:BoundField HeaderText="General Admission Green two" DataField="GeneralAdmissionGreentwo" />
<asp:BoundField HeaderText="Premium East" DataField="PremiumEast" />
<asp:BoundField HeaderText="PremiumWest" DataField="PremiumWest" />
<asp:BoundField HeaderText="Platinum" DataField="Platinum" />
<asp:BoundField HeaderText="NorthStand" DataField="NorthStand" />
<asp:BoundField HeaderText="EastStand" DataField="EastStand" />
<asp:BoundField HeaderText="WestStand" DataField="WestStand" />
<asp:BoundField HeaderText="GrandStand" DataField="GrandStand" />
<asp:BoundField HeaderText="MembersEnclosure" DataField="MembersEnclosure" />
   </columns>

  
				</asp:GridView>
				<%--<a href="http://admin.q-tickets.com/psl/eventbookings_list.aspx" class="btn btn-success btn-mini">Paid Booking</a>--%>
</ContentTemplate>
        </asp:UpdatePanel>
    </div>
	</div>
</form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPH1" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script_body" Runat="Server">

<script type="text/javascript">
    
 $(document).ready(function() { 
 $( ".venuefilter" ).show();
 load_allmatches();
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
 GetPSLEvent();
 $("#details").click(function () {  
            load_matches();
  });

  
    
$( ".rButton" ).change(function() {
  
  
   switch($(this).val()) {
        case 'matches' :
		
		$( ".matchesfilter" ).show();
		$( ".venuefilter" ).hide();
		$( ".venuefilter1" ).hide();
           // alert("Allot Thai Gayo Bhai");
            break;
        case 'venue' :
		$( ".matchesfilter" ).hide();
		$( ".venuefilter1" ).hide();
		$( ".venuefilter" ).show();
          //  alert("Transfer Thai Gayo");
            break;
			      break;
        case 'Type' :
		$( ".matchesfilter" ).hide();
		$( ".venuefilter" ).hide();
		$( ".venuefilter1" ).show();
          //  alert("Transfer Thai Gayo");
            break;
    }
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
                 tabcontent += "  <td>"+res.total[i].availability+"</td>"
				 
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
        
	
           $.ajax({
           url: "/event_ajax.aspx",
           dataType: "json",
           type: "get",
           async:false,
          data: { type: "26"},
           success: function (res) {
		  
		   var tabcontent = "";
		   
		    if (res.total.length > 0) {
                   
                    for (var i = 0; i < res.total.length; i++) {
                     if(res.total[i].Ticketname.indexOf('Complimentary') != 0)
						{
						var sold=0;
						var total=res.total[i].Total_tickets;
						var avail=res.total[i].availability;
						sold=total-avail;
							//alert(res.total[i].Total_tickets);
					
					tabcontent += " <tr class='odd gradeX'>"
                 tabcontent += " <td>"+res.total[i].Ticketname+"</td>"
                tabcontent += " <td>"+res.total[i].Total_tickets+"</td>"
                tabcontent += "  <td>"+sold+"</td>"
                 tabcontent += "  <td>"+res.total[i].availability+"</td>"
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



