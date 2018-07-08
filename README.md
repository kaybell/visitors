# visitors
#
#This demo uses an ASP.NET web page to capture form information (a visitors visit) and writes the information to a SharePoint Online custom list.
#
# I received a request to create a web form that would capture a visitors visit to each companies table, at an upcoming company event.  The user needed the data saved to a location that would beeasy for them to access and have the ability to export the data into an Excel file.
#
# Since our users are fluent with SharePoint Online (SPO), this was a logical choice for the location to save the form results to.  A custom SharePoint list would work well for saving the form data to.  
#
#Since our intranet web server is running IIS on a Windows Server, I decided I would create an ASP.NET web page that uses the C# language and the <a href="https://docs.microsoft.com/en-us/sharepoint/dev/sp-add-ins/complete-basic-operations-using-sharepoint-client-library-code" target="_blank">SharePoint Client Side Object Model (CSOM)</a>.  
#
# The web pages in this respository are built with Bootstrap 4.  Since our web form is going to be accessed mainly from smartphones, I needed the web page and form to be mobile friendly.  I didn't modify the Bootstrap source files.  I created a custom.css file that contains a few styles that override a few of the Bootstrap styles.  You can easily comment out the line that loads the custom.css file, so you are using pure Bootstrap styles.  