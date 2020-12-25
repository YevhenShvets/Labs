using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ASP_project_lb
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            alert_error.Visible = false;

            string username = inputUserame.Value;
            string email = inputEmail.Value;
            string password = inputPassword.Value;
            string confirmPassword = inputConfirmPassword.Value;

            if(password == confirmPassword)
            {
                if(SqlConnect.selectUser(email).Length == 0)
                {
                    if (SqlConnect.saveUser(username, email, password))
                    {
                        HttpCookie cookie = new HttpCookie("user_data", email);
                        Response.Cookies.Add(cookie);
                        Response.Redirect("MainPage.aspx");
                    }
                    else
                    {
                        alert_error.Visible = true;
                        alert_error.InnerHtml = "Something went wrong";
                    }
                }
                else
                {
                    alert_error.Visible = true;
                    alert_error.InnerHtml = "User already exists";
                }
                
            }
        }
    }
}