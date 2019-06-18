<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_alerts.aspx.cs" Inherits="admin_alerts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Verification Admin Alerts
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
                                           
                                            <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Ver_no" DataValueField="Ver_no">
                                            </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Ver_no] FROM [Verification_Admin]"></asp:SqlDataSource>

                    <% for (int i = 0; i < 60; i++)
                       { %>
                                            &nbsp; <% }%>
                    
                    <asp:Button ID="alerts" runat="server" Text="Alerts" OnClick="alerts_Click" class="btn btn-danger" />
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

