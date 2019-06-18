<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="verification.aspx.cs" Inherits="verification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Verification Admin
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="module message">
                                <div class="module-head">
                                    <h3>
                                        Verification</h3>      
                                </div>
                            </div>
                           
                          <table  class="datatable table table-bordered table-striped display" style="width:100%" >
                              <tr>
                                <td style="width: 150px">
                                Ver No:<br />
                                <asp:TextBox ID="Ver_no" runat="server" Width="100" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Ver. No Required" ValidationGroup="val1" ControlToValidate="Ver_no" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </td>

                                <td style="width: 150px">
                                 Date:<br />
                                <asp:TextBox ID="Date" runat="server" Width="100" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Date Required" ValidationGroup="val1" ControlToValidate="Date" ForeColor="Red"></asp:RequiredFieldValidator>

                                </td>

                                 <td style="width: 150px">
                                    EmpID:<br />
                                      <asp:TextBox ID="empid" runat="server" Width="100" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Emp-ID Required" ValidationGroup="val1" ControlToValidate="empid" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>

                                  <td style="width: 150px">
                                      Disposal:<br />
                                    <asp:TextBox ID="disposal" runat="server" Width="100" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Disposal Required" ValidationGroup="val1" ControlToValidate="disposal" ForeColor="Red"></asp:RequiredFieldValidator>
                                     </td>
                                  <td style="width: 150px">
                                     Status:<br />
                                     <asp:TextBox ID="Status" runat="server" Width="100" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Status Required" ValidationGroup="val1" ControlToValidate="Status" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 100px">
                            <asp:Button ID="Button3" runat="server"  Text="Add" ValidationGroup="val1" OnClick="OnClick_Insert" Width="68px" CssClass="btn btn-danger" />
                                 </td>
                                </tr>
                            </table>
                                     <br />
                                    <br />
                           
                            <div class="module message">
                                <div class="module-body">
                                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" Width="100%" CssClass="datatable table table-bordered table-striped display" EmptyDataText="No records has been added." AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ver_no" DataSourceID="SqlDataSource1">
                            <Columns>
              
                                <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
              
                            <asp:BoundField DataField="Ver_no" HeaderText="Ver_no" ReadOnly="True" SortExpression="Ver_no" >
                                 <ControlStyle Width="150" />
                             </asp:BoundField>
            
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"  >
                                 <ControlStyle Width="150" />
                            </asp:BoundField>
            
                            <asp:BoundField DataField="empid" HeaderText="empid" SortExpression="empid"   >
                                 <ControlStyle Width="150" />
                            </asp:BoundField>
                            <asp:BoundField DataField="disposal" HeaderText="disposal" SortExpression="disposal" >
                                 <ControlStyle Width="150" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" >
                                 <ControlStyle Width="150" />
                            </asp:BoundField>
                         </Columns>
                         <RowStyle BackColor="#EFF3FB" />
                              <EditRowStyle Width="100%" />
                              <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>

                                    </div>
                                </div>
                                    <br />
                                    

                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT * FROM [Verification_Admin]" UpdateCommand="Update [Verification_Admin] SET empid=@empid,disposal=@disposal,Date=@date,Status=@Status where Ver_no=@Ver_no" DeleteCommand="Delete from [Verification_Admin] where Ver_no=@Ver_no" InsertCommand="INSERT INTO [Verification_Admin] VALUES (@Ver_no, @Date,@empid,@disposal,@Status)"  >
                         <InsertParameters>
                            <asp:ControlParameter Name="Ver_no" ControlID="Ver_no" Type="String" />
                            <asp:ControlParameter Name="Date" ControlID="Date" Type="String" />
                            <asp:ControlParameter Name="empid" ControlID="empid" Type="String" />
                             <asp:ControlParameter Name="disposal" ControlID="disposal" Type="String" />
                             <asp:ControlParameter Name="Status" ControlID="Status" Type="String" />
                        </InsertParameters>

                
                        </asp:SqlDataSource>
</asp:Content>

