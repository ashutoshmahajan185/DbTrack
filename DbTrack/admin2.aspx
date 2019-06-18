<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin2.aspx.cs" Inherits="admin2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Admin
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="module message">
        <div class="module-head">
            <h3>Admin Update Panel</h3>

        </div>
    </div>


    <div class="module-option clearfix">
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Employee</asp:ListItem>
            <asp:ListItem>Case</asp:ListItem>
            <asp:ListItem>Trap</asp:ListItem>
            <asp:ListItem>DPA</asp:ListItem>
            <asp:ListItem>MC</asp:ListItem>
            <asp:ListItem>OE</asp:ListItem>
            <asp:ListItem>ED</asp:ListItem>
        </asp:DropDownList>
        &nbsp
                                    <asp:Button ID="Button4" runat="server" Text="Get Table" OnClick="Button4_Click" CssClass="btn btn-danger" />



        <div class="pull-right">
            <asp:Button ID="Button1" runat="server" Text="Application & Verification" CssClass="btn btn-primary" OnClick="Button1_Click1" />
            &nbsp
                                              <asp:Button ID="Button2" runat="server" Text="Assign Case" CssClass="btn btn-primary" OnClick="Button2_Click" />
            <asp:Button ID="Button5" runat="server" Text="Transfer Case" CssClass="btn btn-primary" OnClick="Button5_Click" />
            <asp:Button ID="Button6" runat="server" Text="Transfer A/V Cases" CssClass="btn btn-primary" OnClick="Button6_Click" />
        </div>
    </div>


    <br />

    <table class="datatable table table-bordered table-striped display" style="width: 100%">
        <tr>
            <td style="width: 150px">Empid:<br />
                <asp:TextBox ID="empid" runat="server" Width="100" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* empid Required" ValidationGroup="val1" ControlToValidate="empid" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>

            <td style="width: 150px">User_Name:<br />
                <asp:TextBox ID="User_Name" runat="server" Width="100" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* UserName Required" ValidationGroup="val1" ControlToValidate="User_Name" ForeColor="Red"></asp:RequiredFieldValidator>

            </td>

            <td style="width: 150px">Password:<br />
                <asp:TextBox ID="Password" type="Password" runat="server" Width="100" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Password Required" ValidationGroup="val1" ControlToValidate="Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>

            <td style="width: 150px">Designation:<br />
                <asp:DropDownList ID="Designation" runat="server">
                    <asp:ListItem>ACP</asp:ListItem>
                    <asp:ListItem>ADCP</asp:ListItem>
                    <asp:ListItem>DG</asp:ListItem>
                    <asp:ListItem>PI</asp:ListItem>
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Designation Required" ValidationGroup="val1" ControlToValidate="Designation" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 150px">Role:<br />
                <asp:TextBox ID="Role" runat="server" Width="100" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Role Required" ValidationGroup="val1" ControlToValidate="Role" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 100px">
                <asp:Button ID="Button3" runat="server" Text="Add" ValidationGroup="val1" OnClick="OnClick_Insert" Width="68px" CssClass="btn btn-danger" />
            </td>
        </tr>
    </table>
    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <div class="module message">
        <div class="module-head">
            <h3><% =table %> Table</h3>

        </div>
    </div>
    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" Width="100%" CssClass="datatable table table-bordered table-striped display" EmptyDataText="No records has been added." AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="empid" DataSourceID="SqlDataSource1" Visible="False">
        <Columns>

            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="empid" HeaderText="empid" ReadOnly="True" SortExpression="empid">
                <ControlStyle Width="150" />
            </asp:BoundField>

            <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name">
                <ControlStyle Width="150" />
            </asp:BoundField>

            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" ReadOnly="True">
                <ControlStyle Width="150" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Designation" SortExpression="Designation">
                <EditItemTemplate>
                    <asp:DropDownList ID="Designation" runat="server" Text='<%# Bind("Designation") %>'>

                        <asp:ListItem>ACP</asp:ListItem>
                        <asp:ListItem>ADCP</asp:ListItem>
                        <asp:ListItem>DG</asp:ListItem>
                        <asp:ListItem>PI</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="150px" />
            </asp:TemplateField>
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role">
                <ControlStyle Width="115" />
            </asp:BoundField>
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle Width="100%" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>





    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="Update [Employee] SET User_Name=@User_Name,Designation=@Designation,Role=@Role where empid=@empid" DeleteCommand="Delete from [Case] where empid=@empid;Delete from [Employee] where empid=@empid" InsertCommand="INSERT INTO [Employee] VALUES (@empid, @User_Name,@Password,@Designation,@Role)" OnSelecting="SqlDataSource1_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="empid" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter Name="empid" ControlID="empid" Type="String" />
            <asp:ControlParameter Name="User_Name" ControlID="User_Name" Type="String" />
            <asp:ControlParameter Name="Password" ControlID="Password" Type="String" />
            <asp:ControlParameter Name="Designation" ControlID="Designation" Type="String" />
            <asp:ControlParameter Name="Role" ControlID="Role" Type="String" />
        </InsertParameters>


        <UpdateParameters>
            <asp:Parameter Name="User_Name" />
            <asp:Parameter Name="Designation" />
            <asp:Parameter Name="Role" />
            <asp:Parameter Name="empid" />
        </UpdateParameters>


    </asp:SqlDataSource>


    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" Width="100%" CssClass="datatable table table-bordered table-striped display" EmptyDataText="No records has been added." AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="Case_no" Visible="False">


        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Case_no" HeaderText="Case_no" ReadOnly="True" SortExpression="Case_no" />
            <asp:BoundField DataField="empid" HeaderText="empid" SortExpression="empid" />
            <asp:BoundField DataField="Case_type" HeaderText="Case_type" SortExpression="Case_type" />
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle Width="100%" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT * FROM [Case]" UpdateCommand="Update [Case] SET empid=@empid,Case_type=@Case_type where Case_no=@Case_no" DeleteCommand="Delete from [Case] where Case_no=@Case_no"></asp:SqlDataSource>

    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" Width="100%" CssClass="datatable table table-bordered table-striped display" EmptyDataText="No records has been added." AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Visible="False" DataKeyNames="Case_no">



        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Case_no" HeaderText="Case_no" ReadOnly="True" SortExpression="Case_no" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
            <asp:BoundField DataField="C_Status" HeaderText="C_Status" SortExpression="C_Status" />
            <asp:BoundField DataField="ext" HeaderText="Extension" SortExpression="ext" />
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle Width="100%" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>



    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Case_no], [Remarks], [C_Status],[ext] FROM [Trap]" UpdateCommand="Update [Trap] SET Remarks=@Remarks,C_Status=@C_Status,ext=@ext where Case_no=@Case_no" DeleteCommand="Delete from [Trap] where Case_no=@Case_no"></asp:SqlDataSource>

    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" Width="100%" CssClass="datatable table table-bordered table-striped display" EmptyDataText="No records has been added." AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Visible="False" DataKeyNames="Case_no">



        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Case_no" HeaderText="Case_no" ReadOnly="True" SortExpression="Case_no" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
            <asp:BoundField DataField="C_Status" HeaderText="C_Status" SortExpression="C_Status" />
            <asp:BoundField DataField="ext" HeaderText="Extension" SortExpression="ext" />
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle Width="100%" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>



    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Case_no], [Remarks], [C_Status],[ext] FROM [DPA]" UpdateCommand="Update [DPA] SET Remarks=@Remarks,C_Status=@C_Status,ext=@ext where Case_no=@Case_no" DeleteCommand="Delete from [DPA] where Case_no=@Case_no"></asp:SqlDataSource>

    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" Width="100%" CssClass="datatable table table-bordered table-striped display" EmptyDataText="No records has been added." AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" Visible="False" DataKeyNames="Case_no">



        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Case_no" HeaderText="Case_no" ReadOnly="True" SortExpression="Case_no" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
            <asp:BoundField DataField="C_Status" HeaderText="C_Status" SortExpression="C_Status" />
            <asp:BoundField DataField="ext" HeaderText="Extension" SortExpression="ext" />
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle Width="100%" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>



    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Case_no], [Remarks], [C_Status],[ext] FROM [MC]" UpdateCommand="Update [MC] SET Remarks=@Remarks,C_Status=@C_Status,ext=@ext where Case_no=@Case_no" DeleteCommand="Delete from [MC] where Case_no=@Case_no"></asp:SqlDataSource>

    <asp:GridView ID="GridView6" runat="server" AllowPaging="True" Width="100%" CssClass="datatable table table-bordered table-striped display" EmptyDataText="No records has been added." AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" Visible="False" DataKeyNames="Case_no">



        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Case_no" HeaderText="Case_no" ReadOnly="True" SortExpression="Case_no" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
            <asp:BoundField DataField="C_Status" HeaderText="C_Status" SortExpression="C_Status" />
            <asp:BoundField DataField="ext" HeaderText="Extension" SortExpression="ext" />
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle Width="100%" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>



    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Case_no], [Remarks], [C_Status],[ext] FROM [OE]" UpdateCommand="Update [OE] SET Remarks=@Remarks,C_Status=@C_Status,ext=@ext where Case_no=@Case_no" DeleteCommand="Delete from [OE] where Case_no=@Case_no"></asp:SqlDataSource>

    <asp:GridView ID="GridView7" runat="server" AllowPaging="True" Width="100%" CssClass="datatable table table-bordered table-striped display" EmptyDataText="No records has been added." AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" Visible="False" DataKeyNames="Case_no">



        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Case_no" HeaderText="Case_no" ReadOnly="True" SortExpression="Case_no" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
            <asp:BoundField DataField="C_Status" HeaderText="C_Status" SortExpression="C_Status" />
            <asp:BoundField DataField="ext" HeaderText="Extension" SortExpression="ext" />
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle Width="100%" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>



    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Case_no], [Remarks], [C_Status],[ext] FROM [ED]" UpdateCommand="Update [ED] SET Remarks=@Remarks,C_Status=@C_Status,ext=@ext where Case_no=@Case_no" DeleteCommand="Delete from [ED] where Case_no=@Case_no" OnSelecting="SqlDataSource7_Selecting"></asp:SqlDataSource>

    
    </asp:Content>

