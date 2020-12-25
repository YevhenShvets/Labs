using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_project_lb
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["user_data"] != null)
            {
                List<string> list_users = SqlConnect.allUsers();

                foreach (string row in list_users)
                {
                    string[] r = row.Split('-');
                    string text = "" +
                        "<div class='col-sm-3'>" +
                        "<div class='card text-black bg-light mb-3' style='width: 18rem;'>" +
                            "<div class='card-body'>" +
                                "<h5 class='card-title'>" + r[1] + "</h5>" +
                                "<ul class='list-group list-group-flush bg-light text-black'>" +
                                    "<li class='list-group-item'>" + "id:" + r[0] + "</li>" +
                                    "<li class='list-group-item'>" + "email:" + r[2] + "</li>" +
                                    "<li class='list-group-item'>" + "password:" + r[3] + "</li>" +
                                "</ul>" +
                            "</div>" +
                        "</div>" +
                        "</div>";

                    users_div.Controls.Add(new LiteralControl(text));
                }
            }
            else
            {
                users_div.Controls.Add(new LiteralControl("<div class='alert alert - warning' role='alert'>Not authorized</div>"));
            }
            
        }

        protected void Exit_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["user_data"] != null)
            {
                Response.Cookies["user_data"].Expires = DateTime.Now.AddDays(-1);
            }
            Response.Redirect("MainPage.aspx");
        }
    }
}