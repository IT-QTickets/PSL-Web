<%@ Page Language="VB" AutoEventWireup="false" CodeFile="home.aspx.vb" Inherits="home" MasterPageFile="MasterPage.master"  %>

<asp:Content ContentPlaceHolderId="html_body" runat="server">
  

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
    <div class="quick-actions_homepage">
      <ul class="quick-actions">
	  	<% if(Session("user_id_psl") = "94" or Session("user_id_psl") = "20" or Session("user_id_psl") = "75" or Session("user_id_psl") = "81" or Session("user_id_psl") = "83" or Session("user_id_psl") = "82" or Session("user_id_psl") = "39") then %>
       <!--  <li class="bg_lb"> <a href="#"> <i class="icon-dashboard"></i>  Add Users </a> </li>
        <li class="bg_lg span3"> <a href="#"> <i class="icon-signal"></i> Event Details</a> </li> -->
        <li class="bg_ly"> <a href="http://admin.q-tickets.com/psl/eventbookings_list.aspx"> <i class="icon-inbox"></i><span class="label label-success" id="epsts"></span> Paid Booking </a> </li>
       <!--  http://admin.q-tickets.com/psl/report_ticket.aspx -->
		<li class="bg_lo" > <a href="http://admin.q-tickets.com/psl/complimentarybookings_list.aspx"> <i class="icon-th"></i><span class="label label-important" id="compsts"></span>  Complimentary Booking</a> </li>
	   <li class="bg_ls" > <a href="http://admin.q-tickets.com/psl/merchantbookings_list.aspx"> <i class="icon-fullscreen"></i><span class="label label-important" id="mersts"></span> Merchant Booking</a> </li>
        <%  if(Session("user_id_psl")) = "81" or Session("user_id_psl") ="75" %>
	   <li class="bg_lb"> <a href="http://admin.q-tickets.com/psl/report_ticket.aspx"> <i class="icon-dashboard"></i> <span class="label label-important" id="scanlive"></span>Scanned</a> </li>
	    <% end if %>
        <% else if(Session("user_id_psl")) = "0309" %>
		 <!--  <li class="bg_lb"> <a href="#"> <i class="icon-dashboard"></i>  Add Users </a> </li>
        <li class="bg_lg span3"> <a href="#"> <i class="icon-signal"></i> Event Details</a> </li> -->
        <li class="bg_ly"> <a href="http://admin.q-tickets.com/psl/eventbookings_list.aspx"> <i class="icon-inbox"></i><span class="label label-success" id="epsts"></span> Paid Booking </a> </li>
        
 <% else %>
	   
       
	  
	  <% end if %>
      </ul>
    </div>
<!--End-Action boxes-->    

<!--Chart-box-->    
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
          <h5>HBL PSL 2017</h5>
        </div>
        <div class="widget-content" >
          <div class="row-fluid">
            <div class="span9">
            <div class="widget-box" style="    margin-top: 0px;">
          <div class="widget-title bg_lo" data-toggle="collapse" href="#collapseG3"> <span class="icon"> <i class="icon-chevron-down"></i> </span>
            <h5>Top Five Tickets Sales</h5>
          </div>
          <div class="widget-content nopadding updates collapse in fillupdatebooking" id="collapseG3">
           
		  </div>
        </div>
            </div>
            <div class="span3">
              <ul class="site-stats">
                <li class="bg_lh"> <strong>Dubai</strong> <small>Stadium</small></li>
                <li class="bg_lh"> <strong>Sharjah</strong> <small>Stadium </small></li>
                <li class="bg_lh"><i class="icon-tag"></i> <strong id="dta"></strong> <small>Total Available</small></li>
                <li class="bg_lh"><i class="icon-tag"></i> <strong id="sta"></strong> <small>Total Available</small></li>
                <li class="bg_lh"><i class="icon-globe"></i> <strong id="dts"></strong> <small>Online</small></li>
                <li class="bg_lh"><i class="icon-globe"></i> <strong id="sts"></strong> <small>Online</small></li>
            <li class="bg_lh"><i class="icon-globe"></i> <strong id="dmts"></strong> <small>Merchant</small></li>
                <li class="bg_lh"><i class="icon-globe"></i> <strong id="smts"></strong> <small>Merchant</small></li>
		  	<% if(Session("user_id_psl") = "20" or Session("user_id_psl") = "94"  or Session("user_id_psl") = "75" or Session("user_id_psl") = "82" or Session("user_id_psl") = "83"  or Session("user_id_psl") = "81" or Session("user_id_psl") = "39") then %>
		  <li class="bg_lh"><i class="icon-globe"></i> <strong id="dbts"></strong> <small>Total Block</small></li>
                <li class="bg_lh"><i class="icon-globe"></i> <strong id="sbts"></strong> <small>Total Block</small></li>
				  <li class="bg_lh"><i class="icon-globe"></i> <strong id="dcts"></strong> <small> Complimentary</small></li>
                <li class="bg_lh"><i class="icon-globe"></i> <strong id="scts"></strong> <small>Complimentary</small></li>
				
				
		  	<% End if  %>
				<% if(Session("user_id_psl") = "81" or Session("user_id_psl") = "75" )%>
			 <li class="bg_lh"><i class="icon-globe"></i> <strong id="dscant"></strong> <small> Total Scanned</small></li>
                <li class="bg_lh"><i class="icon-globe"></i> <strong id="sscant"></strong> <small>Total Scanned</small></li>
				<% End if  %>
		  <li class="bg_lh"><i class="icon-repeat"></i> <strong id="dtb"></strong> <small>Balance Available</small></li>
                <li class="bg_lh"><i class="icon-repeat"></i> <strong id="stb"></strong> <small>Balance Available</small></li>
              
			  </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
<!--End-Chart-box--> 
    <hr/>
   <div class="row-fluid" style="display:none;">
      <div class="span4">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-eye-open"></i> </span>
            <h5>Browesr statistics</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>Browser</th>
                  <th>Visits</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Chrome</td>
                  <td>8850</td>
                </tr>
                <tr>
                  <td>Firefox</td>
                  <td>5670</td>
                </tr>
                <tr>
                  <td>Internet Explorer</td>
                  <td>4130</td>
                </tr>
                <tr>
                  <td>Opera</td>
                  <td>1574</td>
                </tr>
                <tr>
                  <td>Safari</td>
                  <td>1044</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="span4">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-arrow-right"></i> </span>
            <h5>Website statistics</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>Site</th>
                  <th>Visits</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><a href="#">Themeforest.com</a></td>
                  <td>12444</td>
                </tr>
                <tr>
                  <td><a href="#">Themedesigner.in</a></td>
                  <td>10455</td>
                </tr>
                <tr>
                  <td><a href="#">Themedesigner.in</a></td>
                  <td>8455</td>
                </tr>
                <tr>
                  <td><a href="#">Themedesigner.in</a></td>
                  <td>4456</td>
                </tr>
                <tr>
                  <td><a href="#">Themedesigner.in</a></td>
                  <td>2210</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="span4">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-file"></i> </span>
            <h5>Visited Pages</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>Page</th>
                  <th>Visits</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><a href="#">Freebies</a></td>
                  <td>8550</td>
                </tr>
                <tr>
                  <td><a href="#">Blog</a></td>
                  <td>7550</td>
                </tr>
                <tr>
                  <td><a href="#">Work</a></td>
                  <td>5247</td>
                </tr>
                <tr>
                  <td><a href="#">site template</a></td>
                  <td>4880</td>
                </tr>
                <tr>
                  <td><a href="#">All categories</a></td>
                  <td>4801</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
<!--end-main-container-part-->
 
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="script_body" runat="Server">
 
 
 <script type="text/javascript">
    
     $(document).ready(function() {   
 load_count() ;
 gettopevents();
});
	  
      function load_count() {

         
           $.ajax({
           url: "/event_ajax.aspx",
           dataType: "json",
           type: "get",
           async:false,
           data: { type: "23"},
           success: function (res) {
		   var dta= "187691";
		   var sta= " 124760";
		   //19336
		   $('#dta').html("1,87,691");
		   $('#sta').html("1,24,760");
		   
		 
			
			
		   var sharjaho=0;
		    var sharjahof=0;
			  var sharjahb=0;
		    var dubaio=0;
			 var dubaiof=0;
			  var dubaib=0;
			  var scancount=0;
		   if(res.sharjah_online == "")
		   {
		   sharjaho=0;
		   }
		   else
		   {
		   sharjaho=res.sharjah_online;
		   }
		    if(res.sharjah_offline == "")
		   {
		   sharjahof=0;
		   }
		   else
		   {
		   sharjahof=res.sharjah_offline;
		   }
		   //alert(res.dubai);
		    if(res.dubai_online == "")
		   {
		   dubaio=0;
		   }
		   else
		   {
		   dubaio=res.dubai_online;
		   }
		  if(res.dubai_offline == "")
		   {
		   dubaiof=0;
		   }
		   else
		   {
		   dubaiof=res.dubai_offline;
		   }
		  if(res.dubai_bulk == "")
		   {
		   dubaib=0;
		   }
		   else
		   {
		   dubaib=res.dubai_bulk;
		   }
		   
		   if(res.scanned == "")
		   {
		   scancount=0;
		   }
		   else
		   {
		   scancount=res.scanned;
		   }
		     var SharjahSc =0;
			var DubaiSc=0;
		     if(res.DubaiScanned == "")
		   {
		   DubaiSc=0;
		   }
		   else
		   {
		   DubaiSc=res.DubaiScanned;
		   }
		  
		   if(res.SharjahScanned == "")
		   {
		   SharjahSc=0;
		   }
		   else
		   {
		   SharjahSc=res.SharjahScanned;
		   }
		   
		   $('#dscant').html(DubaiSc);
		   $('#sscant').html(SharjahSc);
		   
		   //sharjah
		   $('#dts').html(dubaio);
		   $('#dmts').html(dubaiof);
		   $('#dcts').html(dubaib);
		     
			 
			
			 //dubai
		   $('#sts').html(sharjaho);
		   $('#smts').html(sharjahof);
		  $('#scts').html("0");
		  
		   
		    $('#scanlive').html(scancount);
		 //  $('#sts').html(sharjahb);
		  // $('#dmts').html(dubaib);
		  sharjahb=res.sharjahcomp;
		  $('#scts').html(sharjahb);
		  
		  var blockdubai = "22893";
		  //8736
		  var blocksharjah = "2482"
		  //4664
		     $('#dbts').html(blockdubai);
		   $('#sbts').html(blocksharjah);
		  
			var finpaid= parseInt(dubaio) + parseInt(sharjaho);
		    $('#epsts').html(finpaid);
			var mfinal= parseInt(dubaiof) +  parseInt(sharjahof);
			 $('#mersts').html(mfinal);
			 
			 var comfinal= parseInt(dubaib) + parseInt(sharjahb);
			 $('#compsts').html(comfinal);
          // alert(res.dubai);
		   // alert(res.sharjah);
		   var sharjafcom= res.sharjahcomp;
		   
		   var dfinalbl=0;
		   var sfinalbl=0;
		   var total_dubai=  parseInt(dubaio) + parseInt(dubaiof) + parseInt(dubaib);
		   var total_sharjah= parseInt(sharjaho) + parseInt(sharjahof) + parseInt(sharjahb) ;
		 
		 dfinalbl=  parseInt(dta) - parseInt(total_dubai) - parseInt(blockdubai); 
           sfinalbl=  parseInt(sta) - parseInt(total_sharjah) - parseInt(blocksharjah); 
		   
		   
		    $('#dtb').html(dfinalbl);
		   
		    $('#stb').html(sfinalbl);
		   },
           error: function (res) {
               alert("error");
           }
       });
     }
	  
	   
   
                  function gettopevents() {
                     var divcon = '', itemcon = '';
                     $.ajax({
                         url: "/event_ajax.aspx",
                         dataType: "json",
                         type: "post",
                         async: false,
                         data: { type: 24 },
                         success: function (res) {
                 
                             var divcon = "", i = 0, len = 0, drop_con = "", l_lang = "", j = 0;
							
                             len = res.items.length;
                             
							// drop_con1 = drop_con1 + '<div class="remodal-overlay remodal-is-closed" style="display: none;"></div>'
							if(len >0)
							{
							for (i = 0; i < len; i++) {
                                 
							  //alert(res.items[i].inserted_ts.toString());
 divcon = divcon + '<div class="new-update clearfix"> '
divcon = divcon + ' <i class="icon-gift"></i>' 
 divcon = divcon + '<span class="update-notice"> '
 divcon = divcon + '<a title="" href="#">'
 divcon = divcon + '<strong>'+res.items[i].Title.toString()+' </strong>'
 divcon = divcon + '</a> '
 divcon = divcon + '<span>'+res.items[i].venue.toString()+' International cricket stadium </span>'
 divcon = divcon + '</span> '
 divcon = divcon + '<span class="update-date">'
 divcon = divcon + '<span class="update-day">'+res.items[i].BOOKED_DATE.toString()+'</span></span>'
 divcon = divcon + '</div>'
						
                  	   }
					   }
					   else
					   {
					  
					    divcon = divcon + '<div class="new-update clearfix"> '
divcon = divcon + ' <i class="icon-gift"></i>' 
 divcon = divcon + '<span class="update-notice"> '
 divcon = divcon + '<a title="" href="#">'
 divcon = divcon + '<strong>No Booking Found </strong>'
 divcon = divcon + '</a> '
 divcon = divcon + '<span></span>'
 divcon = divcon + '</span> '
 divcon = divcon + '<span class="update-date">'
 divcon = divcon + '<span class="update-day"></span></span>'
 divcon = divcon + '</div>'
					   }
                  		$('.fillupdatebooking').html(divcon);
						
                         },
                      // error: function (res) {alert(res.responseText); }
                     });
                  }
                
	  
	  </script>
 
 </asp:Content>