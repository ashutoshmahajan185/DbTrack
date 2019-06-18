<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="module message">
        <div class="module-head">
            <h3>
                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            </h3>
        </div>
    </div>
    <div class="pull-center">
        <center>
                            <asp:Chart ID="Chart1" runat="server" Height="350px" Width="350px" BackColor="Transparent">
                                            <Series>
                                                <asp:Series ChartType="Pie" Name="Series1" ChartArea="ChartArea1" IsValueShownAsLabel="true" >
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true"  Area3DStyle-Inclination="30" Area3DStyle-IsClustered="false" BackColor="Transparent">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                      </center>
    </div>
    <br />
    &nbsp 
                           <table class="datatable table table-bordered table-striped display" style="width: 100%">
                               <tr style="width=100%">
                                   <td style="width: 20%">CaseNo:<br />
                                       <asp:TextBox ID="Case_no" runat="server" Width="100" />
                                   </td>

                                   <td style="width: 26.5%">CaseType:<br />
                                       <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true">
                                           <asp:ListItem Selected="True" Value="-1" Text="select">---SELECT---</asp:ListItem>
                                           <asp:ListItem>Trap</asp:ListItem>
                                           <asp:ListItem>DPA</asp:ListItem>
                                           <asp:ListItem>MC</asp:ListItem>
                                           <asp:ListItem>OE</asp:ListItem>
                                           <asp:ListItem>ED</asp:ListItem>
                                           <asp:ListItem>Application</asp:ListItem>
                                           <asp:ListItem>Verification</asp:ListItem>
                                       </asp:DropDownList>
                                   </td>

                                   <td style="width: 19%">Empid:<br />
                                       <asp:TextBox ID="empid" runat="server" Width="100" />
                                   </td>

                                   <td style="width: 23%">Dept.Name:<br />
                                       <asp:TextBox ID="Department" runat="server" Width="100" />
                                   </td>

                                   <td style="width: 31%">
                                       <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click2" CssClass="btn btn-info" />
                                   </td>
                               </tr>
                           </table>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="table table-bordered table-striped" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Case_no" DataSourceID="SqlDataSource1" EmptyDataText="No Cases are Currently Assigned" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="Case_no" HeaderText="Case_no" ReadOnly="True" SortExpression="Case_no" />
            <asp:BoundField DataField="Case_type" HeaderText="Case_type" SortExpression="Case_type" />
            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
            <asp:CommandField SelectText="View_Details" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Case_no], [Case_type], [empid], [Department] FROM [Case] WHERE ([empid] = @empid)" FilterExpression="Case_no LIKE '%{0}%' OR Case_type LIKE '{1}' OR Department LIKE '%{2}%' ">
        <SelectParameters>
            <asp:SessionParameter Name="empid" SessionField="empid" Type="String" />
        </SelectParameters>
        <FilterParameters>
            <asp:ControlParameter Name="Case_No : " ControlID="Case_no" PropertyName="Text" />
            <asp:ControlParameter Name="Case_type :" ControlID="DropDownList1" PropertyName="Text" />
            <asp:ControlParameter Name="Department : " ControlID="Department" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView2" runat="server" Width="100%" CssClass="datatable table table-bordered table-striped display" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Case_no" DataSourceID="SqlDataSource2" EmptyDataText="No Cases are Currently Assigned">
        <Columns>
            <asp:BoundField DataField="Case_no" HeaderText="Case_no" ReadOnly="True" SortExpression="Case_no" />
            <asp:BoundField DataField="Case_type" HeaderText="Case_type" SortExpression="Case_type" />
            <asp:BoundField DataField="empid" HeaderText="empid" SortExpression="empid" />
            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
            <asp:CommandField SelectText="View_Details" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Case_no], [Case_type], [empid], [Department] FROM [Case]" FilterExpression="Case_no LIKE '%{0}%' OR empid LIKE '{1}' OR Case_type LIKE '%{2}%' OR Department LIKE '%{3}%' ">
        <FilterParameters>
            <asp:ControlParameter Name="Case_No : " ControlID="Case_no" PropertyName="Text" />
            <asp:ControlParameter Name="EmpId : " ControlID="empid" PropertyName="Text" />
            <asp:ControlParameter Name="Case_type :" ControlID="DropDownList1" PropertyName="Text" />
            <asp:ControlParameter Name="Department : " ControlID="Department" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>

