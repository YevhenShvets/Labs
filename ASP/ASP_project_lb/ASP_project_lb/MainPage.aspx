<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="ASP_project_lb.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<style>
   .row {
        display: flex;
        flex-wrap: wrap;
   }

   .row > div[class*='col-'] {
        display: flex;
   }

</style>
<body>
   <div class="container">
      <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 text-center">
              <h2><a class="blog-header-logo text-dark" href="MainPage.aspx">MainPage</a></h2>
          </div>
          <div class="col-4 d-flex justify-content-end align-items-center">
            <a class="btn btn-sm btn-outline-secondary" href="LoginPage.aspx">Sign in</a>
            <form runat="server">
                <asp:Button ID="Exit" runat="server" Text="Exit" CssClass="btn btn-sm btn-outline-secondary" OnClick="Exit_Click" />
              </form>
          </div>
        </div>
      </header>

      <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-center">
          <a class="p-2 text-muted" href="#">Test1</a>
          <a class="p-2 text-muted" href="#">Test2</a>
          <a class="p-2 text-muted" href="#">Test3</a>
        </nav>
      </div>

      <div class="jumbotron p-3 p-md-5 text-white rounded bg-dark">
        <div class="col-md-6 px-0">
            <h1 class="display-4 font-italic">List of users</h1>
        </div>
      </div>
      <div class="row mt-2" runat="server" id="users_div"></div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
