
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="addusers.aspx.vb" Inherits="addusers" MasterPageFile="MasterPage.master"  %>

<asp:Content ContentPlaceHolderId="html_body" runat="server">
  
<div id="content">
<div id="content-header">
  <div id="breadcrumb"> <a href="index.html" class="tip-bottom" data-original-title="Go to Home"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom" data-original-title="">List Users</a> <a href="#" class="current">Add Users</a> </div>
  <h1>Add Users</h1>
</div>
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
  <div class="span3"></div>
  <div class="span6">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>Personal-info</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="#" method="get" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">First Name :</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="First name">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Last Name :</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Last name">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Password input</label>
              <div class="controls">
                <input type="password" class="span11" placeholder="Enter Password">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Company info :</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Company name">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Description field:</label>
              <div class="controls">
                <input type="text" class="span11">
                <span class="help-block">Description field</span> </div>
            </div>
            <div class="control-group">
              <label class="control-label">Message</label>
              <div class="controls">
                <textarea class="span11"></textarea>
              </div>
            </div>
            <div class="form-actions" style="    text-align: center;">
              <button type="submit" class="btn btn-success">Save</button>
			  <a href="users.aspx" class="btn btn-warning">Cancel</a>
            </div>
          </form>
        </div>
      </div>
     </div>
    
<div class="span3"></div>
	</div>
 </div></div>


</asp:Content>