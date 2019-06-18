<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reports.aspx.cs" Inherits="reports" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms,
Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"
namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Reports
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="content">
        <div class="module message">
            <div class="module-head">
                <h3>Reports

                </h3>
            </div>
        </div>
        <div class="pull-left">
            <asp:DropDownList ID="DropDownList1" runat="server" Height="35px" Width="150px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ViewStateMode="Enabled">
                <asp:ListItem>Overall</asp:ListItem>
                <asp:ListItem>All Cases</asp:ListItem>
                <asp:ListItem>Case Details(Case no)</asp:ListItem>
                <asp:ListItem>Employee Details</asp:ListItem>
                <asp:ListItem>Application</asp:ListItem>
                <asp:ListItem>Verification</asp:ListItem>

            </asp:DropDownList>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Filter" CssClass="btn " BorderColor="Black" />
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:reportviewer id="ReportViewer1" runat="server" onload="Report_Load" SizeToReportContent="False">
                                </rsweb:reportviewer>
    </div>
</asp:Content>

