<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="change.aspx.cs" Inherits="change" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Change Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="module message">
        <div class="module-head">
            <h3>Change Password
            </h3>
        </div>
    </div>
    <div class="module content">
        <div class="module-head">
            <br />
            <div class="control-group">

                <label class="control-label" for="basicinput">Old Password :</label>
                <div class="controls">

                    <asp:TextBox ID="TextBox1" runat="server" type="password" class="span8"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Old Password is Required" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                </div>


                <label class="control-label" for="basicinput">New Password :</label>
                <div class="controls">

                    <asp:TextBox ID="TextBox2" runat="server" type="password" class="span8"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*New Password is Required" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                </div>


                <label class="control-label" for="basicinput">Confirm New Password :</label>
                <div class="controls">

                    <asp:TextBox ID="TextBox3" runat="server" type="password" class="span8"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*New Password is Required" ForeColor="Red" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                    <br />
                    <br />

                </div>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <div class="modal-footer">
                    <div class="control-group">
                        <asp:Button ID="Button1" runat="server" Text="Change Password" class="btn btn-primary pull-left" OnClick="Send_Click" />
                        <asp:Button ID="Button2" runat="server" Text="Discard" data-dismiss="modal" class="btn btn-danger pull-right"
                            OnClick="Discard_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

