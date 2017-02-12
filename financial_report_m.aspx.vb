Imports Microsoft.Office.Interop
Imports System.Object
Imports System.MarshalByRefObject
Imports System.ComponentModel.Component
Imports System.IO
Imports System.Data.SqlClient
Imports System.Data
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.awt
Partial Class financial_report_m
    Inherits System.Web.UI.Page
    Public Shared constr As String = ConfigurationManager.ConnectionStrings("qticketdbconnectionstring").ConnectionString
    Public buildstrexcel1 As New StringBuilder
    Dim sqlcmd As New SqlCommand, con As New SqlConnection(constr)
    Dim ds As New DataSet, sqldata As New SqlDataAdapter
	
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user_id_psl") Is Nothing Then
            Server.Transfer("index.aspx")
        End If
If Session("user_id_psl") <> "37" and Session("user_id_psl") <> "89" and Session("user_id_psl") <> "75" and Session("user_id_psl") <> "73" and Session("user_id_psl") <> "86" and Session("user_id_psl") <> "87" and Session("user_id_psl") <> "93" Then
 Server.Transfer("index.aspx")
End IF
        If Request("type") = 1 Then
            excelupload()
        ElseIf Request("type") = 2 Then
            excelupload()
        End If
    End Sub

    Public Sub excelupload()
 
        Dim filename As String
        Try
            sqlcmd = New SqlCommand("booking_list_new", con)
            With sqlcmd
                .CommandType = CommandType.StoredProcedure

                .Parameters.Add("@userid", SqlDbType.VarChar, 100)
                .Parameters("@userid").Direction = ParameterDirection.Input
                .Parameters("@userid").Value = Session("user_id")
                .Parameters.Add("@fromdate", SqlDbType.Date)
                .Parameters("@fromdate").Direction = ParameterDirection.Input
                .Parameters("@fromdate").Value = Request("hfrom")
                .Parameters.Add("@event_id", SqlDbType.Int)
                .Parameters("@event_id").Direction = ParameterDirection.Input
                .Parameters("@event_id").Value = Request("e_id")
                .Parameters.Add("@todate", SqlDbType.Date)
                .Parameters("@todate").Direction = ParameterDirection.Input
                .Parameters("@todate").Value = Request("hto")
            End With
            sqldata.SelectCommand = sqlcmd
            sqldata.Fill(ds)
            sqlcmd.Dispose()
            con.Close()
            filename = DateTime.Now.ToString("yyyy-MM-dd-hh:mm")
            Response.ClearContent()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=" & filename & ".xls")
            Response.Charset = ""
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.ContentType = "application/vnd.Excel"
            buildstrexcel1.Append("<table class="".info"" border=1><tr><th>S.no</th><th>Name</th><th>Event Name</th><th>No.of Tickets</th><th>Ticket Type</th><th>Confirmation Code</th>")
            If Session("type_of_user") <> 7 Then
                buildstrexcel1.Append("<th>Email</th><th>Mobile number</th><th>order Reference</th> <th>Amount</th><th>Booking TimeStamp</th><th>Booked Date</th><th>Booked Time</th>")
			Else
			  If Session("user_id") = 27027 or Session("user_id") = 45435 or Session("user_id") = 16399 or Session("user_id") = 28372 or Session("user_id") = 15499 or Session("user_id") = 55135 Then
                buildstrexcel1.Append("<th>Email</th><th>Mobile number</th><th>Booked Date</th><th>Booked Time</th><th>Booking TimeStamp</th>")
				Else
				buildstrexcel1.Append("<th>Booked Date</th><th>Booked Time</th><th>Booking TimeStamp</th>")
              End If
			  
            End If
			
            buildstrexcel1.Append("</tr>")

            With ds.Tables(0)
                If (ds.Tables(0).Rows.Count > 0) Then
                    For i As Integer = 0 To .Rows.Count - 1
                        buildstrexcel1.Append("<tr><td>" & i + 1 & "</td>")
                        buildstrexcel1.Append("<td>" & .Rows(i)("name").ToString & "</td>")
                        buildstrexcel1.Append("</td><td>" & .Rows(i)("event_name").ToString & "</td>")
                        buildstrexcel1.Append("</td><td>" & .Rows(i)("no_of_tickets").ToString & "</td>")
						'buildstrexcel1.Append("</td><td>" & .Rows(i)("category").ToString & "</td>")
                        buildstrexcel1.Append("</td><td>" & .Rows(i)("ticket_type").ToString & "</td>")
                        buildstrexcel1.Append("</td><td>" & .Rows(i)("confirmation_code").ToString & "</td>")
                        If Session("type_of_user") <> 7  Then
                            buildstrexcel1.Append("</td><td>" & .Rows(i)("email").ToString & "</td>")
                            buildstrexcel1.Append("<td align=center>" & .Rows(i)("phone").ToString)
                            buildstrexcel1.Append("<td>" & .Rows(i)("booking_id").ToString & "</td>")
                            buildstrexcel1.Append("</td><td>" & .Rows(i)("total_price").ToString & "</td>")
                            buildstrexcel1.Append("</td><td>" & .Rows(i)("booking_timestamp").ToString & "</td>")
							buildstrexcel1.Append("</td><td>" & .Rows(i)("booked_date").ToString & "</td>")
							buildstrexcel1.Append("</td><td>" & .Rows(i)("booked_time").ToString & "</td>")
                            
                      Else
				If Session("user_id") = 27027 or Session("user_id") = 45435 or Session("user_id") = 16399 or Session("user_id") = 28372 or Session("user_id") = 15499 or Session("user_id") = 55135 Then
                            buildstrexcel1.Append("</td><td>" & .Rows(i)("email").ToString & "</td>")
							buildstrexcel1.Append("<td align=center>" & .Rows(i)("phone").ToString)
							buildstrexcel1.Append("</td><td>" & .Rows(i)("booked_date").ToString & "</td>")
							buildstrexcel1.Append("</td><td>" & .Rows(i)("booked_time").ToString & "</td>")
                            buildstrexcel1.Append("</td><td>" & .Rows(i)("booking_timestamp").ToString & "</td>")
                           Else
						    'buildstrexcel1.Append("</td><td>" & .Rows(i)("email").ToString & "</td>")
							'buildstrexcel1.Append("<td align=center>" & .Rows(i)("phone").ToString)
							buildstrexcel1.Append("</td><td>" & .Rows(i)("booked_date").ToString & "</td>")
							buildstrexcel1.Append("</td><td>" & .Rows(i)("booked_time").ToString & "</td>")
                            buildstrexcel1.Append("</td><td>" & .Rows(i)("booking_timestamp").ToString & "</td>")
						 End If
                        End If
                    Next
                Else
                    buildstrexcel1.Append("<tr><td colspan='2' align='center'> No Records Found</td>")
                End If
            End With
            buildstrexcel1.Append("</tr></table>")
            Response.Write(buildstrexcel1.ToString())
            Response.End()
        Catch ex As System.Threading.ThreadAbortException
        Catch ex As Exception
            Response.Write(ex.ToString)
        Finally
            con.Close()
            sqldata.Dispose()
            buildstrexcel1 = Nothing
        End Try
    End Sub



End Class
