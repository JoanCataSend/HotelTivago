<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HotelTivago.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <title>HotelTrivago</title>

    <style>
        /* ===== GENERAL ===== */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #4a8ef0, #6bb4ff);
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* ===== HEADER ===== */
        header {
            background: rgba(255, 255, 255, 0.95);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .logo-img {
            height: 55px;
            width: auto;
        }

        nav a {
            margin-left: 25px;
            font-size: 18px;
            color: #333;
            transition: 0.2s;
        }

        nav a:hover {
            color: #2c64c9;
        }

        /* ===== HERO IMAGE ===== */
        .hero {
            width: 100%;
            height: 380px;
            overflow: hidden;
            position: relative;
        }

        .hero img {
            width: 100%;
            height: 380px;
            object-fit: cover;
            animation: fade 12s infinite;
        }

        @keyframes fade {
            0% { opacity: 1; }
            33% { opacity: 0.3; }
            66% { opacity: 1; }
            100% { opacity: 1; }
        }

        /* ===== CONTENT ===== */
        .content {
            text-align: center;
            padding: 40px 20px;
            background: rgba(255, 255, 255, 0.95);
            margin: 30px auto;
            width: 85%;
            max-width: 900px;
            border-radius: 16px;
            box-shadow: 0 4px 22px rgba(0,0,0,0.2);
            animation: fadeIn 1s ease;
        }

        h2 {
            color: #2c64c9;
        }

        .services {
            display: flex;
            justify-content: space-around;
            margin-top: 25px;
            flex-wrap: wrap;
        }

        .service-box {
            background: white;
            width: 260px;
            padding: 20px;
            margin: 10px;
            border-radius: 12px;
            box-shadow: 0 3px 15px rgba(0,0,0,0.1);
            transition: 0.3s ease;
        }

        .service-box:hover {
            transform: scale(1.04);
        }

        /* BUTTON */
        .btn-login {
            display: inline-block;
            margin-top: 25px;
            background: #2c64c9;
            color: white;
            padding: 14px 30px;
            font-size: 18px;
            border-radius: 10px;
            transition: 0.2s;
        }

        .btn-login:hover {
            background: #1e4d99;
        }

        /* ===== FOOTER ===== */
        footer {
            margin-top: 40px;
            background: rgba(255,255,255,0.95);
            padding: 20px;
            text-align: center;
            color: #333;
            box-shadow: 0 -2px 10px rgba(0,0,0,0.1);
        }

        /* Fade-in */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        /* RESPONSIVE */
        @media (max-width: 700px) {
            nav a {
                margin-left: 10px;
                font-size: 16px;
            }
            .service-box {
                width: 85%;
            }
            .logo-img {
                height: 45px;
            }
        }

    </style>
</head>

<body>

    <form id="form1" runat="server">

        <!-- ===== HEADER ===== -->
        <header>
            <img src="Images/2.png" class="logo-img" />

            <nav>
                <a href="index.aspx">Inicio</a>
                <a href="login.aspx">Login</a>
                <a href="#services">Servicios</a>
                <a href="#contacto">Contacto</a>
            </nav>
        </header>

        <!-- ===== CONTENT ===== -->
        <div class="content">
            <h2>Bienvenido a HotelTrivago</h2>
            <p>
                Disfruta de una experiencia única con nuestras habitaciones modernas,
                un servicio excelente y un ambiente inolvidable.
            </p>

            <div id="services" class="services">
                <div class="service-box">
                    <h3>Habitaciones Premium</h3>
                    <p>Comodidad, espacio y un diseño elegante.</p>
                </div>

                <div class="service-box">
                    <h3>Restaurante Gourmet</h3>
                    <p>Sabores únicos elaborados por nuestros chefs.</p>
                </div>

                <div class="service-box">
                    <h3>Spa & Relax</h3>
                    <p>Masajes, sauna, jacuzzi y zona wellness.</p>
                </div>
            </div>

            <a href="login.aspx" class="btn-login">Iniciar sesión</a>
        </div>

        <!-- ===== FOOTER ===== -->
        <footer id="contacto">
            <p>📍 Avenida del Mar 123, Valencia</p>
            <p>📞 +34 600 123 456</p>
            <p>© 2025 HotelTrivago — Todos los derechos reservados</p>
        </footer>

    </form>

</body>
</html>
