Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class GetUserSupport
    Inherits System.Web.UI.Page

    Public constr As String = "Persist Security Info=False;User ID=QTAdmin;Password=NIMDATEKCITQ;Initial Catalog=qticket;Data Source=172.31.63.72;Min Pool Size=10;Max Pool Size=200"
    Public BookingIDbyBID As String
    Public TktPriceID As String
    Public ZoneName As String


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("select * from event_booking_info where booking_id=" + txtBookingID.ToString() + "")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        GridBookingInfp.DataSource = ds.Tables(0)
                        GridBookingInfp.DataBind()
                        BookingIDbyBID = ds.Tables(0).Rows(1)("booking_id").ToString()

                    End Using
                End Using
            End Using
        End Using
        GridBookingInfp.Visible = True
        '-----------


        ' Next 

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("select * from event_booking_info where booking_id=" + txtBookingID.ToString())
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        GridBookingInfp.DataSource = ds.Tables(0)
                        GridBookingInfp.DataBind()
                        TktPriceID = ds.Tables(0).Rows(1)("ticket_price_id").ToString()
                    End Using
                End Using
            End Using
        End Using
        ' NEXT


        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(" select * from event_ticket_price where id=" + TktPriceID)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        GridBookingInfp.DataSource = ds.Tables(0)
                        GridBookingInfp.DataBind()
                        ZoneName = ds.Tables(0).Rows(1)("Ticketname").ToString()
                    End Using
                End Using
            End Using
        End Using

        lblZone.Text = ZoneName




    End Sub
    Protected Sub ConfCode_Click(sender As Object, e As EventArgs) Handles ConfCode.Click

    End Sub
    Protected Sub Email_Click(sender As Object, e As EventArgs) Handles Email.Click

    End Sub

End Class
