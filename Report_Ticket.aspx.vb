Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Report_Ticket
    Inherits System.Web.UI.Page

	
	 public constr As String = "Data Source=Persist Security Info=False;User ID=sa;Password=Qtickets@DB1973;Initial Catalog=pslticket;Data Source=172.31.63.72;Min Pool Size=10;Max Pool Size=200"
            public query As String = "SELECT t1.Date,t1.Match,t1.BlockNo,count(t2.IsPrinted) TotalPrinted,count(t2.IsAdmitted) TotalAdmitted  FROM Ticket_MasterStatus t1 join BarcodeMaster t2 on t2.Ticket_Master_SNo=t1.Sno   group by t1.Date,t1.Match,t1.BlockNo"
public query1 As String = "  SELECT t1.Match,t1.Date,t2.Barcode,t2.IsPrinted ,t2.IsAdmitted   FROM Ticket_MasterStatus t1  join BarcodeMaster t2 on t2.Ticket_Master_SNo=t1.Sno"
public queryddlMatch As String="  SELECT Distinct Match, Date FROM Ticket_MasterStatus"
	
	
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
	
	 If Session("user_id_psl") Is Nothing Then
            Server.Transfer("index.aspx")
        End If
 If Session("user_id_psl") <> "81" and  Session("user_id_psl") <> "75" Then
				   Server.Transfer("index.aspx")
end if
       
	 
	 
	
        If Not Me.IsPostBack Then
           

       	 System.Threading.Thread.Sleep(3000)
		'rbIsRepp.items[0].selected = true
		'rbIsRepp.SelectedIndex = 0
 Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter
      
       
        Try
            sqlcmd = New SqlCommand("GetcomplimenteryDataZonewise", sqlcon)
            With sqlcmd
                .CommandType = CommandType.StoredProcedure
                .CommandTimeout = 0 
                .Parameters.Add("@ticketType", Data.SqlDbType.int, 20).Value = 1
                sqldata.SelectCommand = sqlcmd
                sqldata.Fill(ds)
				 gridview2.DataSource = ds.Tables(0)
                 gridview2.DataBind()
            End With
        Catch ex As Exception
           

        Finally
            If (sqlcon.State <> Data.ConnectionState.Closed) Then
                sqlcon.Close()
            End If
        End Try
		
		
		
		
		
		
			'Using con As New SqlConnection(constr)
               ' Using cmd As New SqlCommand("SELECT t1.BlockNo As Zone ,count(t2.BarCode) As Total_Tickets,case  when t2.Isprinted = 2 then count(t2.Isprinted) else 0 end As Total_Printed,case  when t2.IsIssued = 2 then count(t2.IsIssued) else 0 end As Total_Sold,case  when t2.IsAdmitted = 2 then count(t2.IsAdmitted) else 0 end As Total_Scanned  FROM Ticket_MasterStatus t1  join BarcodeMaster t2 on t2.Ticket_Master_SNo=t1.Sno group by t1.BlockNo, t2.Isprinted,t2.IsIssued,t2.IsAdmitted")
                '    Using sda As New SqlDataAdapter()
                 '       cmd.Connection = con
                 '       sda.SelectCommand = cmd
                  '      Using ds As New DataSet()
                   '         sda.Fill(ds)
                    '        gridview2.DataSource = ds.Tables(0)
                     '       gridview2.DataBind()

                      '  End Using
                   ' End Using
              '  End Using
           ' End Using
		gridview2.visible=true
			
			
			
			
			 Using con1 As New SqlConnection(constr)
               Using cmdd As New SqlCommand(queryddlMatch)
                cmdd.CommandType = CommandType.Text
                cmdd.Connection = con1
                con1.Open()
                ddlMatches.DataSource = cmdd.ExecuteReader()
                ddlMatches.DataTextField = "Match"
               ddlMatches.DataValueField = "Date"
               ddlMatches.DataBind()
                con1.Close()
            End Using
            End Using
			ddlMatches.Items.Insert(0, New ListItem("--Select Matches--", "0"))
			
			
			
			
			
			
        End If
    End Sub

	
	
	Protected Sub ddlMatches_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlMatches.SelectedIndexChanged
	Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter
	 Try
            sqlcmd = New SqlCommand("GetcomplimenteryDataMatchwise", sqlcon)
            With sqlcmd
                .CommandType = CommandType.StoredProcedure
                .CommandTimeout = 0 
                .Parameters.Add("@ticketType", Data.SqlDbType.int, 20).Value = rbIsRepp.SelectedItem.Value
				.Parameters.Add("@MatchName", Data.SqlDbType.nvarchar, 100).Value = ddlMatches.SelectedItem.Text
				
                sqldata.SelectCommand = sqlcmd
                sqldata.Fill(ds)
				 gridview2.DataSource = ds.Tables(0)
                 gridview2.DataBind()
            End With
        Catch ex As Exception
           

        Finally
            If (sqlcon.State <> Data.ConnectionState.Closed) Then
                sqlcon.Close()
            End If
        End Try
	
	
		gridview2.visible=true
	
	End Sub
	
	
	
	
	
	
	
   Protected Sub ddlVenue_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlVenue.SelectedIndexChanged
  System.Threading.Thread.Sleep(3000)
 IF (ddlVenue.SelectedItem.Text = "All") then
 
 Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter
      
       
        Try
            sqlcmd = New SqlCommand("GetcomplimenteryDataZonewise", sqlcon)
            With sqlcmd
                .CommandType = CommandType.StoredProcedure
                .CommandTimeout = 0 
                .Parameters.Add("@ticketType", Data.SqlDbType.int, 20).Value = rbIsRepp.SelectedItem.Value
                sqldata.SelectCommand = sqlcmd
                sqldata.Fill(ds)
				 gridview2.DataSource = ds.Tables(0)
                 gridview2.DataBind()
            End With
        Catch ex As Exception
           

        Finally
            If (sqlcon.State <> Data.ConnectionState.Closed) Then
                sqlcon.Close()
            End If
        End Try
 
 
		gridview2.visible=true
 end if
 
 
 
 
  IF (ddlVenue.SelectedItem.Text = "Sharjah") then
 
 Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter
      
       
        Try
            sqlcmd = New SqlCommand("GetcomplimenteryDataCountrywise", sqlcon)
            With sqlcmd
                .CommandType = CommandType.StoredProcedure
                .CommandTimeout = 0 
                .Parameters.Add("@ticketType", Data.SqlDbType.int, 20).Value = rbIsRepp.SelectedItem.Value 
                .Parameters.Add("@CountryName", Data.SqlDbType.nvarchar, 100).Value = "Sharjah"

	
                sqldata.SelectCommand = sqlcmd
                sqldata.Fill(ds)
				 gridview2.DataSource = ds.Tables(0)
                 gridview2.DataBind()
            End With
        Catch ex As Exception
           

        Finally
            If (sqlcon.State <> Data.ConnectionState.Closed) Then
                sqlcon.Close()
            End If
        End Try
 
 
		gridview2.visible=true
 end if
 
  IF (ddlVenue.SelectedItem.Text = "Dubai") then
 
 
  Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter
      
       
        Try
            sqlcmd = New SqlCommand("GetcomplimenteryDataCountrywise", sqlcon)
            With sqlcmd
                .CommandType = CommandType.StoredProcedure
                .CommandTimeout = 0 
                .Parameters.Add("@ticketType", Data.SqlDbType.int, 20).Value = rbIsRepp.SelectedItem.Value
                .Parameters.Add("@CountryName", Data.SqlDbType.nvarchar, 100).Value = "Dubai" 

	
                sqldata.SelectCommand = sqlcmd
                sqldata.Fill(ds)
				 gridview2.DataSource = ds.Tables(0)
                 gridview2.DataBind()
            End With
        Catch ex As Exception
           

        Finally
            If (sqlcon.State <> Data.ConnectionState.Closed) Then
                sqlcon.Close()
            End If
        End Try
 
 
 
 
		gridview2.visible=true
 end if
    
	
	
	
	End Sub
	
	
	
	  Protected Sub btnPaid_Click(sender As Object, e As EventArgs)
        If (rdvenue.Checked = "true") Then

            If (ddlVenue.SelectedItem.Text = "All") Then

                Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


                Try
                    sqlcmd = New SqlCommand("GetcomplimenteryDataZonewise", sqlcon)
                    With sqlcmd
                        .CommandType = CommandType.StoredProcedure
                        .CommandTimeout = 0
                        .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = 1
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


                GridView2.Visible = True
            End If




            If (ddlVenue.SelectedItem.Text = "Sharjah") Then

                Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


                Try
                    sqlcmd = New SqlCommand("GetcomplimenteryDataCountrywise", sqlcon)
                    With sqlcmd
                        .CommandType = CommandType.StoredProcedure
                        .CommandTimeout = 0
                        .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = 1
                        .Parameters.Add("@CountryName", Data.SqlDbType.NVarChar, 100).Value = "Sharjah"


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


                GridView2.Visible = True
            End If

            If (ddlVenue.SelectedItem.Text = "Dubai") Then


                Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


                Try
                    sqlcmd = New SqlCommand("GetcomplimenteryDataCountrywise", sqlcon)
                    With sqlcmd
                        .CommandType = CommandType.StoredProcedure
                        .CommandTimeout = 0
                        .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = 1
                        .Parameters.Add("@CountryName", Data.SqlDbType.NVarChar, 100).Value = "Dubai"


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




                GridView2.Visible = True
            End If



        End If


        If (rdmatches.Checked = "true") Then

            Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter
            Try
                sqlcmd = New SqlCommand("GetcomplimenteryDataMatchwise", sqlcon)
                With sqlcmd
                    .CommandType = CommandType.StoredProcedure
                    .CommandTimeout = 0
                    .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = 1
                    .Parameters.Add("@MatchName", Data.SqlDbType.NVarChar, 100).Value = ddlMatches.SelectedItem.Text

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


            GridView2.Visible = True


        End If
    End Sub

    Protected Sub btnComp_Click(sender As Object, e As EventArgs)


        If (rdvenue.Checked = "true") Then

            If (ddlVenue.SelectedItem.Text = "All") Then

                Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


                Try
                    sqlcmd = New SqlCommand("GetcomplimenteryDataZonewise", sqlcon)
                    With sqlcmd
                        .CommandType = CommandType.StoredProcedure
                        .CommandTimeout = 0
                        .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = 2
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


                GridView2.Visible = True
            End If




            If (ddlVenue.SelectedItem.Text = "Sharjah") Then

                Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


                Try
                    sqlcmd = New SqlCommand("GetcomplimenteryDataCountrywise", sqlcon)
                    With sqlcmd
                        .CommandType = CommandType.StoredProcedure
                        .CommandTimeout = 0
                        .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = 2
                        .Parameters.Add("@CountryName", Data.SqlDbType.NVarChar, 100).Value = "Sharjah"


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


                GridView2.Visible = True
            End If

            If (ddlVenue.SelectedItem.Text = "Dubai") Then


                Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


                Try
                    sqlcmd = New SqlCommand("GetcomplimenteryDataCountrywise", sqlcon)
                    With sqlcmd
                        .CommandType = CommandType.StoredProcedure
                        .CommandTimeout = 0
                        .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = 2
                        .Parameters.Add("@CountryName", Data.SqlDbType.NVarChar, 100).Value = "Dubai"


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




                GridView2.Visible = True
            End If



        End If


        If (rdmatches.Checked = "true") Then

            Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter
            Try
                sqlcmd = New SqlCommand("GetcomplimenteryDataMatchwise", sqlcon)
                With sqlcmd
                    .CommandType = CommandType.StoredProcedure
                    .CommandTimeout = 0
                    .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = 2
                    .Parameters.Add("@MatchName", Data.SqlDbType.NVarChar, 100).Value = ddlMatches.SelectedItem.Text

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


            GridView2.Visible = True


        End If




    End Sub
	
	
	
	
	
	
	
	
   Protected Sub rbIsRepp_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rbIsRepp.SelectedIndexChanged
   
    If (rdvenue.Checked = "true") Then

            If (ddlVenue.SelectedItem.Text = "All") Then

                Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


                Try
                    sqlcmd = New SqlCommand("GetcomplimenteryDataZonewise", sqlcon)
                    With sqlcmd
                        .CommandType = CommandType.StoredProcedure
                        .CommandTimeout = 0
                        .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = rbIsRepp.SelectedItem.Value
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


                GridView2.Visible = True
            End If




            If (ddlVenue.SelectedItem.Text = "Sharjah") Then

                Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


                Try
                    sqlcmd = New SqlCommand("GetcomplimenteryDataCountrywise", sqlcon)
                    With sqlcmd
                        .CommandType = CommandType.StoredProcedure
                        .CommandTimeout = 0
                        .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = rbIsRepp.SelectedItem.Value
                        .Parameters.Add("@CountryName", Data.SqlDbType.NVarChar, 100).Value = "Sharjah"


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


                GridView2.Visible = True
            End If

            If (ddlVenue.SelectedItem.Text = "Dubai") Then


                Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter


                Try
                    sqlcmd = New SqlCommand("GetcomplimenteryDataCountrywise", sqlcon)
                    With sqlcmd
                        .CommandType = CommandType.StoredProcedure
                        .CommandTimeout = 0
                        .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = rbIsRepp.SelectedItem.Value
                        .Parameters.Add("@CountryName", Data.SqlDbType.NVarChar, 100).Value = "Dubai"


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




                GridView2.Visible = True
            End If



        End If


        If (rdmatches.Checked = "true") Then

            Dim sqlcmd As SqlCommand, sqlcon As New SqlConnection(constr), ds As New DataSet, sqldata As New SqlDataAdapter
            Try
                sqlcmd = New SqlCommand("GetcomplimenteryDataMatchwise", sqlcon)
                With sqlcmd
                    .CommandType = CommandType.StoredProcedure
                    .CommandTimeout = 0
                    .Parameters.Add("@ticketType", Data.SqlDbType.Int, 20).Value = rbIsRepp.SelectedItem.Value
                    .Parameters.Add("@MatchName", Data.SqlDbType.NVarChar, 100).Value = ddlMatches.SelectedItem.Text

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


            GridView2.Visible = True


        End If

   
   
   
   
   End Sub
   
   
   
   
   
	
End Class
