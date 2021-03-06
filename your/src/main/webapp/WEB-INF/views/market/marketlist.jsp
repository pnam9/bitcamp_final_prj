<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<c:set var="cartCount" value="${cartCount}"/>
<c:set var="canum" value="${canum}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MarketCaList</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/modal2.css" rel="stylesheet" />
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
                                <li><a class="dropdown-item" href="marketlist.do?canum=1">
                                	<img src="./image/meat.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
                                	??????</a>
                                </li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=2">
                                	<img src="./image/fish.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
                                	??????</a></li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=3">
                                	<img src="./image/carrot.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
                                	??????</a></li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=4">
	                                <img src="./image/fruit.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
	                                ??????</a>
                                </li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=5">
                                	<img src="./image/kit.png" alt="???????????? ?????????" style="width: 24px; height: 24px;">
                                	?????????</a>
                                </li>
                            </ul>
                        </li>&nbsp;&nbsp;&nbsp;&nbsp;
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="newMarketList.do">?????????</a></li>&nbsp;&nbsp;&nbsp;&nbsp;
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
        <header class="bg-white py-5">
        <c:choose>
	    	<c:when test="${canum eq 1}">
	        	<img alt="" src="./marketimage/meatbaner.png">
	   		</c:when>
	   		
	    	<c:when test="${canum eq 2}">
	        	<img alt="" src="./marketimage/susanbaner.png">
	    	</c:when>
	    	
	    	<c:when test="${canum eq 3}">
	        	<img alt="" src="./marketimage/subbaner.png">
	    	</c:when>
	    	
	    	<c:when test="${canum eq 4}">
	        	<img alt="" src="./marketimage/fruitbaner.png">
	    	</c:when>
	    	
	    	<c:otherwise>
	        	<img alt="" src="./marketimage/kitbaner.png">
    		</c:otherwise>
		</c:choose>
            
        </header>
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-left">
                    <c:forEach var="ca" items="${calist}" varStatus="i" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <!-- ????????? ?????? ?????? !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                            <img style="min-height: 100px; max-height: 300px;" class="card-img-top" src="./marketimage/${ca.newmainpt}" alt="..." onclick="location.href='marketdetail.do?seq=${ca.seq}'"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" onclick="location.href='marketdetail.do?seq=${ca.seq}'">${ca.title}</h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${ca.price}" pattern="#,###,###"/>???<br>
                                    <a style="font-size: 12px; color: gray;">${ca.subtitle}</a>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="text-center"><a class="btn btn-outline-success btntt">???????????? ??????</a></div>
					  			<div class="modal">
						    		<div class="modal__overlay">
							    		<div class="modal__content">
								    		<div style="float: left; font-size: 16px;">${ca.title}</div><br>
								    		<div><span><fmt:formatNumber value="${ca.price}" pattern="#,###,###"/>???</span>
								    		<input type="hidden" id="price${i.count}" value="${ca.price}">
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
												<input type="text" id="totalPrice${i.count}" style="border: 0px; width: 100px; text-align: right; margin-left: 40px;" value="<fmt:formatNumber value="${ca.price}" pattern="#,###,###" />" />???
											</div>
											<br>
											<a type="button" style="float: left; margin-left: 50px; size: 50px;" class="btn btn-outline-danger close">??????</a>
											<a type="button" style="float: right; margin-right: 30px;" class="btn btn-outline-success" onclick="addCart('${ca.itemnum}','${i.count}');">???????????? ??????</a>
		    							</div>
	    							</div>
 			 					</div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
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
						console.log(num);
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
    </body>
</html>

