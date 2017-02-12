<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="Report_Ticket.aspx.vb" Inherits="Report_Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="css_body" Runat="Server">
<style>

.radio input[type="radio"], .checkbox input[type="checkbox"] {
    float: left;
    margin-left: 0px !important;
	
}
</style>
<style type="text/css">
body
{
    margin: 0;
    padding: 0;
    font-family: Arial;
}
.modal
{
   
    position: fixed;
    z-index: 999;
    height: 100%;
    width: 170%;
    top: 0;
    background-color: Black;
    filter: alpha(opacity=60);
    opacity: 0.8;
    -moz-opacity: 0.8;
	left:0;
}
.center
{
    z-index: 1000;
    margin: 300px auto;
    padding: 10px;
    width: 130px;
    background-color: White;
    border-radius: 10px;
    filter: alpha(opacity=100);
    opacity: 1;
    -moz-opacity: 1;
}
.center img
{
    height: 128px;
    width: 128px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_body" Runat="Server">
<form runat="server">
    <div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Ticket Status</a> </div>
    <h1>Ticket Status</h1>
  </div>
  
   
 <div class="container">
 
 
 
 <div class="span6">
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
           </div>
<div class="span6" style="margin-top:20px;">
			   <label>
                  <input type="radio" name="radios" class="rButton" value="matches" runat="server" ID="rdmatches" />
                  Matches</label>
               <div class="span4 matchesfilter" style="display:none;">
				    <asp:DropDownList ID = "ddlMatches" runat="server" AutoPostBack="True">
</asp:DropDownList>
				</div>
               
  </div>
  
  
  
  
  <div  style="margin-top:20px;">
                <label>
                 <!-- <input type="radio" name="radios"  class="rButton" value="Type" />-->
            Ticket Type</label>
				  
				   
				
				  
				 
				
				<asp:RadioButtonList ID="rbIsRepp" runat="server"   AutoPostBack="true" TextAlign="Right" RepeatDirection="Horizontal" CssClass="fixed" style="margin-left:0px !important" >
				<asp:ListItem Value="1" class="span2"  Text="Paid" Checked="True"  ></asp:ListItem>
				<asp:ListItem Value="2" class="span2" Text="Complimentary" ></asp:ListItem>
			</asp:RadioButtonList>
			
			
			
			

				
				
				
				
				
				
				 
				
           </div>
  
  

  
  
  
  
  
  
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
            <h5>PSL 2017</h5>
          </div>
          
            </div>
           
		   
          </div>
        </div>
        
        
        
      </div>
	  
	  
	 
   </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
		<asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="false" >
<ProgressTemplate>
    
          <!--   <img alt="" src="images/loading.gif" style="width: 14px; height: 13px" /> -->
       <div class="modal">
        <div class="center">
            <img alt="" src="images/loading.gif" />
        </div>
    </div>
</ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional"> 
<Triggers> 
<asp:AsyncPostBackTrigger ControlID="ddlVenue" EventName="SelectedIndexChanged" /> 
<asp:AsyncPostBackTrigger ControlID="ddlMatches" EventName="SelectedIndexChanged" /> 
<asp:AsyncPostBackTrigger ControlID="rbIsRepp" EventName="SelectedIndexChanged" /> 
</Triggers> 
   <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-striped" visible="false"  />
			    <asp:GridView ID="GridView2" class="table table-bordered table-striped" runat="server" visible="false" AutoGenerateColumns="false" >
<columns>
    <asp:BoundField HeaderText="Zone" DataField="Zone" />
    <asp:BoundField HeaderText="Total Ticket" DataField="Total_Ticket" />
	<asp:BoundField HeaderText="Total Printed" DataField="Total_Printed" />
	<asp:BoundField HeaderText="Total Issued" DataField="Total_Issued" />
	<asp:BoundField HeaderText="Total Admitted" DataField="Total_Admitted" />
   </columns>
				</asp:GridView>
				
				<a href="http://admin.q-tickets.com/psl/eventbookings_list.aspx" class="btn btn-success btn-mini">Paid Booking</a>
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

