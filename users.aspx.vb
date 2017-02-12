
Partial Class users
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user_id") Is Nothing Then
            Response.Redirect("index.aspx")
        End If
		
		 If Session("user_id_psl") ="73" Then
				   Server.Transfer("index.aspx")
end if

        Select Case Session("type_of_user")
            Case 9, 5, 4
                'Response.Redirect("home.aspx")
            Case 6
                Response.Redirect("Search_Details.aspx")
            Case 3
                Response.Redirect("movies.aspx")
            Case 2
                Response.Redirect("booking_cinema.aspx")
			Case 11
				Response.Redirect("/ClientApiPayments.aspx")
			Case 7
				Response.Redirect("event_bookings_list.aspx")
			Case 10
				Response.Redirect("booking_cinema.aspx")
        End Select
    End Sub

End Class
