<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="notices.aspx.cs" Inherits="notices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Notices Board
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
                        <h3>Notice Board 
                        </h3>

                        <div class="profile-details muted">

                            <a href="old_notice.aspx" class="btn  btn-primary pull-right">Older Notices </a>
                        </div>
                    </div>
                </div>
                <ul class="profile-tab nav nav-tabs">
                    <li class="active"><a data-toggle="tab">Recent </a></li>

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
                                        </h5>
                                        <div class="stream-text">
                                            <asp:Label ID="Label4" runat="server" ForeColor="Blue" Font-Size="Small"></asp:Label>
                                        </div>
                                    </div>
                                    <!--/.stream-headline-->

                                </div>
                            </div>
                            <!--/.media .stream-->
                            <div class="media stream">
                                <a href="#" class="media-avatar medium pull-left">
                                    <img src="images/LOGO.png" />
                                </a>
                                <div class="media-body">
                                    <div class="stream-headline">
                                        <h5 class="stream-author">
                                            <asp:Label ID="Label5" runat="server" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                            &nbsp;
                                                            <asp:Label ID="Label6" runat="server" ForeColor="Gray" Font-Size="Small"></asp:Label>
                                        </h5>
                                        <div class="stream-text">
                                            <asp:Label ID="Label7" runat="server" ForeColor="Blue" Font-Size="Small"></asp:Label>
                                        </div>
                                    </div>
                                    <!--/.stream-headline-->

                                </div>
                            </div>

                            <div class="media stream">

                                <div class="module message">
                                    <div class="module-head">
                                        <h3>Post a Notice</h3>
                                    </div>
                                </div>

                                <div class="module-head">



                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Notice :</label>
                                        <div class="controls">
                                            <asp:TextBox runat="server" type="text" ID="TextBox3" TextMode="MultiLine" Columns="50" Rows="5" class="span8" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="control-group">

                                            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											
                                        </div>
                                        <div class="controls">
                                            <br />
                                            <asp:Button ID="Send" runat="server" Text="Post Notice" class="btn btn-primary pull-center" OnClick="Send_Click" />
                                            <br />
                                            <br />
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

