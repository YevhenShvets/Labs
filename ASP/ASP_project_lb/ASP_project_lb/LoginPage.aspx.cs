using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_project_lb
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            alert_error.Visible = false;

            string email = inputEmail.Value;
            string password = inputPassword.Value;

            string data = SqlConnect.selectUser(email);

            if (data.Length > 0)
            {
                string[] d = data.Split('-');
                if(d[3] == password)
                {
                    HttpCookie cookie = new HttpCookie("user_data", email);
                    Response.Cookies.Add(cookie);
                    Response.Redirect("MainPage.aspx");
                }
                else
                {
                    alert_error.Visible = true;
                    alert_error.InnerHtml = "Password is incorrect";
                }
            }
            else
            {
                alert_error.Visible = true;
                alert_error.InnerHtml = "User not found";
            }
        }
    }
}