<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HotelTivago.Pages.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Hotel Tivago</title>
<link rel="stylesheet" href="css/style_advanced.css" />
</head>

<body>

<form id="form1" runat="server">

<header class="header">
    <div class="header-container">
        <div class="logo">
            <img src="Images/1.png" alt="Hotel Tivago Logo" class="logo-img" />
        </div>

        <nav class="nav">
            <a href="index.aspx" class="nav-link active">HOME</a>
            <a href="#rooms" class="nav-link">ROOMS</a>
            <a href="#about" class="nav-link">ABOUT</a>
        </nav>

        <div class="nav-right">
            <a href="login.aspx">LOGIN</a>
        </div>
    </div>
</header>

<section class="hero">
    <div class="hero-overlay"></div>

    <div class="hero-content">
        <h1 class="hero-title">Discover Tivago</h1>
        <p class="hero-sub">Your perfect stay awaits you</p>

        <a href="login.aspx" class="btn-login">BOOK NOW</a>
    </div>
</section>

<h2 class="rooms-title" id="rooms">Rooms & Suites</h2>

<div class="rooms-row">
    <div class="room-card">
        <img src="Images/h1.jpg" class="room-img" />
        <p class="room-name">Suite Room</p>
    </div>

    <div class="room-card">
        <img src="Images/h2.jpg" class="room-img" />
        <p class="room-name">Double Room</p>
    </div>

    <div class="room-card">
        <img src="Images/h3.jpg" class="room-img" />
        <p class="room-name">Family Room</p>
    </div>
</div>

<section class="about-section" id="about">
    <img src="Images/tivago.png" class="about-img" />

    <div class="about-text">
        <h2 class="about-title">Welcome to Hotel Tivago</h2>
        <p class="about-desc">
            Enjoy a unique and relaxing stay with premium rooms, excellent services,
            and modern facilities.  
            Your comfort is our priority.
        </p>
    </div>
</section>

<footer>
    © 2025 Hotel Tivago — All rights reserved.
</footer>

</form>

</body>
</html>
