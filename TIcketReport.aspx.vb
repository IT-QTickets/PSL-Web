Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class TIcketReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
	
	 If Session("user_id_psl") ="73" Then
				   Server.Transfer("index.aspx")
end if
	
        If Not Me.IsPostBack Then
            Dim constr As String = "Data Source=Persist Security Info=False;User ID=sa;Password=Qtickets@DB1973;Initial Catalog=pslticket;Data Source=172.31.63.72;Min Pool Size=10;Max Pool Size=200"
            Dim query As String = "SELECT t1.Date,t1.Match,t1.BlockNo,count(t2.IsPrinted) TotalPrinted,count(t2.IsAdmitted) TotalAdmitted  FROM Ticket_MasterStatus t1 join BarcodeMaster t2 on t2.Ticket_Master_SNo=t1.Sno   group by t1.Date,t1.Match,t1.BlockNo"
            'query += "SELECT TOP 10 (FirstName + ' ' + LastName) EmployeeName, City, Country  FROM Employees"

            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand(query)
                    Using sda As New SqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Using ds As New DataSet()
                            sda.Fill(ds)
                            gridview1.DataSource = ds.Tables(0)
                            gridview1.DataBind()
                            'gvEmployees.DataSource = ds.Tables(1)
                            'gvEmployees.DataBind()
                        End Using
                    End Using
                End Using
            End Using
        End If
    End Sub

End Class
