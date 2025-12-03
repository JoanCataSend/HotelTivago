<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HotelTivago.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Hotel Tivago</title>

    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            overflow-x: hidden;
        }

        /* ============================
           PREMIUM TRANSPARENT HEADER
        ============================ */
        .header {
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            padding: 25px 0;
            z-index: 1000;
        }

        .header-container {
            width: 90%;
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* LOGO */
        .logo-img {
            height: 100px;
            width: auto;
            object-fit: contain;
            filter: brightness(200%);
            transition: 0.3s ease;
}

        .logo-img:hover {
        filter: brightness(140%);
        }
        .logo {
            color: white;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 2px;
        }

        /* NAV MENU */
        .nav {
            display: flex;
            gap: 35px;
        }

        .nav-link {
            color: white;
            text-decoration: none;
            font-size: 17px;
            font-weight: 500;
            letter-spacing: 1px;
            position: relative;
            transition: 0.3s ease;
        }

        .nav-link:hover,
        .nav-link.active {
            color: #ffffff;
        }

        /* Underline on hover */
        .nav-link::after {
            content: "";
            position: absolute;
            width: 0%;
            height: 2px;
            background: white;
            bottom: -5px;
            left: 0;
            transition: 0.3s;
        }

        .nav-link:hover::after,
        .nav-link.active::after {
            width: 100%;
        }

        /* RIGHT SIDE (Login) */
        .nav-right a {
            color: white;
            text-decoration: none;
            font-size: 17px;
            padding: 6px 14px;
            border-radius: 4px;
            border: 1px solid white;
            transition: 0.3s;
        }

        .nav-right a:hover {
            background: white;
            color: #0c1c38;
        }


        /* ============================
           HERO SECTION
        ============================ */
        .hero {
            height: 90vh;
            background: url('images/h4.jpg') center/cover no-repeat;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            position: relative;
        }

        .hero-overlay {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(15,15,15,0.66);
            top: 0;
            left: 0;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            text-align: center;
            margin-top: 40px;
        }

        .hero-title {
            font-size: 70px;
            font-weight: bold;
            margin-bottom: 10px;
            letter-spacing: 4px;
        }

        .hero-sub {
            font-size: 24px;
            margin-bottom: 35px;
        }

        .btn-login {
            background: #758fa8;
            padding: 14px 35px;
            border-radius: 8px;
            color: white;
            text-decoration: none;
            font-size: 20px;
            transition: 0.2s;
            font-weight: bold;
        }

        .btn-login:hover {
            background: #0c1c38;
        }


        /* ============================
           ABOUT SECTION
        ============================ */
        .about-section {
            display: flex;
            padding: 70px;
            align-items: center;
            justify-content: center;
            gap: 50px;
            margin-top: 30px;
        }

        .about-img {
            width: 45%;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        }

        .about-text {
            width: 45%;
        }

        .about-title {
            font-size: 40px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .about-desc {
            font-size: 18px;
            color: #555;
            line-height: 1.5;
        }


        /* ============================
           ROOMS SECTION
        ============================ */
        .rooms-title {
            text-align: center;
            font-size: 42px;
            font-weight: bold;
            margin-top: 40px;
        }

        .rooms-row {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 40px;
            margin: 40px 0 80px 0;
        }

        .room-card {
            width: 300px;
            text-align: center;
        }

        .room-img {
            width: 100%;
            height: 350px;
            border-radius: 12px;
            object-fit: cover;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        }

        .room-name {
            font-size: 22px;
            font-weight: bold;
            margin-top: 15px;
        }

        /* ============================
           FOOTER
        ============================ */
        footer {
            background: #0c1c38;
            color: white;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <!-- ============================
         PREMIUM TRANSPARENT HEADER
    ============================ -->
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


    <!-- ============================
         HERO SECTION
    ============================ -->
    <section class="hero">
        <div class="hero-overlay"></div>

        <div class="hero-content">
            <h1 class="hero-title">Discover Tivago</h1>
            <p class="hero-sub">Your perfect stay awaits you</p>

            <a href="login.aspx" class="btn-login">BOOK NOW</a>
        </div>
    </section>
    <!-- ============================
     ROOMS SECTION
============================ -->
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

    <!-- ============================
         ABOUT SECTION
    ============================ -->
    <section class="about-section" id="about">
        <img src="Images/tivago.png" class="about-img" />

        <div class="about-text">
            <h2 class="about-title">Welcome to Hotel Tivago</h2>
            <p class="about-desc">
                Enjoy a unique and relaxing stay with premium rooms, excellent services,
                and modern facilities.  
                Your comfort is our priority—whether you're visiting for business or leisure.
            </p>
        </div>
    </section>

    <!-- ============================
         FOOTER
    ============================ -->
    <footer>
        © 2025 Hotel Tivago — All rights reserved.
    </footer>

</form>

</body>
</html>
