<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visitor.aspx.cs" Inherits="visitor" %>

<!DOCTYPE html>
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <title>Visitors Demo</title>

    <!-- Bootstrap Favicons -->
    <link rel="apple-touch-icon" href="docs/4.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="docs/4.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="docs/4.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="docs/4.1/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="docs/4.1/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
    <link rel="icon" href="favicon.ico">
    <meta name="msapplication-config" content="docs/4.1/assets/img/favicons/browserconfig.xml">
    <meta name="theme-color" content="#563d7c">

    <!-- SharePoint Online Javascript Libraries | you will need to reference your SharePoint Online Libraries -->
    <script type="text/javascript" src="https://yourSPSiteCollectionName.sharepoint.com/yourStructure/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="https://yourSPSiteCollectionName.sharepoint.com/yourStructure/_layouts/15/sp.js"></script>

</head>

<body>
  <form id="spVisitorList" runat="server">
        <!-- Pull in Site Navigation -->
         <%		   
          Response.WriteFile ("includes/siteNav.html");  
         %>
     
        <div class="container">
            <h1 class="text-center">Visitors</h1>
            <h3 class="text-center">Fill out form for each event table you visit.</h3>
            <hr>
            <br>
            <!-- And here begins the form area. Modify this area to create your own form -->
            <div id="vForm" class="mb-4">
                <div class="row">
                    <div class="form-label-group col-md-6 mb-3">
                        <label>First Name</label>
                        <asp:TextBox id="vFName" runat="server" text="" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFirstName" runat="server" ControlToValidate="vFName"
                        ErrorMessage="* Required" SetFocusOnError="True" CssClass="required"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFirstNameR" runat="server" ControlToValidate="vFName"
                        ErrorMessage="*" SetFocusOnError="True" CssClass="hidden-xs hidden-sm hidden-md hidden-lg"></asp:RequiredFieldValidator>
                    </div> <!-- end of column -->
                    <div class="form-label-group col-md-6 mb-3">
                        <label>Last Name</label>
                        <asp:TextBox id="vLName" runat="server" text="" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ControlToValidate="vLName"
                        ErrorMessage="* Required" SetFocusOnError="True" CssClass="required"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredLastNameR" runat="server" ControlToValidate="vLName"
                        ErrorMessage="*" SetFocusOnError="True" CssClass="hidden-xs hidden-sm hidden-md hidden-lg"></asp:RequiredFieldValidator>
                    </div> <!-- end of column -->
                </div> <!-- end of row -->

                <div class="row">
                    <div class="form-label-group col-md-6 mb-3">
                        <label>Email address</label>
                        <asp:TextBox type="email" id="exampleInputEmail1" runat="server" text="" class="form-control" placeholder="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredeMail" runat="server" ControlToValidate="exampleInputEmail1" 
                        ErrorMessage="* Required" SetFocusOnError="True" CssClass="required"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredeMailR" runat="server" ControlToValidate="exampleInputEmail1" 
                        ErrorMessage="*" SetFocusOnError="True" CssClass="hidden-xs hidden-sm hidden-md hidden-lg"></asp:RequiredFieldValidator>
            
                        <asp:RegularExpressionValidator ID="RegulareMail" runat="server" ControlToValidate="exampleInputEmail1"
                        ErrorMessage="Enter valid eMail" SetFocusOnError="True"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  CssClass="required">
                        </asp:RegularExpressionValidator>   
                        <asp:RegularExpressionValidator ID="RegulareMailR" runat="server" ControlToValidate="exampleInputEmail1"
                        ErrorMessage="*" SetFocusOnError="True"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="hidden-xs hidden-sm hidden-md hidden-lg">
                        </asp:RegularExpressionValidator>  
                    </div> <!-- end of column -->
                    <div class="form-label-group col-md-6 mb-3">
                        <label>Company</label>
                        <asp:DropDownList id="tblCompany" runat="server" class="form-control" AutoPostBack="true">
                            <asp:ListItem Enabled="true" Text="Select a Company" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Company 1" Value="Company 1"></asp:ListItem>
                            <asp:ListItem Text="Company 2" Value="Company 2"></asp:ListItem>
                            <asp:ListItem Text="Company 3" Value="Company 3"></asp:ListItem>
                            <asp:ListItem Text="Company 4" Value="Company 4"></asp:ListItem>
                            <asp:ListItem Text="Company 5" Value="Company 5"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:RequiredFieldValidator id="RequiredCompany" Text="** Select a Company **" CssClass="required" InitialValue="-1" ControlToValidate="tblCompany" Runat="server" />  
                    </div> <!-- end of column -->
                </div> <!-- end of row -->
                
                <br class="clear">
                <div class="center-block text-center">
                    <hr>
                    <asp:Button runat="server" ID="vSave" Text="Save" class="btn-primary btn-lg" OnClick="visitSave_Click" />
                    &nbsp; &nbsp;
                    <input type="reset" class="btn-primary btn-lg" value="Clear Form" />
                </div>
            </div>  <!-- end of #vForm -->	                 
            <p>&nbsp;</p>
        </div> <!-- end of container -->
        
        <!-- Pull in Site Footer -->
        <%		   
          Response.WriteFile ("includes/siteFooter.html");  
        %> 
 
    </form>
</body>
</html>
