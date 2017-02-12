Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Configuration
Imports Microsoft.VisualBasic
Partial Class login_Default
    Inherits System.Web.UI.Page
    Public username As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        username = Request("username")
        Dim password As String = Request("password")
        Dim constr As String = ConfigurationManager.ConnectionStrings("qticketdbconnectionstring").ConnectionString
        Dim sqlcmd As SqlCommand, conn As New SqlConnection(constr)
        Dim result As Integer
        Dim msg As String = ""

         Try
            sqlcmd = New SqlCommand("Admin_logincheck_psl_offline", conn)
            sqlcmd.CommandType = CommandType.StoredProcedure
            If username Is Nothing Or password Is Nothing Or username = "" Or password = "" Then
                Response.Redirect("/psl_offline/psllogin.aspx")
            End If

            With sqlcmd
                .CommandTimeout = 0
                .Parameters.Add("@email_id", SqlDbType.VarChar, 50)
                .Parameters("@email_id").Direction = ParameterDirection.Input
                .Parameters("@email_id").Value = LCase(username)

                .Parameters.Add("@password", SqlDbType.VarChar, 20)
                .Parameters("@password").Direction = ParameterDirection.Input
                .Parameters("@password").Value = password

                .Parameters.Add("@valid_msg", SqlDbType.VarChar, 50)
                .Parameters("@valid_msg").Direction = ParameterDirection.Output

                .Parameters.Add("@valid_result", SqlDbType.Int)
                .Parameters("@valid_result").Direction = ParameterDirection.Output

                .Parameters.Add("@user_name", SqlDbType.VarChar, 50)
                .Parameters("@user_name").Direction = ParameterDirection.Output

                .Parameters.Add("@user_id", SqlDbType.Int)
                .Parameters("@user_id").Direction = ParameterDirection.Output

                .Parameters.Add("@UserType", SqlDbType.VarChar,50).Direction = ParameterDirection.Output
				
				
                conn.Open()
                .ExecuteNonQuery()
                conn.Close()

                result = .Parameters("@valid_result").Value
                msg = .Parameters("@valid_msg").Value
            End With
			  Response.Write(result)
            If result = 3 Then
               
			   Session("username") = sqlcmd.Parameters("@user_name").Value
                    Session("user_id_psl") = sqlcmd.Parameters("@user_id").Value
                    Session("UserType") = sqlcmd.Parameters("@UserType").Value
					
					
					 
                          If sqlcmd.Parameters("@user_id").Value ="73" Then
				   Response.Redirect("/psl/Merchant_Admin.aspx")
					
					else   If sqlcmd.Parameters("@user_id").Value ="86" Then
				    Response.Redirect("/psl/Merchant_wa.aspx")
					
					else  If sqlcmd.Parameters("@user_id").Value ="87" Then
				    Response.Redirect("/psl/Merchant_ba.aspx")
					
					else  If sqlcmd.Parameters("@user_id").Value ="89" Then
				    Response.Redirect("/psl/Merchant_AJ.aspx")
					
					else  If sqlcmd.Parameters("@user_id").Value ="93" Then
				    Response.Redirect("/psl/Merchant_LE.aspx")
					
					 else If sqlcmd.Parameters("@user_id").Value = "42" or sqlcmd.Parameters("@user_id").Value = "45" or sqlcmd.Parameters("@user_id").Value = "48" or sqlcmd.Parameters("@user_id").Value = "49" or sqlcmd.Parameters("@user_id").Value = "50" or sqlcmd.Parameters("@user_id").Value = "51" or sqlcmd.Parameters("@user_id").Value = "52" or sqlcmd.Parameters("@user_id").Value = "53" or sqlcmd.Parameters("@user_id").Value = "54" or sqlcmd.Parameters("@user_id").Value = "55" or sqlcmd.Parameters("@user_id").Value = "56" or sqlcmd.Parameters("@user_id").Value = "57" or sqlcmd.Parameters("@user_id").Value = "58" or sqlcmd.Parameters("@user_id").Value = "59" or sqlcmd.Parameters("@user_id").Value = "61" or sqlcmd.Parameters("@user_id").Value = "62" or sqlcmd.Parameters("@user_id").Value = "63" or sqlcmd.Parameters("@user_id").Value = "64" or sqlcmd.Parameters("@user_id").Value = "27" or sqlcmd.Parameters("@user_id").Value = "30" or sqlcmd.Parameters("@user_id").Value = "32" or sqlcmd.Parameters("@user_id").Value = "34" or sqlcmd.Parameters("@user_id").Value = "35" or sqlcmd.Parameters("@user_id").Value = "36" Then
				   Response.Redirect("/psl/index.aspx")
					
					
                  else If sqlcmd.Parameters("@user_id").Value <> "94" and sqlcmd.Parameters("@user_id").Value <> "20" and sqlcmd.Parameters("@user_id").Value <> "39" and sqlcmd.Parameters("@user_id").Value <> "75" and sqlcmd.Parameters("@user_id").Value <> "81" and sqlcmd.Parameters("@user_id").Value <> "82" and sqlcmd.Parameters("@user_id").Value <> "83" Then
				   Response.Redirect("/psl/merchantbookingshome_list.aspx")
				   
				 
									
				   
					else	

					
					Response.Redirect("/psl/home.aspx")
					
					
					End IF
                        
               
						 
               
            Else
              
			  
				  Response.Write(msg)
                    Response.Redirect("/psl/index.aspx?msg=" & msg)
             
            End If
        Catch ex As Exception
            Response.Write(ex.ToString())
        End Try
    End Sub
End Class
