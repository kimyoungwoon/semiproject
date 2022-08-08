<%@include file = "payment/header.jsp"  %>
<%@ page contentType="text/html; charset=UTF-8"%>


<script type="text/javascript">

//제품 사진 누르면 상세페이지로 이동
function goProductDetail(productNum) {
	console.log("하이"+ productNum);
	location.href = "../pdetail/pdetail.do?productNum=" + productNum;
}

</script>

<body>  
    <!-- Header Section End -->
    <%@include file = "payment/nav.jsp"  %>
  

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.jsp">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="${sortPath }">
                                <input type="text" placeholder="Search..." name="searchValue">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                    <li><a href="${sortPath }category=1">Men (20)</a></li>
                                                    <li><a href="${sortPath }category=2">Women (20)</a></li>
                                                    <li><a href="${sortPath }category=3">Bags (20)</a></li>
                                                    <li><a href="${sortPath }category=4">Clothing (20)</a></li>
                                                    <li><a href="${sortPath }category=5">Shoes (20)</a></li>
                                                    <li><a href="${sortPath }category=6">Accessories (20)</a></li>
                                                    <li><a href="${sortPath }category=7">Kids (20)</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                                <ul>
                                                    <li><a href="${sortPath }brand=1">Louis Vuitton</a></li>
                                                    <li><a href="${sortPath }brand=2">Chanel</a></li>
                                                    <li><a href="${sortPath }brand=3">Hermes</a></li>
                                                    <li><a href="${sortPath }brand=4">Gucci</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                    </div>	
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><a href="${sortPath }priceMin=0&priceMax=50">$0.00 - $50.00</a></li>
                                                    <li><a href="${sortPath }priceMin=50&priceMax=100">$50.00 - $100.00</a></li>
                                                    <li><a href="${sortPath }priceMin=100&priceMax=150">$100.00 - $150.00</a></li>
                                                    <li><a href="${sortPath }priceMin=150&priceMax=200">$150.00 - $200.00</a></li>
                                                    <li><a href="${sortPath }priceMin=200&priceMax=250">$200.00 - $250.00</a></li>
                                                    <li><a href="${sortPath }priceMin=250">250.00+</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                    </div>
                                    <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                                <label for="xs">xs
                                                	 <input type="radio" id="xs"
                                                	  onclick="location.href='${sortPath }size=1';"/>
                                                </label>
                                                <label for="sm">s
                                                    <input type="radio" id="sm" 
                                                    onclick="location.href='${sortPath }size=2';"/>
                                                </label>
                                                <label for="md">m
                                                    <input type="radio" id="md" 
                                                    onclick="location.href='${sortPath }size=3';"/>
                                                </label>
                                                <label for="xl">xl
                                                    <input type="radio" id="xl"
                                                     onclick="location.href='${sortPath }size=4';"/>
                                                </label>
                                                <label for="xxl">xxl
                                                    <input type="radio" id="xxl" 
                                                    onclick="location.href='${sortPath }size=5';"/>
                                                </label>
                                                <label for="3xl">3xl
                                                    <input type="radio" id="3xl"
                                                     onclick="location.href='${sortPath }size=6';"/>
                                                </label>
                                                <label for="4xl">4xl
                                                    <input type="radio" id="4xl" 
                                                    onclick="location.href='${sortPath }size=7';"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFive">Colors</a>
                                    </div>
                                    <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__color">
                                                <label class="c-1" for="sp-1">
                                                    <input type="radio" id="sp-1"
                                                    onclick="location.href='${sortPath }color=1';"/>
                                                </label>
                                                <label class="c-2" for="sp-2">
                                                    <input type="radio" id="sp-2"
                                                    onclick="location.href='${sortPath }color=2';"/>
                                                </label>
                                                <label class="c-3" for="sp-3">
                                                    <input type="radio" id="sp-3"
                                                    onclick="location.href='${sortPath }color=3';"/>
                                                </label>
                                                <label class="c-4" for="sp-4">
                                                    <input type="radio" id="sp-4"
                                                    onclick="location.href='${sortPath }color=4';"/>
                                                </label>
                                                <label class="c-5" for="sp-5">
                                                    <input type="radio" id="sp-5"
                                                    onclick="location.href='${sortPath }color=5';"/>
                                                </label>
                                                <label class="c-6" for="sp-6">
                                                    <input type="radio" id="sp-6"
                                                    onclick="location.href='${sortPath }color=6';"/>
                                                </label>
                                                <label class="c-7" for="sp-7">
                                                    <input type="radio" id="sp-7"
                                                    onclick="location.href='${sortPath }color=7';"/>
                                                </label>
                                                <label class="c-8" for="sp-8">
                                                    <input type="radio" id="sp-8"
                                                    onclick="location.href='${sortPath }color=8';"/>
                                                </label>
                                                <label class="c-9" for="sp-9">
                                                    <input type="radio" id="sp-9"
                                                    onclick="location.href='${sortPath }color=9';"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseSix">Tags</a>
                                    </div>
                                    <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__tags">
                                                <a href="${sortPath }tag=1">Product</a>
                                                <a href="${sortPath }tag=2">Bags</a>
                                                <a href="${sortPath }tag=3">Shoes</a>
                                                <a href="${sortPath }tag=4">Fashio</a>
                                                <a href="${sortPath }tag=5">Clothing</a>
                                                <a href="${sortPath }tag=6">Hats</a>
                                                <a href="${sortPath }tag=7">Accessories</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 여기까지  -->
                <div class="col-lg-9">
                    <div class="shop__product__option">
                    	
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>Total ${totalDataCount } showing,${totalPage } pages/ Now Page ${pageNum }</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                <form action="document.sortForm" >
                                    <p>Sort by Price:</p>
                                    <select onchange="location.href=this.value">
                                        <option value="http://localhost:8080<%=cp%>/shopping/list.do">New</option>
                                        <option value="http://localhost:8080<%=cp%>/shopping/listsortlow.do?sort=1">Low To High</option>
                                        <option value="http://localhost:8080<%=cp%>/shopping/listsorthigh.do?sort=2">High To Low</option>
                                    </select>
                                </form>    
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                    	<c:forEach var="dto" items="${lists}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${imagePath }/${dto.saveFileName}"
                                onclick = "goProductDetail('${dto.num}');" style="cursor:pointer;">
                                 
                                    <ul class="product__hover">
                                        <li><a href="#"><img src="<%=cp%>/img/icon/heart.png" alt=""></a></li>
                                        <%-- <li><a href="#"><img src="<%=cp%>/img/icon/compare.png" alt=""> <span>Compare</span></a>
                                        </li> --%>
                                       <%--  <li><a href="#"><img src="<%=cp%>/img/icon/search.png" alt=""></a></li> --%>
                                    </ul>
                                </div>
                                
                                <div class="product__item__text">
                                    <h6>${dto.name }</h6>
                                    <a href="<%=cp %>/shopping/addCart.do?productNum=${dto.num}" class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5>&#8361; ${dto.price }</h5>
                                    <div class="product__color__select">
                                        <label for="pc-4">
                                            <input type="radio" id="pc-4">
                                        </label>
                                        <label class="active black" for="pc-5">
                                            <input type="radio" id="pc-5">
                                        </label>
                                        <label class="grey" for="pc-6">
                                            <input type="radio" id="pc-6">
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
					</div>
                        
                      
					<div class="row" ">
						<div class="col-lg-12">
							<div class="product__pagination">

								<a >${pageIndexList }</a>
								<!-- 
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <span>...</span>
                                <a href="#">21</a>
                                 -->
							</div>
						</div>
					</div>

				</div>
                    
              
                </div>
            </div>
    </section>
    <!-- Shop Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="<%=cp%>/img/footer-logo.png" alt=""></a>
                        </div>
                        <p>The customer is at the heart of our unique business model, which includes design.</p>
                        <a href="#"><img src="<%=cp%>/img/payment.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="#">Clothing Store</a></li>
                            <li><a href="#">Trending Shoes</a></li>
                            <li><a href="#">Accessories</a></li>
                            <li><a href="#">Sale</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Payment Methods</a></li>
                            <li><a href="#">Delivary</a></li>
                            <li><a href="#">Return & Exchanges</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>NewLetter</h6>
                        <div class="footer__newslatter">
                            <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                            <form action="#">
                                <input type="text" placeholder="Your email">
                                <button type="submit"><span class="icon_mail_alt"></span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="footer__copyright__text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <p>Copyright ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>2020
                            All rights reserved | This template is made with <i class="fa fa-heart-o"
                            aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        </p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->
	
	
    <%@include file = "payment/footer.jsp"  %>
</body>

</html>