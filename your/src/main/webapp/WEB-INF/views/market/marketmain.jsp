<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<c:set var="cartCount" value="${cartCount}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MainMarketList</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/modal2.css" rel="stylesheet" />
        <link href="css/slide.css" rel="stylesheet" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
        	$('#ca_manu .dropdown-menu').hide();
        	
        	$('#ca_manu').mouseover(function () {
				$('.dropdown-menu').slideDown();
			});
        	$('.dropdown-menu').mouseleave(function () {
				$('.dropdown-menu').hide();
			});
		});
        </script>
        
        <script type="text/javascript">
        $(document).ready(function() {
        $("#btnSearch").click(function () {
        	location.href = "getSearchList.do?search=" + $("#_search").val();	
        	});
        });
        </script>
        
		<script type="text/javascript">
		function addCart(item,num) {
			var count = $('#p_num'+num+'').val();
			var itemnum = item;
			//alert(count);
			var allData = {"itemnum": itemnum, "count":count};
	        
		    $.ajax({
		        url:"addcart2.do",
		        type: "GET",
		        data: allData,
		        success:function(data){
		        	alert("??????????????? ?????? ????????????");
		        	//???????????? ????????? ??????
		        	var num = document.getElementById('CC').innerHTML;
		        	var num2 = parseInt(num) + 1;
		        	document.getElementById('CC').innerHTML = num2;
		        	$('.modal').hide();
		        },
		        error:function(){
		            alert("?????? ??????");
		            self.close();
		     	}
		   }); 	
			
		}
		</script>
        
        
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5" style="font-size: 18px;">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    	<li class="nav-item dropdown" >
                            <a class="nav-link dropdown-toggle" id="ca_manu">?????? ????????????</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="marketlist.do?canum=1" id="canum1">
                                	<img src="./image/meat.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
                                	??????</a>
                                </li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=2" id="canum2">
                                	<img src="./image/fish.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
                                	??????</a></li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=3" id="canum3">
                                	<img src="./image/carrot.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
                                	??????</a></li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=4" id="canum4">
	                                <img src="./image/fruit.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
	                                ??????</a>
                                </li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=5">
                                	<img src="./image/kit.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
                                	?????????</a>
                                </li>
                            </ul>
                        </li>&nbsp;&nbsp;&nbsp;&nbsp;
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="newMarketList.do">?????????</a></li>&nbsp;&nbsp;&nbsp;&nbsp;
                        <li class="nav-item"><a class="nav-link" href="best.do">?????????</a></li>&nbsp;&nbsp;&nbsp;&nbsp;
                        <li class="nav-item"><a class="nav-link" href="#!">??????/??????</a></li>&nbsp;&nbsp;&nbsp;&nbsp;
                    </ul>
                    <form class="d-flex" action="getSearchList.do">
					    <input class="form-control me-2" placeholder="Search" aria-label="Search" id="_search">
					    <button class="btn btn-outline-success" type="button" id="btnSearch">Search</button>
				    </form>&nbsp;&nbsp;&nbsp;&nbsp;
                    <form class="d-flex" action="goCart.do">
                        <button class="btn btn-outline-success" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            ????????????
                            <span class="badge bg-warning text-white ms-1 rounded-pill" id="CC">${cartCount}</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <!-- ????????? ???????????? -->
		<div id="silder">
		  <div class="carousel" duration="3500">
		  <ul>
		    <li id="c1_slide1"><div style=" cursor: pointer; width: 100%; height: 100%;" ></div></li>
		    <li id="c1_slide2"><div style=" cursor: pointer; width: 100%; height: 100%;" ></div></li>  
		    <li id="c1_slide3"><div style=" cursor: pointer; width: 100%; height: 100%;" ></div></li>  
		    <li id="c1_slide4"><div style=" cursor: pointer; width: 100%; height: 100%;" ></div></li>
		<!--     <li id="c1_slide5"><div>  <br /><a href="https://www.google.com">????????????</a></div></li>   -->
		  </ul>
		  <ol>
		    <li><a href="#c1_slide1"></a></li>
		    <li><a href="#c1_slide2"></a></li>
		    <li><a href="#c1_slide3"></a></li>
		    <li><a href="#c1_slide4"></a></li>
		    <!-- <li><a href="#c1_slide5"></a></li> -->
		  </ol>
		  <div class="prev">&lsaquo;</div>
		  <div class="next">&rsaquo;</div>
		</div>
		</div>
        <!-- Section-->
        <section class="py-5">
        <h3 align="center">??? ?????? ??????????</h3>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="market" items="${marketlist}" varStatus="i" begin="0" end="3">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img  style="min-height: 100px; max-height: 300px;" class="card-img-top" src="./marketimage/${market.newmainpt}" alt="???????????????" onclick="location.href='marketdetail.do?seq=${market.seq}'"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" onclick="location.href='marketdetail.do?seq=${market.seq}'">${market.title}</h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${market.price}" pattern="#,###,###"/>???<br>
                                    <a style="font-size: 12px; color: gray;">${market.subtitle}</a>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-success btntt">???????????? ??????</a></div>
					  			<div class="modal">
						    		<div class="modal__overlay">
							    		<div class="modal__content">
								    		<div style="float: left; font-size: 16px;">${market.title}</div><br>
								    		<div><span><fmt:formatNumber value="${market.price}" pattern="#,###,###"/>???</span>
								    		<input type="hidden" id="price${i.count}" value="${market.price}">
								    		<span class="updown" style="float: right;">
											  	<img alt="" src="./image/minus.png" style="width: 20px;" class="down" onclick="javascript:basket.changePNum('${i.count}');">
											  	<input type="text" readonly="readonly" value="1" style="width: 35px; height:30px; text-align: center; border: 0px;"
											  	 name="p_num${i.count}" id="p_num${i.count}" class="p_num" onkeyup="javascript:basket.changePNum('${i.count}');">
											  	<img alt="" src="./image/plus.png" style="width: 20px;" class="up" onclick="javascript:basket.changePNum('${i.count}');">
										  	</span>
										  	</div>
										  	<br>
										  	<br>
											<div class="sum" style="font-weight: bold; font-size: 20px; line-height: 20px;" >
												<a style="width: 150px; margin-left: 60px;">??? ?????? ?????? :</a>
												<input type="text" id="totalPrice${i.count}" style="border: 0px; width: 100px; text-align: right; margin-left: 40px;" value="<fmt:formatNumber value="${market.price}" pattern="#,###,###" />" />???
											</div>
											<br>
											<a type="button" style="float: left; margin-left: 50px; size: 50px;" class="btn btn-outline-danger close">??????</a>
											<a type="button" style="float: right; margin-right: 30px;" class="btn btn-outline-success" onclick="addCart('${market.itemnum}','${i.count}');">???????????? ??????</a>
		    							</div>
	    							</div>
 			 					</div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <section class="py-5">
        <h3 align="center">?????? ??????</h3>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="best" items="${bestmarketlist}" varStatus="i" begin="0" end="3">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img style="min-height: 100px; max-height: 300px;"  class="card-img-top" src="./marketimage/${best.newmainpt}" alt="..." onclick="location.href='marketdetail.do?seq=${best.seq}'"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" onclick="location.href='marketdetail.do?seq=${best.seq}'">${best.title}</h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${best.price}" pattern="#,###,###"/>???<br>
                                    <input type="hidden" id="bestPrice${i.count}" value="${best.price}">
                                    <a style="font-size: 12px; color: gray;">${best.subtitle}</a>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-success btntt">???????????? ??????</a></div>
					  			<div class="modal">
						    		<div class="modal__overlay">
							    		<div class="modal__content">
								    		<div style="float: left;">${best.title}</div><br>
								    		<div><span><fmt:formatNumber value="${best.price}" pattern="#,###,###"/>???</span>
								    		<span class="updown" style="float: right;">
											  	<img alt="" src="./image/minus.png" style="width: 20px;" class="down" onclick="javascript:basket.changePNum1('${i.count}');">
											  	<input type="text" readonly="readonly" value="1" style="width: 35px; height:30px; text-align: center; border: 0px;"
											  	 name="p_num${i.count}" id="best${i.count}" class="p_num" onkeyup="javascript:basket.changePNum1('${i.count}');">
											  	<img alt="" src="./image/plus.png" style="width: 20px;" class="up" onclick="javascript:basket.changePNum1('${i.count}');">
										  	</span>
										  	</div>
										  	<br>
										  	<br>
											<div class="sum" style="font-weight: bold; font-size: 20px; line-height: 20px;" >
												<a style="width: 150px; margin-left: 60px;">??? ?????? ?????? :</a>
												<input type="text" id="totalPriceA${i.count}" style="border: 0px; width: 100px; text-align: right; margin-left: 40px;" value="<fmt:formatNumber value="${best.price}" pattern="#,###,###" />" />???
											</div>
											<br>
											<a type="button" style="float: left; margin-left: 50px; size: 50px;" class="btn btn-outline-danger close">??????</a>
											<a type="button" style="float: right; margin-right: 30px;" class="btn btn-outline-success" onclick="addCart('${best.itemnum}','${i.count}');">???????????? ??????</a>
		    							</div>
	    							</div>
 			 					</div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
		<!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="./marketimage/eventbaner1.png" alt="..." /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">?????? ?????? 2???</h1>
                    <br>
                    <h3>17,500???</h3>
                    <p>??????????????? ????????? ???????????? ????????? ???????????? ??? ??? ?????? ????????? ?????? ?????? ????????? ???????????? ??????! ??????????????? ????????? ????????? ?????? ????????? ?????????
                       ????????? ????????? ??? ????????? ???????????????.    
                    </p>
                    <br><br><br><br><br><br><br><br><br>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        <!-- ????????? -->
		<script type="text/javascript">
			
			// Modal??? ????????????
			var modals = document.getElementsByClassName("modal");
			// Modal??? ????????? ????????? ????????? ????????????.
			var btns = document.getElementsByClassName("btntt");
			// Modal??? ?????? close ???????????? ????????????.
			var spanes = document.getElementsByClassName("close");
			var funcs = [];
			
			// Modal??? ????????? ?????? ?????? ???????????? ????????? ??????
			function Modal(num) {
				return function(){
					// ?????? ???????????? ????????? ???????????? Modal??? ?????????.
					btns[num].onclick = function(){
						modals[num].style.display = "block";
						//console.log(num);
					};
					
					// ?????? ?????? ???????????? Modal??? ?????????.
					spanes[num].onclick = function() {
						modals[num].style.display = "none";
					};
				};
			}
			// ????????? Modal ????????? Modal ????????? ???????????? funcs ????????? ????????????.
			for(var i = 0; i< btns.length; i++){
				funcs[i] = Modal(i);
			}
			// ????????? Modal ????????? funcs ????????? ????????????.
			for(var j = 0; j< btns.length; j++){
				funcs[j]();
			}
			// Modal ?????? ?????? ???????????? Modal??? ?????????.
			window.onclick = function(event) {
				if(event.target.className == "modal"){
					event.target.style.display = "none";	
				}
			};
		
		</script>
		
	<script type="text/javascript">
	let basket = {
		    totalCount: 0, 
		    totalPrice: 0,
		    
		    //?????? ?????? ??????
		    changePNum: function (pos) {
		        var item = document.querySelector('input[name=p_num'+pos+']');
		        var p_num = parseInt(item.getAttribute('value'));
		        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
		        
		        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

		        item.setAttribute('value', newval);
		        item.value = newval;

		        var price = $('#price'+pos+'').val();
		        //console.log("price>>>>"+price);
		        var totalPrice = (newval * price);
		        //console.log("totalPrice>>>>"+totalPrice);
				$('input[id=totalPrice'+pos+']').attr('value',totalPrice.formatNumber());
		        
		    },
		    changePNum1: function (pos) {
		        var item = document.querySelector('input[id=best'+pos+']');
		        var p_num = parseInt(item.getAttribute('value'));
		        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
		        
		        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

		        item.setAttribute('value', newval);
		        item.value = newval;

		        var price = $('#bestPrice'+pos+'').val();
		        var totalPrice = (newval * price);
		        $('input[id=totalPriceA'+pos+']').attr('value',totalPrice.formatNumber());
				//console.log("bestPrice>>>>"+price);
		        
		    }
		}

		// ?????? 3?????? ????????????
		Number.prototype.formatNumber = function(){
		    if(this==0) return 0;
		    let regex = /(^[+-]?\d+)(\d{3})/;
		    let nstr = (this + '');
		    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
		    return nstr;
		};
	</script>	
    
    <script type="text/javascript">
    
    /* ????????? ??????????????? */
    document.addEventListener('DOMContentLoaded', function() {
     
      const carousels = document.querySelectorAll('.carousel');
      carousels.forEach(function( carousel ) {
    
        const ele = carousel.querySelector('ul');
        const bullets = carousel.querySelectorAll('ol li');
        const nextarrow = carousel.querySelector('.next');
        const prevarrow = carousel.querySelector('.prev');
        bullets[0].classList.add('selected');
    
        const setSelected = function() {
            bullets.forEach(function(bullet) {
               bullet.classList.remove('selected');
            });
            let nthchild = (Math.round(ele.scrollLeft/carousel.scrollWidth)+1);
            carousel.querySelector('ol li:nth-child('+nthchild+')').classList.add('selected'); 
        }
        
        const nextSlide = function() {
          if(!carousel.querySelector('ol li:last-child').classList.contains('selected')) {
            carousel.querySelector('ol li.selected').nextElementSibling.querySelector('a').click();
            ele.scrollLeft = ele.scrollLeft + carousel.scrollWidth;
          } else {
            carousel.querySelector('ol li:first-child a').click();
            ele.scrollLeft = 0;
          }
        }
    
        const prevSlide = function() {
          if(!carousel.querySelector('ol li:first-child').classList.contains('selected')) {
            carousel.querySelector('ol li.selected').previousElementSibling.querySelector('a').click();
            ele.scrollLeft = ele.scrollLeft - carousel.scrollWidth;
          } else {
            carousel.querySelector('ol li:last-child a').click();
            ele.scrollLeft = ele.scrollWidth - carousel.scrollWidth;
          }
        }
          
        // Attach the handlers
        ele.addEventListener("scroll", setSelected);
        nextarrow.addEventListener("click", nextSlide);
        prevarrow.addEventListener("click", prevSlide);
    
        //setInterval for autoplay
        if(carousel.getAttribute('duration')) {
          setInterval(function(){ 
            if (ele != document.querySelector(".carousel:hover ul")) {
              if(ele.scrollWidth > ele.scrollLeft + carousel.scrollWidth) {
                ele.scrollLeft = ele.scrollLeft + carousel.scrollWidth;
              } else ele.scrollLeft = 0;
            }
          }, carousel.getAttribute('duration'));
        }
        
      }); //end foreach
      
    }); //end onload
    </script>
		
    </body>
</html>



