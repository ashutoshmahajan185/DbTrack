<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="update.aspx.cs" Inherits="update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Application Verification
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
     <div class="module message">
                            <div class="module-head">
                                <h3>Application & Verification
                                </h3>
                            </div>
                        </div>

                        <div class="pull-right">
                            <div class="module-head">
                               <a href="adminlogin.aspx" class='btn btn-danger'> Verification Admin</a>
                            </div>
                        </div>

                        <div class="module content">
                            <div class="module-head">

                                <div class="control-group">

                                    <label class="control-label" for="basicinput">Case Type :</label>
                                    <div class="controls">

                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                            <asp:ListItem Selected="True" Value="-1" Text="select">---SELECT---</asp:ListItem>
                                            <asp:ListItem>Application</asp:ListItem>
                                            <asp:ListItem>Verification</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <br />
                                    <label class="control-label" for="basicinput">RI No. :</label>
                                    <div class="controls">

                                        <asp:TextBox ID="TextBox15" runat="server" class="span8"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required Field" ControlToValidate="TextBox15" ForeColor="Red"></asp:RequiredFieldValidator>
                                         <br />
                                        <br />
                                    </div>


                                    <label class="control-label" for="basicinput">Applicant :</label>
                                    <div class="controls">

                                        <asp:TextBox ID="TextBox16" runat="server" class="span8"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Required Field"  ControlToValidate="TextBox16" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </div>


                                    <label class="control-label" for="basicinput">Non-Applicant :</label>
                                    <div class="controls">

                                        <asp:TextBox ID="TextBox19" runat="server" class="span8"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Required Field"  ControlToValidate="TextBox19" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </div>


                                    <label class="control-label" for="basicinput">Recieved Date :</label>
                                    <div class="controls">

                                        <asp:TextBox ID="TextBox20" runat="server" class="span8"></asp:TextBox>
                                        <asp:Label ID="Label15" runat="server" ForeColor="#3333FF" Text="MM/DD/YYYY"></asp:Label>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Required Field"  ControlToValidate="TextBox20" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        
                                        <br />

                                    </div>

                                    <label class="control-label" for="basicinput">Mark Date :</label>
                                    <div class="controls">
                                        <asp:TextBox runat="server" type="text" ID="TextBox11" class="span8" />
                                        <asp:Label ID="Label11" runat="server" ForeColor="#3333FF" Text="MM/DD/YYYY"></asp:Label>

                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Required Field"  ControlToValidate="TextBox11" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <br />
                                        
                                        
                                        <br />
                                    </div>

                                    <label class="control-label" for="basicinput">Brief Facts :</label>
                                    <div class="controls">

                                        <asp:TextBox ID="TextBox21" runat="server" class="span8"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Required Field"  ControlToValidate="TextBox21" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <br />
                                        <br />
                                    </div>

                                    <label class="control-label" for="basicinput">Status :</label>
                                    <div class="controls">

                                        <asp:TextBox ID="TextBox22" runat="server" class="span8"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="* Required Field"  ControlToValidate="TextBox22" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </div>

                                    <label class="control-label" for="basicinput">Empid :</label>
                                    <div class="controls">

                                        <asp:TextBox ID="TextBox23" runat="server" class="span8"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="* Required Field"  ControlToValidate="TextBox23" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </div>

                                    <label class="control-label" for="basicinput">Remarks :</label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox24" runat="server" class="span8"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="* Required Field"  ControlToValidate="TextBox24" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </div>

                                    <label class="control-label" for="basicinput">Department Name :</label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox1" runat="server" class="span8"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="* Required Field"  ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                        <br />
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="control-group">
                                    <div class="controls">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                    <asp:Button ID="Button1" runat="server" Text="Register" class="btn btn-primary pull-left" OnClick="Send_Click" />
                                    <asp:Button ID="Button2" runat="server" Text="Discard" class="btn btn-danger pull-right" OnClick="Discard_Click" />
                                </div>

                            </div>
                            </div>

</asp:Content>

