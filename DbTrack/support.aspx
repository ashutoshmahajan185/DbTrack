<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="support.aspx.cs" Inherits="support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Support
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="module message">
        <div class="module-head">
            <h3>Technical Team

            </h3>
        </div>
    </div>


    <br />
    <br />

    <div class="module message">
        <div class="module-body">

            <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="datatable table table-bordered table-striped display" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Contact No" HeaderText="Contact No" SortExpression="Contact No" />
                    <asp:BoundField DataField="Email_1" HeaderText="Email_1" SortExpression="Email_1" />
                    <asp:BoundField DataField="Email_2" HeaderText="Email_2" SortExpression="Email_2" />
                </Columns>
                <RowStyle BackColor="#EFF3FB" />
                <EditRowStyle Width="100%" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT * FROM [Support]"></asp:SqlDataSource>

        </div>
    </div>
    <br />
</asp:Content>

