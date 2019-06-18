<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="old_notice.aspx.cs" Inherits="old_notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Older Notices
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="content">
        <div class="module">
            <div class="module-body">
                <div class="profile-head media">
                    <a class="media-avatar pull-left">
                        <img src="images/notice.png" />
                    </a>
                    <div class="media-head">
                        <h3>Old Notices 
                                            
                        </h3>
                        <div class="pull-right">
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Month" DataValueField="Month">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbTrackConnectionString %>" SelectCommand="SELECT [Month] FROM [Filter]"></asp:SqlDataSource>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Filter" CssClass="btn " BorderColor="Black" />

                        </div>
                    </div>


                </div>
                <ul class="profile-tab nav nav-tabs">
                    <li class="active"><a data-toggle="tab">Old </a></li>

                </ul>

                <div class="profile-tab-content tab-content">
                    <div class="tab-pane fade active in" id="activity">
                        <div class="stream-list">
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

