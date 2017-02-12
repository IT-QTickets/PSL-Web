<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="MasterPage.master" CodeFile="GetUserSupport.aspx.vb" Inherits="GetUserSupport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="css_body" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_body" runat="Server">
    <form id="form1" runat="server">

       

    <div>
    
        <table style="width:100%;">
            <tr>
                <td colspan="3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td>Booking ID : </td>
                <td>
                    <asp:TextBox ID="txtBookingID" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>Confirmation Code : </td>
                <td>
                    <asp:TextBox ID="txtConfCode" runat="server"></asp:TextBox>
                </td>
                <td>Email : </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="Button2" runat="server" Text="Booking ID" />
                </td>
                <td colspan="2">
                    <asp:Button ID="ConfCode" runat="server" Text="Confirmation Code" />
                </td>
                <td colspan="2">
                    <asp:Button ID="Email" runat="server" Text="Email" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="3"></td>
                <td class="auto-style1" colspan="2"></td>
                <td class="auto-style1" colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td class="auto-style2" colspan="2"><strong>BOOKING INFO</strong></td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="3"></td>
                <td class="auto-style3" colspan="2"></td>
                <td class="auto-style3" colspan="2"></td>
            </tr>
            <tr>
                <td colspan="7">&nbsp;
                     <asp:GridView ID="GridBookingInfp" runat="server" class="table table-bordered table-striped" visible="false" style="text-align: center"  >
			
			</asp:GridView>

                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td class="auto-style2" colspan="2"><strong style="text-align: center">ZONE</strong></td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="7">&nbsp;
                    <asp:Label ID="lblZone" runat="server" style="text-align:center" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="3"></td>
                <td class="auto-style4" colspan="2"><strong>CUSTOMER INFO</strong></td>
                <td class="auto-style4" colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="7" class="auto-style3">
                      <asp:GridView ID="GridClientInfo" runat="server" class="table table-bordered table-striped" visible="false" style="text-align: center"  >
			
			</asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPH1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script_body" runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            $(".venuefilter").show();
            load_allmatches();
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!

            var yyyy = today.getFullYear();
            if (dd < 10) {
                dd = '0' + dd;
            }
            if (mm < 10) {
                mm = '0' + mm;
            }
            var today = mm + '/' + dd + '/' + yyyy;
            $('#from').val(today);
            $('#to').val(today);

            //alert("came");
            //load_matches() ;
            GetPSLEvent();
            $("#details").click(function () {
                load_matches();
            });



            $(".rButton").change(function () {


                switch ($(this).val()) {
                    case 'matches':

                        $(".matchesfilter").show();
                        $(".venuefilter").hide();
                        $(".venuefilter1").hide();
                        // alert("Allot Thai Gayo Bhai");
                        break;
                    case 'venue':
                        $(".matchesfilter").hide();
                        $(".venuefilter1").hide();
                        $(".venuefilter").show();
                        //  alert("Transfer Thai Gayo");
                        break;
                        break;
                    case 'Type':
                        $(".matchesfilter").hide();
                        $(".venuefilter").hide();
                        $(".venuefilter1").show();
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
            var todate = $('#to').val();
            //alert(fromdate);
            // alert(todate);
            //alert(eventid);

            $.ajax({
                url: "/event_ajax.aspx",
                dataType: "json",
                type: "get",
                async: false,
                data: { type: "25", fromdate: fromdate, todate: todate, eventid: eventid },
                success: function (res) {

                    var tabcontent = "";
                    if (res.items.length > 0) {

                        for (var i = 0; i < res.total.length; i++) {
                            var sold = 0;
                            var total = res.total[i].Total_tickets;
                            var avail = res.total[i].availability;
                            sold = total - avail;

                            //alert(res.total.Total_tickets);
                            tabcontent += " <tr class='odd gradeX'>"
                            tabcontent += " <td>" + res.total[i].Ticketname + "</td>"
                            tabcontent += " <td>" + res.total[i].Total_tickets + "</td>"
                            tabcontent += "  <td>" + sold + "</td>"
                            tabcontent += "  <td>" + res.total[i].availability + "</td>"

                            tabcontent += "  <td>" + res.items[i].country + "</td>"
                            tabcontent += "  <td>" + res.items[i].title + "</td>"

                            tabcontent += " </tr>"

                        }
                    }
                    else {
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
                async: false,
                data: { type: "26" },
                success: function (res) {

                    var tabcontent = "";

                    if (res.total.length > 0) {

                        for (var i = 0; i < res.total.length; i++) {
                            if (res.total[i].Ticketname.indexOf('Complimentary') != 0) {
                                var sold = 0;
                                var total = res.total[i].Total_tickets;
                                var avail = res.total[i].availability;
                                sold = total - avail;
                                //alert(res.total[i].Total_tickets);

                                tabcontent += " <tr class='odd gradeX'>"
                                tabcontent += " <td>" + res.total[i].Ticketname + "</td>"
                                tabcontent += " <td>" + res.total[i].Total_tickets + "</td>"
                                tabcontent += "  <td>" + sold + "</td>"
                                tabcontent += "  <td>" + res.total[i].availability + "</td>"
                                tabcontent += "  <td>" + res.total[i].country + "</td>"
                                tabcontent += " </tr>"

                            }
                        }
                    }
                    else {
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
                data: { type: "3", state: "1" },
                success: function (res) {
                    // alert(res.items.length);
                    if (res.items.length > 0) {
                        QTAevent = '<option eid="0" selected="selected">All</option>';
                        for (var i = 0; i < res.items.length; i++) {
                            QTAevent += "<option eid='" + res.items[i].id + "'>" + res.items[i].name + "</option>";
                        }

                        //var selecttab = $("#Qtaevent").parent().hasClass("active");
                        // if (selecttab)
                        $("#event_list").html(QTAevent);

                    }
                    else {
                        //var selecttab = $("#Qtaevent").parent().hasClass("active");
                        if (status == 0) {
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


















