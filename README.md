# visitors demo
This demo uses an ASP.NET web page to capture form information (a visitors visit) and writes the information to a SharePoint Online custom list.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This work is licensed under a Creative Commons Attribution-NonCommercial 3.0 Unported License. 

This work is free to use for a personal, internal, or non-profit project under the Creative 
Commons Attribution-NonCommercial 3.0 License - http://creativecommons.org/licenses/by-nc/3.0/

All samples are provided as-is with no warranty.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I received a request to create a web form that would capture a visitors visit to each companies table, at an upcoming company event.  The user needed the data saved to a location that would be easy for them to access and have the ability to export the data into an Excel file.
#
Since our users are fluent with SharePoint Online (SPO), this was a logical choice for the save location to be a SharePoint Online site.  A custom SharePoint list would work well for saving the form data to.  
#
Our intranet web server is running IIS on a Windows Server, so I decided to use an ASP.NET web page that uses the C# language and the <a href="https://docs.microsoft.com/en-us/sharepoint/dev/sp-add-ins/complete-basic-operations-using-sharepoint-client-library-code" target="_blank">SharePoint Client Side Object Model (CSOM)</a>.  
#
The web pages in this respository are built with Bootstrap 4.  Our web form is accessed mainly from smartphones, so the web page and form need to be mobile friendly.  I didn't modify the Bootstrap source files.  I created a custom.css file that contains a few styles that override a few of the Bootstrap styles.  You can easily comment out the line that loads the custom.css file, so you are using pure Bootstrap styles.  
