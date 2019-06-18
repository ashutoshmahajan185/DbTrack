<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inbox.aspx.cs" Inherits="inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Inbox
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="module message">
        <div class="module-head">
            <h3>Inbox
            </h3>
        </div>
    </div>


    <div class="module-option clearfix">

        <div class="pull-left">

            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Search" class="btn btn-primary" OnClick="Button2_Click" />

        </div>

        <div class="pull-right">
            <asp:Button ID="Button1" runat="server" Text="Compose Mail" class="btn btn-primary" OnClick="Button1_Click1" />
        </div>
    </div>

    <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="datatable table table-bordered table-striped display" AutoGenerateColumns="False" AllowPaging="True" OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource1" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="m_subject" HeaderText="m_subject" SortExpression="m_subject" />
            <asp:BoundField DataField="m_content" HeaderText="m_content" SortExpression="m_content" />
            <asp:BoundField DataField="m_from" HeaderText="m_from" SortExpression="m_from" />
            <asp:BoundField DataField="m_date" HeaderText="m_date" SortExpression="m_date" />
            <asp:BoundField DataField="m_time" HeaderText="m_time" SortExpression="m_time" />
            <asp:BoundField DataField="m_read" HeaderText="m_read" SortExpression="m_read" />
            <asp:CommandField SelectText="View Details" ShowSelectButton="True" />
        </Columns>

    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [m_subject], [m_content], [m_from], [m_date], [m_time], [m_read] FROM [Mail] WHERE ([m_to] = @m_to) ORDER BY [m_date] DESC, [m_time] DESC" FilterExpression=" [m_from] LIKE '%{0}%' OR [m_subject] LIKE '{0}' OR [m_content] LIKE '%{0}%'">
        <SelectParameters>
            <asp:SessionParameter Name="m_to" SessionField="User_Name" Type="String" />
        </SelectParameters>
        <FilterParameters>
            <asp:ControlParameter Name="Search : " ControlID="TextBox4" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>
</asp:Content>

