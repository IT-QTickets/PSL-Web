
Partial Class index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Session("user_id_psl") Is Nothing) Then
            Session.Remove("user_id_psl")
			Session.Remove("UserType")
        End If		
    End Sub

End Class
