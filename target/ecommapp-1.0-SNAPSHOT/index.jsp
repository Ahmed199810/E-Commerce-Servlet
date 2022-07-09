<%-- 
    Document   : index
    Created on : Jun 28, 2022, 7:50:28 PM
    Author     : Ahmed
--%>


<%@page import="com.ecommapp.models.Product"%>
<%@page import="com.ecommapp.dao.CategoryDao"%>
<%@page import="com.ecommapp.models.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommapp.dao.ProductDao"%>
<%@page import="com.ecommapp.database.DBConnect"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    CategoryDao categories = new CategoryDao(DBConnect.getConn());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container">
            
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <div class="numbertext">1 / 3</div>
                    <img src="https://eg.jumia.is/cms/27-22/-UNs-Deals/Beat-The-Heat/Slider/Air_Conditioners-slider-Desktop_AR.jpg" style="width:100%">
                    <div class="text">Caption Text</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">2 / 3</div>
                    <img src="https://eg.jumia.is/cms/27-22/UNs/Beat-the-Heat/slider-Desktop_AR.png" style="width:100%">
                    <div class="text">Caption Two</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">3 / 3</div>
                    <img src="https://eg.jumia.is/cms/27-22/UNs/Eid-Deals/edited/slider-Desktop_AR-(14)-(1).jpg" style="width:100%">
                    <div class="text">Caption Three</div>
                </div>

                <!-- Next and previous buttons -->
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>

            </div>
            <br>
            <!-- The dots/circles -->
            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>
            
            <br>
            <br>
            <div class="category-container">

                <%                    
                    List<Category> categs = categories.getAllCategories();
                    for (Category category : categs) {
                %>
                <a class="home-category" href="products?category=<%=category.getId()%>">
                    <div class="cat-item">
                        <img src="<%=category.getImg()%>">
                        <h5><span><%=category.getTitle()%> </span></h5>
                    </div>
                </a>
                <%
                    }
                %>

            </div>
            <br>
            <br>
            <br>
            <br>
            <h2>Latest Products</h2>
            <br>
            <br>
            <div>
                <%
                    ProductDao proDao = new ProductDao(DBConnect.getConn());
                    List<Product> products = proDao.getLastProducts();
                    for (Product product : products) {
                %>
                    <a class="home-product" href="product_preview?product=<%=product.getId()%>">
                        <div class="pro-item">
                            <img src="<%=product.getImg()%>" width="150">
                            <h5><span><%=product.getTitle()%> </span></h5>
                            <p><%=product.getPrice()%> USD</p>
                        </div>
                    </a>
                <%
                    }
                %>

            </div>
            <br>
            <br>
            <br>
            <br>
            <br>

        </div>
                
                

        <%@include file="components/footer.jsp"%>
        
        <script>
            let slideIndex = 1;
            showSlides(slideIndex);

            // Next/previous controls
            function plusSlides(n) {
              showSlides(slideIndex += n);
            }

            // Thumbnail image controls
            function currentSlide(n) {
              showSlides(slideIndex = n);
            }

            function showSlides(n) {
              let i;
              let slides = document.getElementsByClassName("mySlides");
              let dots = document.getElementsByClassName("dot");
              if (n > slides.length) {slideIndex = 1}
              if (n < 1) {slideIndex = slides.length}
              for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
              }
              for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
              }
              slides[slideIndex-1].style.display = "block";
              dots[slideIndex-1].className += " active";
            }
        </script>
    </body>
</html>