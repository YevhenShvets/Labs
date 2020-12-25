<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="ASP_project_lb.RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link href="css/register.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div class="card card-signin flex-row my-5">
					<div class="card-img-left d-none d-md-flex">
					</div>
					<div class="card-body">
						<h5 class="card-title text-center">Register</h5>
						<form class="form-signup" runat="server">
							<div class="form-label-group">
								<input runat="server" type="text" id="inputUserame" class="form-control" placeholder="Username" required autofocus>
								<label for="inputUserame">Username</label>
							</div>

							<div class="form-label-group">
								<input runat="server" type="email" id="inputEmail" class="form-control" placeholder="Email address" required>
								<label for="inputEmail">Email address</label>
							</div>
			  
							<hr>

							<div class="form-label-group">
								<input runat="server" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
								<label for="inputPassword">Password</label>
							</div>
			  
							<div class="form-label-group">
								<input runat="server" type="password" id="inputConfirmPassword" class="form-control" placeholder="Password" required>
								<label for="inputConfirmPassword">Confirm password</label>
							</div>
							<div class="alert alert-danger" runat="server" id="alert_error" Visible="false">
							</div>
                            <asp:Button ID="RegisterButton"  runat="server"  Text="Register" CssClass="btn btn-lg btn-primary btn-block text-uppercase" OnClick="RegisterButton_Click" />
							<a class="d-block text-center mt-2 small" href="LoginPage.aspx">Sign In</a>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
