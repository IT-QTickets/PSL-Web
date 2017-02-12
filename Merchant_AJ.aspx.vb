Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Merchant_AJ
    Inherits System.Web.UI.Page

    Public constr As String = "Persist Security Info=False;User ID=QTAdmin;Password=NIMDATEKCITQ;Initial Catalog=qticket;Data Source=172.31.63.72;Min Pool Size=10;Max Pool Size=200"
    Public bookingID As String
    Public No_ofTickets As String
    Public TicketPriceID As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("user_id_psl") Is Nothing Then
           Server.Transfer("index.aspx")
        End If

If Session("user_id_psl") <> "89"  Then
 Server.Transfer("index.aspx")
End IF

       ' If Session("user_id_psl") <> "20" And Session("user_id_psl") <> "39" And Session("user_id_psl") <> "75" And Session("user_id_psl") <> "81" Then
        '    Server.Transfer("index.aspx")
       'End If


        If Not Me.IsPostBack Then




            '    Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


            '    Try
            '        sqlcmd = New SqlCommand("GetcomplimenteryDataZonewise", sqlcon)
            '        With sqlcmd
            '            .CommandType = CommandType.StoredProcedure
            '            .CommandTimeout = 0
            '            .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = 1
            '            sqldata.SelectCommand = sqlcmd
            '            sqldata.Fill(ds)
            '            GridView2.DataSource = ds.Tables(0)
            '            GridView2.DataBind()
            '        End With
            '    Catch ex As Exception


            '    Finally
            '        If (sqlcon.State <> Data.ConnectionState.Closed) Then
            '            sqlcon.Close()
            '        End If
            '    End Try






            '    'Using con As New SqlConnection(constr)
            '    ' Using cmd As New SqlCommand("SELECT t1.BlockNo As Zone ,count(t2.BarCode) As Total_Tickets,case  when t2.Isprinted = 2 then count(t2.Isprinted) else 0 end As Total_Printed,case  when t2.IsIssued = 2 then count(t2.IsIssued) else 0 end As Total_Sold,case  when t2.IsAdmitted = 2 then count(t2.IsAdmitted) else 0 end As Total_Scanned  FROM Ticket_MasterStatus t1  join BarcodeMaster t2 on t2.Ticket_Master_SNo=t1.Sno group by t1.BlockNo, t2.Isprinted,t2.IsIssued,t2.IsAdmitted")
            '    '    Using sda As New SqlDataAdapter()
            '    '       cmd.Connection = con
            '    '       sda.SelectCommand = cmd
            '    '      Using ds As New DataSet()
            '    '         sda.Fill(ds)
            '    '        gridview2.DataSource = ds.Tables(0)
            '    '       gridview2.DataBind()

            '    '  End Using
            '    ' End Using
            '    '  End Using
            '    ' End Using
            '    GridView2.Visible = True

            'alghurair@360-nautica.com


            Using con1 As New SqlConnection(constr)
                Using cmdd As New SqlCommand("select [Email],[AdminUserId] from AdminUsers where [SuperAdminIDD]='ajsportadmin@q-tickets.com'")
                    cmdd.CommandType = CommandType.Text
                    cmdd.Connection = con1
                    con1.Open()
                    ddlMatches.DataSource = cmdd.ExecuteReader()
                    ddlMatches.DataTextField = "Email"
                    ddlMatches.DataValueField = "AdminUserId"
                    ddlMatches.DataBind()
                    con1.Close()
                End Using
            End Using
            ddlMatches.Items.Insert(0, New ListItem("--All Users--", "0"))




          Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


               Try
                   sqlcmd = New SqlCommand("psl_Merchant_all_by_filter_userid_Superadmin", sqlcon)
                   With sqlcmd
                       .CommandType = CommandType.StoredProcedure
                       .CommandTimeout = 0
                       .Parameters.Add("@venue", Data.SqlDbType.varchar, 100).Value = "all"
					   .Parameters.Add("@event_id", Data.SqlDbType.varchar, 100).Value = "all"
        			   .Parameters.Add("@user_id", Data.SqlDbType.varchar, 100).Value = "89"
                       sqldata.SelectCommand = sqlcmd
                       sqldata.Fill(ds)
                       GridView2.DataSource = ds.Tables(0)
                       GridView2.DataBind()
                   End With
               Catch ex As Exception


               Finally
                   If (sqlcon.State <> Data.ConnectionState.Closed) Then
                       sqlcon.Close()
                   End If
               End Try



        End If
    End Sub



    Protected Sub ddlMatches_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlMatches.SelectedIndexChanged
        GridView1.Visible = False

        If ddlMatches.SelectedItem.Text = "--All Users--" Then

 Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


               Try
                   sqlcmd = New SqlCommand("psl_Merchant_all_by_filter_userid_Superadmin", sqlcon)
                   With sqlcmd
                       .CommandType = CommandType.StoredProcedure
                       .CommandTimeout = 0
                       .Parameters.Add("@venue", Data.SqlDbType.varchar, 100).Value = "all"
					   .Parameters.Add("@event_id", Data.SqlDbType.varchar, 100).Value = "all"
        			   .Parameters.Add("@user_id", Data.SqlDbType.varchar, 100).Value = "89"
                       sqldata.SelectCommand = sqlcmd
                       sqldata.Fill(ds)
                       GridView2.DataSource = ds.Tables(0)
                       GridView2.DataBind()
                   End With
               Catch ex As Exception


               Finally
                   If (sqlcon.State <> Data.ConnectionState.Closed) Then
                       sqlcon.Close()
                   End If
               End Try

        End If

        Try

            ' Using con As New SqlConnection(constr)
            '    Using cmd As New SqlCommand("select * from psl_client_Details where userid="+ ddlMatches.SelectedValue.ToString())
            '      Using sda As New SqlDataAdapter()
            '         cmd.Connection = con
            '        sda.SelectCommand = cmd
            '        Using dt As New DataTable()
            '           sda.Fill(dt)
            ' GridView2.DataSource = dt
            'GridView2.DataBind()
            'GridView2.Visible = True
            '         bookingID = dt.Rows(0)("bookingid").ToString()
            '      End Using
            ' End Using
            'End Using
            '  End Using


            '  Using con As New SqlConnection(constr)
            '   Using cmd As New SqlCommand("select * from event_booking_master where pay_status=1 and confirm_status=1 and booking_id=" + bookingID )
            '      Using sda As New SqlDataAdapter()
            '         cmd.Connection = con
            '        sda.SelectCommand = cmd
            '       Using dt As New DataTable()
            '          sda.Fill(dt)
            '         No_ofTickets = dt.Rows(0)("no_of_tickets").ToString()
            '    End Using
            'End Using
            '  End Using
            '   End Using


            ' Using con As New SqlConnection(constr)
            '   Using cmd As New SqlCommand("select * from event_booking_info where booking_id=" + bookingID)
            '      Using sda As New SqlDataAdapter()
            '         cmd.Connection = con
            '        sda.SelectCommand = cmd
            '        Using dt As New DataTable()
            '           sda.Fill(dt)
            '          TicketPriceID = dt.Rows(0)("ticket_price_id").ToString()
            '     End Using
            ' End Using
            '  End Using
            '  End Using


			 Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


               Try
                   sqlcmd = New SqlCommand("psl_Merchant_all_by_filter_userid_Superadmin", sqlcon)
                   With sqlcmd
                       .CommandType = CommandType.StoredProcedure
                       .CommandTimeout = 0
                       .Parameters.Add("@venue", Data.SqlDbType.varchar, 100).Value = "all"
					   .Parameters.Add("@event_id", Data.SqlDbType.varchar, 100).Value = "all"
        			   .Parameters.Add("@user_id", Data.SqlDbType.varchar, 100).Value = ddlMatches.SelectedValue.ToString()
                       sqldata.SelectCommand = sqlcmd
                       sqldata.Fill(ds)
                       GridView2.DataSource = ds.Tables(0)
                       GridView2.DataBind()
                   End With
               Catch ex As Exception


               Finally
                   If (sqlcon.State <> Data.ConnectionState.Closed) Then
                       sqlcon.Close()
                   End If
               End Try
			
			
			
        '    Using con As New SqlConnection(constr)
         '       Using cmd As New SqlCommand("select tp.Ticketname As Zonename ,tp.availability As Available,tp.Totla_tickets As Total,sum(eb.no_of_tickets) as Nooftickets from psl_client_Details ps join event_booking_master eb on eb.booking_id=ps.bookingid join event_booking_info bi on bi.booking_id=ps.bookingid  join event_ticket_price tp on bi.ticket_price_id=tp.id where ps.userid=" + ddlMatches.SelectedValue.ToString() + " and eb.pay_status=1 and eb.confirm_status=1 group by  tp.Ticketname,tp.availability,tp.Totla_tickets")
                    'select Ticketname,Totla_tickets,availability, (Totla_tickets - availability) As Sold  from event_ticket_price where id=" + TicketPriceID)
          '          Using sda As New SqlDataAdapter()
           '             cmd.Connection = con
            '            sda.SelectCommand = cmd
             '           Using dt As New DataTable()
              '              sda.Fill(dt)
                            'If dt.Rows.Count > 0 Then
               '             GridView2.DataSource = dt
                '            GridView2.DataBind()
                            'end if
                            'If dt.Rows.Count = 0 Then
                            'GridView2.Rows[0].Text = "No Records Found";
                            'end if


         '               End Using
          '          End Using
           '     End Using
           ' End Using
            'GridView2.Visible = True

            'GridView2.DataSource = ds.Tables(0)
            '    GridView2.DataBind()

        Catch ex As Exception


        Finally

        End Try




    End Sub




End Class
