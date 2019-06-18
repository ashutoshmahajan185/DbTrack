<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChartExample.aspx.cs" Inherits="ChartExample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Charts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="module message">
                                <div class="module-head">
                                    <h3>
                                       <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                    </h3>
                                </div>
                           </div>
                                    <p>
                                        <asp:Label ID="Label2" runat="server" style="text-align: center; font-weight: 700; font-style: italic" Text="" Font-Size="Medium" ForeColor="Blue"></asp:Label>
                                        <br/>
                                        <asp:Label ID="Label4" runat="server" style="text-align: center; font-weight: 700; font-style: italic" Text="" Font-Size="Medium" ForeColor="Blue"></asp:Label>
                                    </p>
                              
                               <div style=" text-align:center">
                                    <asp:Chart ID="Chart1" runat="server" Height="550px" Width="1200px" TabIndex="5" ToolTip="" BorderlineWidth="5" BackColor="Transparent">
                                        <Legends>
                                        <asp:Legend Alignment="Center" Docking="Bottom" Name="Dotnet Chart Example" Enabled="true"/>
                                        </Legends>
                                        <Series>
                                            <asp:Series Name="Series1" ChartType="StackedColumn"/>
       
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true" Area3DStyle-Inclination="30" BackSecondaryColor="Silver" AlignmentStyle="AxesView" Area3DStyle-LightStyle="Realistic" Area3DStyle-PointGapDepth="200" BackColor="Transparent" BackGradientStyle="TopBottom" BackHatchStyle="LightHorizontal" BackImageTransparentColor="#000066" BackImageWrapMode="Scaled" BorderDashStyle="Solid" ShadowColor="Red" IsSameFontSizeForAllAxes="false" Area3DStyle-IsClustered="false">
                                                <Area3DStyle Enable3D="True"></Area3DStyle>
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                               </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</asp:Content>

