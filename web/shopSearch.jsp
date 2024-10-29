<%-- 
    Document   : shopSearch
    Created on : Jan 28, 2024, 9:55:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="database.ProductDB"%>
<%@page import="model.Products"%>
<%@page import="util.PassEndcodeSHA"%>
<% String titleSearch = (String) session.getAttribute("titleSearch"); %>
<!DOCTYPE html>
<html lang="zxx"><head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="copyright" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Search Results for “<%out.print(titleSearch);%>” - Search</title>
        <link rel="icon" type="image/png" href="images/favicon.png">
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/magnific-popup.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/niceselect.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/flex-slider.min.css">
        <link rel="stylesheet" href="css/owl-carousel.css">
        <link rel="stylesheet" href="css/slicknav.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="#" id="colors">

        <style>
            .option:hover  .inputCusShop{
                background-color: #F7941D;
                border: unset;
            }
            .option .inputCusShop{
                width: 100%;
                height: 40px;
                background-color: #fff;
                border: unset;
                transition: all 0.2s;
            }
        </style>
    </head>
    <body class="js">        
        <header class="header shop">
            <jsp:include page="header/header.jsp"></jsp:include>
            <jsp:include page="header/navigation.jsp"></jsp:include>
            </header>


            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="bread-inner">
                                <ul class="bread-list">
                                    <li><a href="index.jsp">Home<i class="ti-arrow-right"></i></a></li>
                                    <li class="active">Search</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <section class="product-area shop-sidebar shop section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-8 col-12">
                            <div class="row">
                                <div class="col-12">
                                    <div class="shop-top">
                                        <span style="float:left">Search results : “<%out.print(titleSearch);%>”</span>
                                    <ul class="view-mode">
                                        <li class="active"><a class="linkCus" href="#"><i class="fa fa-th-large"></i></a></li>
                                        <li><a class="linkCus" href="#"><i class="fa fa-th-list"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <%

                                List<Products> listProduct = (List<Products>) session.getAttribute("listSearch");
                                if (listProduct.size() <= 0)
                                    out.print("<div class='col-12' style='margin-top: 30px'><h3>Không tìm thấy sản phẩm phù hợp</h3></div>");
                                else {
                                    for (Products sp : listProduct) {
                                        String price = PassEndcodeSHA.formatVnd(sp.getPrice());
                                        String priceDiscount = PassEndcodeSHA.formatVnd((sp.getPrice() - (sp.getPrice() * (sp.getDiscount() / 100))));
                                        out.print("<div class=\"col-lg-3 col-md-6 col-12\">"
                                                + "<div class=\"single-product\">"
                                                + "<div class=\"product-img\">"
                                                + "<a href=\"#\">"
                                                + "<img class=\"default-img\" src=" + sp.getImage() + " alt=\"#\">"
                                                + "<img class=\"hover-img\" src=" + sp.getImage() + " alt=\"#\">"
                                                + "<span class=\"price-dec\">30% Off</span>"
                                                + "</a>"
                                                + "<div class=\"button-head\">"
                                                + "<div class=\"product-action\">"
                                                + "<a title=\"Wishlist\" href=\"#\"><i class=\" ti-heart \"></i><span>Add to Wishlist</span></a>"
                                                + "<a title=\"Compare\" href=\"#\"><i class=\"ti-bar-chart-alt\"></i><span>Add to Compare</span></a>"
                                                + "</div>"
                                                + "<div style=\"height: 100%; display: flex;align-items: center;\" class=\"product-action-2\">"
                                                + "<form action=\"ControllerCart\">"
                                                + "<button type=\"submit\" name=\"action\" value=\"View Product\" title=\"View Product\"><i class=\" ti-eye\"></i></button>"
                                                + "<input type=\"hidden\" name=\"txtId\" value='" + sp.getId() + "'>"
                                                + "</form> "
                                                + "</div>"
                                                + "</div>"
                                                + "</div>"
                                                + "<div class=\"product-content\">"
                                                + "<form action=\"ControllerCart\">"
                                                + "<h3><a class=\"product-des\" href=\"#\">"
                                                + "<button style=\"text-align:left;line-height: 1.5;font-weight:500\" name=\"action\" value=\"View Product\">" + sp.getName() + "</button>"
                                                + "</a></h3>"
                                                + "<input type=\"hidden\" name=\"txtId\" value='" + sp.getId() + "'>"
                                                + "</form> "
                                                + "<div class=\"product-price\">"
                                                + "<span class=\"old\">" + price.substring(0, price.indexOf(".") + 0) + "</span>"
                                                + "<span style=\"color:#ed1b24\">&nbsp;&nbsp;" + priceDiscount.substring(0, priceDiscount.indexOf(".") + 0) + "</span>"
                                                + "</div>"
                                                + "</div>"
                                                + "</div>"
                                                + "</div>");
                                    }
                                }
                            %>
                        </div>
                        <%
//                            out.print(listProduct.size());
//                            int maxPage = listProduct.size() / 7;
//                            out.print("<div class=\"col-12\">"
//                                    + "<div class=\"pagination\">"
//                                    + "<ul class=\"pagination-list\">"
//                                    + "<li><a href=\"#\"><i class=\"ti-arrow-left\"></i></a></li>");
//                            for (int i = 1; i <= Math.ceil(maxPage); i++) {
//                                out.print("<li class=\"pagination-item\"><a href=\"page=" + i + "\">" + i + "</a></li>");
//                            }
//                            out.print("<li><a href=\"#\"><i class=\"ti-arrow-right\"></i></a></li>"
//                                    + "</ul>"
//                                    + "</div>"
//                                    + "</div>");
                        %>
                    </div>
                </div>
            </div>    
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.0.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/slicknav.min.js"></script>
        <script src="js/owl-carousel.js"></script>
        <script src="js/magnific-popup.js"></script>
        <script src="js/facnybox.min.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/finalcountdown.min.js"></script>
        <script src="js/nicesellect.js"></script>
        <script src="js/ytplayer.min.js"></script>
        <script src="js/flex-slider.js"></script>
        <script src="js/scrollup.js"></script>
        <script src="js/onepage-nav.min.js"></script>
        <script src="js/easing.js"></script>
        <script src="js/active.js"></script>
        <script defer="" src="https://static.cloudflareinsights.com/beacon.min.js/v8b253dfea2ab4077af8c6f58422dfbfd1689876627854" integrity="sha512-bjgnUKX4azu3dLTVtie9u6TKqgx29RBwfj3QXYt5EKfWM/9hPSAI/4qcV5NACjwAo8UtTeWefx6Zq5PHcMm7Tg==" data-cf-beacon="{&quot;rayId&quot;:&quot;80c89d1049ef108d&quot;,&quot;version&quot;:&quot;2023.8.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;3248e93e0d6447329c4d6bcc351d5700&quot;,&quot;si&quot;:100}" crossorigin="anonymous"></script>
        <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"><span><i class="fa fa-angle-up"></i></span></a>
    </body>

    <script>
        let pagination = document.querySelectorAll(".pagination-item");
        pagination[0].classList.add('active');
        let urlCurrent = window.location.href;
        let index = urlCurrent.replace("http://localhost:8080/NewFashion/shopSearch.jsp?index=", '');
        if (urlCurrent.includes('index')) {
            for (i = 0; i < pagination.length; i++) {
                pagination[i].classList.remove('active');
            }
        }
        if (!isNaN(Number(index))) {
            pagination[index - 1].classList.add('active')
        }

    </script>
</html>
