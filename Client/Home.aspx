<%@ Page Title="" Language="VB" MasterPageFile="~/Client/ClientMasterPage.master"  AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="_Default" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
		<div id="demo" class="carousel slide" data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<div class="carousel-item active">
                    <img src="/images/12.jpg" alt="Los Angeles" width="1200" height="900"/>
					<div class="carousel-caption">
						<h1 class="bannertitle">Woman's Stylish Jackets</h1>
						<button class="btn bannerbtn">Check It Now</button>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
</div>
</asp:Content>