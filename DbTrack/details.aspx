<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Inbox Message
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
                        <h3>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                        </h3>

                    </div>
                </div>
                <ul class="profile-tab nav nav-tabs">
                    <li class="active"><a data-toggle="tab">&nbsp;<asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                    </a></li>

                </ul>
                <div class="profile-tab-content tab-content">
                    <div class="tab-pane fade active in" id="activity">
                        <div class="stream-list">
                            <div class="media stream">
                                <a href="#" class="media-avatar medium pull-left">
                                    <img src="images/LOGO.png" />
                                </a>
                                <div class="media-body">
                                    <div class="stream-headline">
                                        <h5 class="stream-author">
                                            <asp:Label ID="Label2" runat="server" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                            &nbsp;
                                                            <asp:Label ID="Label3" runat="server" ForeColor="Gray" Font-Size="Small"></asp:Label>
                                            <br />
                                            <br />
                                        </h5>
                                        <p>

                                            <asp:Label ID="Label5" runat="server" Style="font-size: large; color: #3366FF; text-align: center;" Text=""></asp:Label>

                                        </p>
                                    </div>
                                    <!--/.stream-headline-->

                                </div>
                            </div>
                            <!--/.media .stream-->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

