<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="transferAV.aspx.cs" Inherits="transferAV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Transfer Cases Application/Verification
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="media stream">

        <div class="module message">
            <div class="module-head">
                <h3>Transfer Application-Verification

                </h3>
            </div>
        </div>

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
            </div>

            <div class="control-group">

                <asp:Label ID="Label1" class="control-label" runat="server" Text="R.I No : "></asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server" type="text" ID="TextBox1" class="span8" />
                    <!--- <span class="help-inline">Minimum 5 Characters</span> -->
                </div>
            </div>


            <div class="control-group">
                <label class="control-label" for="basicinput">Transfered On :</label>
                <div class="controls">
                    <asp:TextBox runat="server" type="text" ID="TextBox3" class="span8" Height="22px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="Button2" runat="server" Text="Use Calendar" class="btn btn-primary" OnClick="Button2_Click" />
                    &nbsp;
                                                 <br />

                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="basicinput">New EmpID :</label>
                <div class="controls">
                    <asp:TextBox runat="server" type="text" ID="TextBox2" class="span8" />
                    &nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
            </div>
            <br />
            <br />
            <asp:Button ID="Button1" class="btn btn-primary pull-center" Width="75px" Style="margin-left: 113px" runat="server" OnClick="Button1_Click" Text="Transfer" />

        </div>
    </div>
</asp:Content>

