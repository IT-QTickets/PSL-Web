
Partial Class home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user_id_psl") Is Nothing Then
            Response.Redirect("index.aspx")
        End If
		
If Session("user_id_psl") <> "94" and Session("user_id_psl") <> "20" and Session("user_id_psl") <> "39" and Session("user_id_psl") <> "75" and Session("user_id_psl") <> "81" and Session("user_id_psl") <> "82" and Session("user_id_psl") <> "83" Then
 Server.Transfer("index.aspx")
End IF
        
    End Sub

End Class
