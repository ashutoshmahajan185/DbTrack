<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="task.aspx.cs" Inherits="task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Alerts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="content">
        <div class="module message">
            <div class="module-head">
                <h3>Alerts</h3>

            </div>

            <div class="pull-left">
                <p>
                    &nbsp;&nbsp;&nbsp; Filter : &nbsp;
                                           
                                            <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Ver_no" DataValueField="Ver_no" Visible="False" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                                            </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Ver_no] FROM [Verification_Admin]"></asp:SqlDataSource>

                    <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="120px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" ViewStateMode="Enabled">
                        <asp:ListItem>ALL</asp:ListItem>
                        <asp:ListItem>Trap</asp:ListItem>
                        <asp:ListItem>DPA</asp:ListItem>
                        <asp:ListItem>MC</asp:ListItem>
                        <asp:ListItem>ED</asp:ListItem>
                        <asp:ListItem>OE</asp:ListItem>
                        <asp:ListItem>Application</asp:ListItem>
                        <asp:ListItem>Verification</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="User_Name" DataValueField="User_Name" Height="30px" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" ViewStateMode="Enabled">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [User_Name] FROM [Employee]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Case_no" DataValueField="Case_no" Height="30px" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" ViewStateMode="Enabled">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Case_no] FROM [Case]
UNION
SELECT RI_no FROM Application
UNION
SELECT RI_no FROm Verification"></asp:SqlDataSource>
                    <% for (int i = 0; i < 30; i++)
                       { %>
                                            &nbsp; <% }%>
                     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text=" Verification admin Alerts" class='btn btn-danger' />
                </p>
            </div>

            <table class="table table-message">
                <tbody>
                    <tr class="heading">
                        <td class="cell-icon"></td>
                        <td class="cell-title">Case</td>
                        <td class="cell">Due Date </td>
                        <td class="cell-status hidden-phone hidden-tablet">Status</td>
                    </tr>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </tbody>
            </table>
        </div>

    </div>

</asp:Content>

