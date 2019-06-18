<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin1.aspx.cs" Inherits="admin1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Admin
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="module message">
                                <div class="module-head">
                                    <h3>
                                        Admin Panel</h3>
                                  
                                </div>
                                </div>


                     
                        
                                <div class="media stream">
                                               
                                                 <div class="module message">
                                                    <div class="module-head">
                                                        <h3>
                                                            Assign Case </h3>   
                                                        </div>
                                                    </div>

                                                 <div class="module-head">
                                       
										<div class="control-group">
                                            <br />
											<label class="control-label" for="basicinput">Case no :</label>
											<div class="controls">
												<asp:TextBox runat="server" type="text" id="TextBox1" class="span8" />
												<!--- <span class="help-inline">Minimum 5 Characters</span> -->
                                              
                                                <asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator1" runat="server"  ErrorMessage="* Case No Required" ForeColor="Red" ControlToValidate="TextBox1" />
											</div>
										</div>

										 <div class="control-group">
											 <label class="control-label" for="basicinput">Case Type :</label>
											<div class="controls">
										
                                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                    <asp:ListItem Selected="True" Value="-1" Text="select">---SELECT---</asp:ListItem>
                                                    <asp:ListItem>Trap</asp:ListItem>
                                                    <asp:ListItem>DPA</asp:ListItem>
                                                    <asp:ListItem>MC</asp:ListItem>
                                                    <asp:ListItem>OE</asp:ListItem>
                                                    <asp:ListItem>ED</asp:ListItem>
                                                </asp:DropDownList>
                                                
											  
                                      
											</div>
										</div>
                                	<div class="control-group">
                                        
											<label class="control-label" for="basicinput">Employee Id :</label>
											<div class="controls">
												<asp:TextBox runat="server" type="text" id="TextBox17" class="span8" />
												<!--- <span class="help-inline">Minimum 5 Characters</span> -->
                                              
                                                <asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator2" runat="server"  ErrorMessage="* id Required" ForeColor="Red" ControlToValidate="TextBox17" />
											</div>
										</div>

                                        <div class="control-group">
                                        
											<label class="control-label" for="basicinput">Department :</label>
											<div class="controls">
												<asp:TextBox runat="server" type="text" id="TextBox11" class="span8" />
												<!--- <span class="help-inline">Minimum 5 Characters</span> -->
                                              
                                                <asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator3" runat="server"  ErrorMessage="* DeptName Required" ForeColor="Red" ControlToValidate="TextBox11" />
											</div>
										</div>
										<div class="control-group">
                                            <div class="controls">

												 <asp:Button ID="Send" runat="server" ValidationGroup='valGroup1' OnClick="Send_Click" Text="Proceed" CssClass="btn btn-danger pull-center "  data-toggle="modal"/>
                                           
                                                <br />
                                               
											</div>
                                            </div>
										</div>
                                         </div>

</asp:Content>

