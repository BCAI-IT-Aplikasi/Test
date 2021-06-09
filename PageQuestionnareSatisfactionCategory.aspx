<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" 
    CodeFile="PageQuestionnareSatisfactionCategory.aspx.vb" Inherits="Pages_PageQuestionnareSatisfactionCategory" Title="Master Kuisioner Kategori Kepuasan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="../UserControls/UCModifyRecord.ascx" TagName="UCModifyRecord" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" language="javascript" src="../WebResources/InputValidation.js"></script>
    <script type="text/javascript" language="javascript" src="../WebResources/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../WebResources/jquery-1.4.min.js"></script>
    <script type="text/javascript" src="../WebResources/jqueryui-1.8.min.js"></script>
    <script type="text/javascript" language="javascript">
        // Initialize variable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        // handle several browser
        var txtFirstNmOnMasterPage = "";
        var UserGroupDesc = "";
        if (navigator.appName == "Microsoft Internet Explorer") {
            txtFirstNmOnMasterPage = str_JS_ContentPlaceHolderID_txt_IE;
        }
        else {
            // case mozilla firefox
            txtFirstNmOnMasterPage = str_JS_ContentPlaceHolderID_txt_FF;
        }
        var lblFirstNmOnMasterPage = str_JS_ContentPlaceHolderID_lbl;

        // Initialize variable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        function ViewSatisfactionCategory(SatisfactionCategoryId) {
            txtHidden = document.getElementById(txtFirstNmOnMasterPage + "txtHidden");
            txtHidden.value = SatisfactionCategoryId;
            __doPostBack('SatisfactionCategoryView', '');
        }

        function UpdateSatisfactionCategory(SatisfactionCategoryId) {
            txtHidden = document.getElementById(txtFirstNmOnMasterPage + "txtHidden");
            txtHidden.value = SatisfactionCategoryId;
            __doPostBack('SatisfactionCategoryUpdate', '');
        }

        function DelSatisfactionCategory(SatisfactionCategoryId, pmsgTxt) {
            if (confirm(pmsgTxt)) {
                txtHidden = document.getElementById(txtFirstNmOnMasterPage + "txtHidden");
                txtHidden.value = SatisfactionCategoryId;
                __doPostBack('SatisfactionCategoryDelete', '');
            }
            else {
                return false;
            }

        }



    </script>

    <div id="nav-content-detail">
        <table id="Table1" border="0" cellpadding="2" cellspacing="1" width="100%">
            <tr>
                <td class="titlePage" colspan="6" style="height: 17px"><asp:Label ID="lblTitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="titleField" colspan="6">
                    <uc1:UCModifyRecord ID="UCModifyRecord2" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="titleField" colspan="6"></td>
            </tr>
            <tr>
                <td class="titleField">&nbsp;</td>
                <td class="titleFieldCenter">&nbsp;</td>
                <td style="width: 174px; height: 17px">&nbsp;</td>
                <td class="titleField" style="height: 17px; width: 20%">
                    <asp:HiddenField ID="txtHidden" runat="server" />
                </td>
                <td>&nbsp;</td>
                <td style="height: 17px; width: 29%">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="6">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="6">
                    <asp:Panel ID="PanelSearch" runat="server">
                        <table id="TableSearch" border="0" cellpadding="2" cellspacing="1" width="100%">
                            <tr>
                                <td class="auto-style9">Search</td>
                                <td class="auto-style7">:</td>
                                <td class="titleField" colspan="4">
                                    <asp:TextBox ID="txtSearch" runat="server" Width="500px" ToolTip="Search By Satisfaction Category Name Or Satisfaction Category Description"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <asp:Panel ID="PanelEditData" runat="server">
                        <table id="TableEditData" border="0" cellpadding="2" cellspacing="1" width="100%">
                            <tr>
                                <td class="auto-style9">Category Name<asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label></td>
                                <td class="auto-style7">:</td>
                                <td class="auto-style11">
                                    <asp:TextBox ID="txtCategory_Name" runat="server" Width="300px" MaxLength="50" onKeyUp="SetMaxLenText(this,50)"></asp:TextBox>
                                </td>
                                <td class="titleField" style="height: 11px">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td style="height: 11px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">Category Description<asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label></td>
                                <td class="auto-style7">:</td>
                                <td class="auto-style11">
                                    <asp:TextBox ID="txtCategory_Description" runat="server" TextMode="MultiLine" Width="300px" Height="100px" MaxLength="500" onKeyUp="SetMaxLenText(this,500)"></asp:TextBox>
                                </td>
                                <td class="titleField" style="height: 11px">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td style="height: 11px">&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <asp:Panel ID="PanelViewData" runat="server">
                        <table id="TableViewData" border="0" cellpadding="2" cellspacing="1" width="80%">
                            <tr>
                                <td class="auto-style9">Category Name</td>
                                <td class="auto-style7">:</td>
                                <td class="auto-style11">
                                    <asp:Label ID="lblViewCategoryName" runat="server"></asp:Label>
                                </td>
                                <td class="titleField" style="height: 11px">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td style="height: 11px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">Category Description</td>
                                <td class="auto-style7">:</td>
                                <td class="auto-style11">
                                    <asp:Label ID="lblViewCategoryDescription" runat="server"></asp:Label>
                                </td>
                                <td class="titleField" style="height: 11px">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td style="height: 11px">&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="6" style="height:30px;"></td>
            </tr>
            <tr>
                <td colspan="6">
                    <asp:Panel ID="pnlGeneral" runat="server" Width="100%">
                        <asp:Label ID="lblGridInfo" runat="server" Text="Satisfaction Category List"></asp:Label>
                        &nbsp;<asp:Label ID="lblTotalRec" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:UpdatePanel ID="upDetail" runat="server">
                            <ContentTemplate>
                                <asp:DataGrid ID="dtgSatisfactionCategory" runat="server" AllowCustomPaging="True" AllowPaging="True"
                                AllowSorting="True" AutoGenerateColumns="False" BackColor="#CDCDCD" BorderColor="Gainsboro"
                                BorderWidth="0px" CellPadding="3" CellSpacing="1" Width="97.5%" ShowFooter="false" PageSize="10">
                                    <AlternatingItemStyle BackColor="Cornsilk" />
                                    <ItemStyle BackColor="White" />
                                    <HeaderStyle BackColor="Blue" ForeColor="White" HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:BoundColumn HeaderText="ID" SortExpression="ID" Visible="False"></asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="No">
                                            <HeaderStyle CssClass="titleTableRsd" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="Satisfaction Category ID" Visible="false">
                                            <HeaderStyle CssClass="titleTableRsd" />
                                            <ItemStyle CssClass="dtgItemHorizontalAlignCenter" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblCategoryId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.iCategory_ID")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="Satisfaction Category Name" SortExpression="cCategory_Name">
                                            <HeaderStyle CssClass="titleTableRsd" />
                                            <ItemStyle CssClass="dtgItemHorizontalAlignCenter" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblSatisfactionCategoryName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.cCategory_Name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="Satisfaction Category Description" SortExpression="cCategory_Desc">
                                            <HeaderStyle CssClass="titleTableRsd" />
                                            <ItemStyle CssClass="dtgItemHorizontalAlignCenter" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblCategoryDescription" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.cCategory_Desc")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="Action">
                                            <HeaderStyle CssClass="titleTableRsd" Width="15%" />
                                            <ItemStyle CssClass="dtgItemHorizontalAlignCenter" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" CommandName="View"
                                                    Text="View"> <img src="../images/detail.gif"  alt="View"></asp:LinkButton>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                    Text="Edit"> <img src="../images/edit.gif"  alt="Edit"></asp:LinkButton>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                    Text="Delete"> <img src="../images/trash.gif" alt="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                    <SelectedItemStyle BackColor="#FFC68C" />
                                    <PagerStyle HorizontalAlign="Left" Mode="NumericPages" />
                                </asp:DataGrid>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

