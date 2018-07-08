using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security;
using Microsoft.SharePoint.Client;
using spClient = Microsoft.SharePoint.Client; 

public partial class visitor : System.Web.UI.Page
{
    public void visitSave_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
   			// Starting with ClientContext, the constructor requires a URL to the 
            // server running SharePoint. 
            // ClientContext context = new ClientContext("http://SiteUrl");
            // var SharePointSiteUrl = new Uri(context);
            // The SharePoint URL is stored in the web.config file.  You will need to update this file
            var spSite = System.Web.Configuration.WebConfigurationManager.AppSettings["visitorListURL"].ToString();
			var SharePointSiteUrl = new Uri(spSite);

            // The SharePoint username and password is stored in the web.config file.  You will need to update them in web.config file
            var username = System.Web.Configuration.WebConfigurationManager.AppSettings["spUserName"].ToString();
            var password = System.Web.Configuration.WebConfigurationManager.AppSettings["spPassword"].ToString();

            using (spClient.ClientContext clientContext = new spClient.ClientContext(SharePointSiteUrl)) 
            {
                var securePassword = new SecureString();
                foreach (char c in password) securePassword.AppendChar(c);

                SecureString passWord = new SecureString();
                foreach (char c in password.ToCharArray())
                {
                    passWord.AppendChar(c);
                }
                
                clientContext.Credentials = new spClient.SharePointOnlineCredentials(username, passWord);

                // The SharePoint web at the URL
                spClient.Web web = clientContext.Web;

                // get the custom SharePoint list reference.  This will be your custom list's title
                spClient.List wsRegister = web.Lists.GetByTitle("the name of your custom list");

                // We are just creating a regular list item, so we don't need to 
                // set any properties. If we wanted to create a new folder, for 
                // example, we would have to set properties such as 
                // UnderlyingObjectType to FileSystemObjectType.Folder. 
                ListItemCreationInformation itemCreateInfo = new ListItemCreationInformation();

                spClient.ListItem newRegItem = wsRegister.AddItem(itemCreateInfo);

                newRegItem.Update();

                newRegItem["Title"] = vFName.Text;
                newRegItem["lname"] = vLName.Text;
                newRegItem["email"] = exampleInputEmail1.Text;
                newRegItem["company"] = tblCompany.Text;
                
                newRegItem.Update();

                clientContext.ExecuteQuery();
                
                Response.Redirect("success.html");
                }
        }
        else
        {
            Response.Redirect("template.html");
        }
    }
}