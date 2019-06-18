<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="compose.aspx.cs" Inherits="compose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Compose
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="module message">
        <div class="module-head">
            <h3>Compose Mail</h3>

        </div>
    </div>




    <div class="media stream">

        <div class="module message">
            <div class="module-head">
                <h3>My Mail </h3>
            </div>
        </div>

        <div class="module-head">

            <div class="control-group">




                <label class="control-label" for="basicinput">To :</label>
                <div class="controls">

                    <br />
                    <table>
                        <tr>
                            <td colspan="3">
                                <b style="text-align: center">Add Recipient :</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource2" DataTextField="User_Name" DataValueField="User_Name" Height="200px" Width="150px" ForeColor="Blue" SelectionMode="Multiple"></asp:ListBox>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [User_Name] FROM [Employee] ORDER BY [User_Name]"></asp:SqlDataSource>

                            </td>
                            <td>

                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Add" runat="server" Text=">" Width="45px" OnClick="Add_Click" CssClass="btn" BorderColor="Black" Font-Bold="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="AddAll" runat="server" Text=">>" Width="45px" OnClick="AddAll_Click" CssClass="btn" BorderColor="Black" Font-Bold="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Remove" runat="server" Text="<" Width="45px" OnClick="Remove_Click" CssClass="btn" BorderColor="Black" Font-Bold="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="RemoveAll" runat="server" Text="<<" Width="45px" OnClick="RemoveAll_Click" CssClass="btn" BorderColor="Black" Font-Bold="True" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:ListBox ID="ListBox2" runat="server" Height="200px" Width="150px" ForeColor="Red" SelectionMode="Multiple"></asp:ListBox>


                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lbltxt" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>


                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="basicinput">Subject :</label>
                <div class="controls">
                    <asp:TextBox runat="server" ID="TextBox1" CssClass="span8" />
                    <asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Subject Required" ForeColor="Red" ControlToValidate="TextBox1" />

                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="basicinput">Message :</label>
                <div class="controls">
                    <asp:TextBox runat="server" ID="TextBox2" CssClass="span8" TextMode="MultiLine" Columns="50" Rows="5" />
                    <asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Message Required" ForeColor="Red" ControlToValidate="TextBox2" />
                </div>
            </div>

            <div class="control-group">
                <div class="controls">

                    <asp:Button ID="Send" runat="server" ValidationGroup='valGroup1' OnClick="Send_Click" Text="Send Mail" CssClass="btn btn-danger pull-center " />

                </div>
            </div>
        </div>
    </div>
</asp:Content>

