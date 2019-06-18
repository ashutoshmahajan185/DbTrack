<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="attachment.aspx.cs" Inherits="attachment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Attachment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="module message">
        <div class="module-head">
            <h3>Upload/Download Attachments

            </h3>
        </div>
    </div>

    <div class="module-option clearfix">

        <div class="pull-left">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="UploadFile" class="btn btn-primary" />



        </div>

        <div class="pull-right">
        </div>
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" EmptyDataText="No files uploaded" Width="100%" CssClass="datatable table table-bordered table-striped display">

        <Columns>
            <asp:BoundField DataField="Text" HeaderText="File Name" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDownload" Text="Download" CommandArgument='<%# Eval("Value") %>' runat="server" OnClick="DownloadFile" class="btn btn-info"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" Text="Delete" CommandArgument='<%# Eval("Value") %>' runat="server" OnClick="DeleteFile" class="btn btn-danger" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

</asp:Content>

