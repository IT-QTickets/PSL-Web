Imports System.Data.SqlClient
Imports System.Xml.Linq
Imports System.Web
Imports System.Data
Imports System.IO
Imports Newtonsoft.Json.Linq
Imports System.Text
Imports System.Collections.Generic

Partial Class add_ajax
    Inherits System.Web.UI.Page
    Public Shared constr1 As String = ConfigurationManager.ConnectionStrings("qticketdbconnectionstring").ConnectionString
    Dim sqlcmd As New SqlCommand, conn As New SqlConnection(constr1)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Select Case Request("type").ToString
            Case "1"
                select_add()
            Case "2"
                Page_Load()
            Case "3"
                add_details()
        End Select
    End Sub
    Sub select_add()

        Dim da As SqlDataAdapter = New SqlDataAdapter
        Dim ds As New DataSet
        Dim Campaigns As StringBuilder = New StringBuilder
        Try
           
            sqlcmd = New SqlCommand("add_select", conn)
            With sqlcmd
                .CommandType = CommandType.StoredProcedure
                .Parameters.Add("@fromdate", SqlDbType.Date).Value = CDate(Request("fromdate"))
                .Parameters.Add("@todate", SqlDbType.Date).Value = CDate(Request("todate"))
                .Parameters.Add("@case", SqlDbType.Int).Value = Request("test")
            End With
            da.SelectCommand = sqlcmd
            da.Fill(ds)
            If ds.Tables.Count > 0 And ds.Tables(0).Rows.Count > 0 Then
                Campaigns.Append("<option value='ALL' selected='true'>ALL</option>")
                With ds.Tables(0)
                    For i As Integer = 0 To .Rows.Count - 1

                        Campaigns.Append("<option value='" & .Rows(i)(0).ToString() & "'>" & .Rows(i)(0).ToString() & "</option>")
                    Next
                End With
            Else
                Campaigns.Append("<option value='Nothing' selected='true'>No Add</option>")
            End If
            Response.Write(Campaigns)

        Catch ex As Exception
            Response.Write(ex.ToString())
        End Try
    End Sub
    Sub page_load()
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet
        Dim campaigns As New StringBuilder
        Try
            sqlcmd = New SqlCommand("Select distinct ad_name From advertizer_details with(nolock) where ad_name is not null and event_id is null and convert(date,GETDATE())  between Start_Date and end_date and convert(date, GETDATE())=Start_date", conn)
            da.SelectCommand = sqlcmd
            da.Fill(ds)
            If ds.Tables.Count > 0 And ds.Tables(0).Rows.Count > 0 Then
                campaigns.Append("<option value='all' selected='true'>ALL</option>")
                With ds.Tables(0)
                    For i As Integer = 0 To .Rows.Count - 1
                        campaigns.Append("<option value='" & .Rows(i)(0).ToString() & "'>" & .Rows(i)(0).ToString & "</option>")
                    Next
                End With
            Else
                campaigns.Append("<option value='Nothing'>No Add </option>")
            End If
            Response.Write(campaigns)
        Catch ex As Exception
            Response.Write(ex.ToString())

        End Try

    End Sub
    Sub add_details()
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet(), sqldata As SqlDataAdapter, res_str As String = ""
        Try
            sqlcmd = New SqlCommand("add_details", conn)
            With sqlcmd
                .CommandType = CommandType.StoredProcedure
                    .Parameters.Add("@status", SqlDbType.Int).Value = CType(Request("fun"), Integer)
                    .Parameters.Add("@fromdate", SqlDbType.Date).Value = CDate(Request("fromdate"))
                    .Parameters.Add("@todate", SqlDbType.Date).Value = CDate(Request("todate"))
            End With
            sqldata = New SqlDataAdapter(sqlcmd)
            sqldata.Fill(ds)
            With ds.Tables(0)
                For i As Integer = 0 To .Rows.Count - 1
                    If i = 0 Then
                        res_str += "{""slno"":""" & (i + 1).ToString()
                        res_str += """,""patner"":""" & .Rows.Item(i)("patner").ToString()
                        res_str += """,""client"":""" & .Rows.Item(i)("Client").ToString()
                        res_str += """,""campaigns"":""" + .Rows.Item(i)("Campaign").ToString()
                        res_str += """,""AdType"":""" + .Rows.Item(i)("ad_type").ToString()
                        res_str += """,""Ad_Unit"":""" + .Rows.Item(i)("width").ToString() + " x " + .Rows.Item(i)("height").ToString()
                        res_str += """,""Month"":""" + .Rows.Item(i)("Month").ToString()
                        res_str += """,""Start_Date"":""" + .Rows.Item(i)("Start_Date").ToString()
                        res_str += """,""io"":""" + .Rows.Item(i)("Io").ToString()
                        res_str += """,""end_date"":""" + .Rows.Item(i)("End_Date").ToString()
                        res_str += """,""total_days"":""" + .Rows.Item(i)("Total-Days").ToString()
                        res_str += """,""impressions_booked"":""" + .Rows.Item(i)("Impressions-Booked").ToString()
                        res_str += """,""IMB_day"":""" + .Rows.Item(i)("IMB-Day").ToString()
                        res_str += """,""impressions_delivered"":""" + .Rows.Item(i)("Impressions-Delivered").ToString()
                        res_str += """,""Total_Click"":""" + .Rows.Item(i)("Total_ClickS").ToString()
                        res_str += """,""status"":""" + .Rows.Item(i)("Status").ToString() + """}"
                    Else
                        res_str += ",{""slno"":""" & (i + 1).ToString()
                        res_str += """,""patner"":""" & .Rows.Item(i)("patner").ToString()
                        res_str += """,""client"":""" & .Rows.Item(i)("Client").ToString()
                        res_str += """,""campaigns"":""" + .Rows.Item(i)("Campaign").ToString()
                        res_str += """,""AdType"":""" + .Rows.Item(i)("ad_type").ToString()
                        res_str += """,""Ad_Unit"":""" + .Rows.Item(i)("width").ToString() + " x " + .Rows.Item(i)("height").ToString()
                        res_str += """,""Month"":""" + .Rows.Item(i)("Month").ToString()
                        res_str += """,""Start_Date"":""" + .Rows.Item(i)("Start_Date").ToString()
                        res_str += """,""io"":""" + .Rows.Item(i)("Io").ToString()
                        res_str += """,""end_date"":""" + .Rows.Item(i)("End_Date").ToString()
                        res_str += """,""total_days"":""" + .Rows.Item(i)("Total-Days").ToString()
                        res_str += """,""impressions_booked"":""" + .Rows.Item(i)("Impressions-Booked").ToString()
                        res_str += """,""IMB_day"":""" + .Rows.Item(i)("IMB-Day").ToString()
                        res_str += """,""impressions_delivered"":""" + .Rows.Item(i)("Impressions-Delivered").ToString()
                        res_str += """,""Total_Click"":""" + .Rows.Item(i)("Total_ClickS").ToString()
                        res_str += """,""status"":""" + .Rows.Item(i)("Status").ToString() + """}"
                    End If
                Next
            End With
            HttpContext.Current.Response.Write("{""items"":[" & res_str & "]}")
        Catch ex As Exception
            HttpContext.Current.Response.Write(ex.ToString())
        Finally
            sqlcmd.Dispose()
            ds.Dispose()
            sqldata.Dispose()
        End Try

    End Sub
End Class
