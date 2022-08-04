<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHTRIP :: 함께라서 좋은 여행</title>
<!-- 영어폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&family=Raleway:wght@300&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Babylonica&family=Noto+Sans+KR:wght@300&family=Raleway:wght@300&display=swap');


/* 전체페이지 */
.goods-page {
/*    box-sizing: border-box; */
   width: 100%;
   height: 100%;
   display: block;
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 16px;
/*    background-color: #F6F6F6 !important; */
}
/* 페이지 헤더 */
.page-head {
   background: url(resources/images7/s2.jpg);
   background-size: cover;
   background-position: center;
   background-repeat: no-repeat;
}

.header-wrapper {
   background-color: rgba(0, 0, 0, 0.30);
   position: relative;
   padding: 120px 0px;
}

.container2 {
   padding-right: 115px;
   padding-left: 115px;
   margin-right: auto;
   margin-left: auto;
   box-sizing: border-box;
}

.goods-title {
   background-color: transparent;
   font-size: 17px;
   float: left;
   list-style: none;
}

.row2{
	width: 1220px;
    margin: 0px auto;
    display: flex;
    padding: 0;
    flex-wrap: wrap;
}

.goods-title-li {
   color: white;
   display: block;
   margin-bottom: 3px;
   font-size: 15px;
}

#goods-title-text {
   font-size: 35px;
   font-family: 'Raleway', sans-serif;
}
#goods-title-text2{
   font-family: 'Raleway', sans-serif;
}
.img-title {
   display: block;
   position: relative;
   max-width: 100%;
   height: auto;
}

/* 카테고리 */
.goods-category {
   margin-bottom: 8px;
    width: 80px;
    height: 80px;
    border-radius: 50%;
    border: 3px solid #EAEAEA;
}

.goods-category:hover{
   border: 3px solid #4285F4;
}

#bag {
   background: url(resources/images7/bag.JPG);
   background-size: cover;
   background-position: center;
   background-repeat: no-repeat;
}

#safety {
   background: url(resources/images7/safety.JPG);
   background-size: cover;
   background-position: center;
   background-repeat: no-repeat;
}

#etc {
   background: url(resources/images7/etc.JPG);
   background-size: cover;
   background-position: center;
   background-repeat: no-repeat;
}

.category-group {
   justify-content: space-around;
   display: flex;
   text-align: center;
   padding: 60px 280px 60px 280px;
}
/* 검색창 */
#search{
   text-align: center;
}

#searchValue:focus {
   outline:2px solid #4285F4;
}

#searchValue{
    background-image: url(resources/images7/search.png);
    opacity: 0.5;
    background-position: 8px center;
    background-repeat: no-repeat;
    background-size: 37px;
    border: 2px solid #ccc; 	/* 2px로 수정 */
    border-radius: 80px;
    padding: 11px 5px;
    text-indent: 46px;
    width: 745px;
    height: 58px;
}

#serchValue :focus{
     background-size: 25px;
}

/* 용품리스트 */
.goods-list {
   width: 33.3%;
}

.goods-list-in {
   padding-bottom: 10px;
}

.goods-list-space {
   padding: 50px;
}

.box-shadow {
   cursor: pointer;
   box-shadow: 5px 5px 5px 5px #EDEDED;
}

.goods-img {
   position: relative;
   overflow:hidden;
   height:300px;
   text-align: center;
   background-color: #fff;
}

.goods-img-1 {
   position: relative;
    max-width: 100%;
    height: auto;
    width: 100%;
    height: 100%;
    text-align: center;
    background-position: center;
    background-repeat: no-repeat;
    background-size: 100%;
    text-indent: -9999px;
}

.goods-img-1:hover {
transition: all 0.6s ease-in-out;
   transform: scale(1.2);
}

.goods-list-text {
   margin: 10px 10px 0px 10px;
   color: black;
   text-align: center;
}

.goods-price {
   color: #6495ED;
   font-size: 22px;
   font-weight: bolder;
   font-size: 22px;
   margin: 10px 10px 0px 10px;
   text-align: center;
}

.goods-category-pointer {
   cursor: pointer;
}


/* 글쓰기 버튼 */
#goods-writing {
   margin-left: 80%;
   margin: 0 0 20px 83%;
   width: 70px;
   height: 30px;
   font-size: 15px;
   background: #6495ED;
   cursor: pointer;
   border-style: none;
   color: white;
   border-radius: 3px;
}

#goods-writing:hover {
   background-color: black;
   color: white;
}


/* 페이징버튼 */
.paging-button {
   background-color: white;
   border: 1px solid #e6e6e6;
   width: 40px;
   height: 40px;
   border-radius: 50%;
   margin-bottom: 60px;
   font-weight: 700;
   color: #4285F4;
}

.paging-button:hover {
   background-color: #4285F4;
   color: white;
}

#searchBtn {
   margin-left: 10px;
   width: 50px;
   height: 40px;
   font-size: 15px;
   background: #6495ED;
   cursor: pointer;
   border-style: none;
   color: white;
   border-radius: 30px;
}

.goods-Barnd {
	color: #b2b2b2;
	text-decoration: underline;
	font-weight: bold;
	margin: 10px 10px 0px 10px;
    text-align: center;
}

.soldOutBox {
	display: grid;
    width: 90%;
    align-content: space-between;
}

.soldOut {
	position: relative;
/*     margin: -100px 100px 100px 150px; */
     margin: -300px 100px 100px 0px; 
    width: 100px;
    height: 30px;
    background-color: rgba(0, 0, 0, 0.5);
/*     border-radius: 57px;    */
}

#soldoutExc {
	text-align: right;
/*     margin-right: 200px; */
    margin-bottom: 20px;
}

.saleGList {
	border: 1px soild black;
	border-radius: 5px;
	background-color: #6496ed;
	color: #fff;
	padding: 5px;
	display: inline-block;
}

#goodsAll, #goodsExc {
	border: none;
}

.select_type {
	text-align: right;
}

.count {
	float: left;
	text-align: left;
}

.sort_menu {
	padding: 0px 180px;
}

.name_select::before {
	content: "|";
    margin-right: 5px; 
    color: #999;
    margin-bottom: 1px;
}

.name_select:first-child::before {
	content: "";
}

#nodata {
	 text-align: center; 
	 margin: 150px 0px 150px 0px;
}

</style>

<script src="https://kit.fontawesome.com/dd62c289ec.js" crossorigin="anonymous"></script>

</head>
<body>

<c:import url="../common/navbar.jsp"/>
	
      <!-- 이미지-헤더-start -->
      <div class="page-head">
         <div class="header-wrapper">
            <div class="container2">
               <div class="row2">
                  <ol class="goods-title">
                     <li class="goods-title-li" id="goods-title-text"><b>Goods</b></li>
                     <li class="goods-title-li" id="goods-title-text2">the sale of travel supplies</li>
                  </ol>
               </div>
            </div>
         </div>
      </div>
      <!-- 이미지-헤더-end -->
      
     
      <!-- 카테고리 -->
      <div class="container2">
         <div class="category-group">
            <div class="goods-category-pointer">
               <div class="goods-category" id="bag"></div>
               <b>가방</b>
            </div>
            <div class="goods-category-pointer">
               <div class="goods-category" id="safety"></div>
               <b>안전 용품</b>
            </div>
            <div class="goods-category-pointer">
               <div class="goods-category" id="etc"></div>
               <b>악세사리</b>
            </div>
         </div>
      </div>
      <!-- 카테고리-end -->
      
      <!-- 검색창 	위치 수정-->
      <div id="search">
         <input id="searchValue" type="search" placeholder="상품을 검색해보세요!" onkeyup="enterkey();">
<!--          <button id="searchBtn">검색</button> -->
      </div>
      <br>
      <!-- 검색창-end --> 
      	         
 	  	
  	 <!-- sort --> 	
 	  	<div class="list-ability">
 	  	  <div class="sort_menu">
 	  	  
 	  	  <!-- 품절 버튼 -->
	 	  	<div id="soldoutExc">
				<c:set var="path" value="${ requestScope['javax.servlet.forward.servlet_path']}"/> 
				<c:if test="${ path eq '/glist.go' }">
		 	  		<input type="button" id="goodsExc" class="saleGList" value="품절 상품 제외" onclick="location.href='saleGoods.go';">		
		 	  	</c:if>			
		 	  	<c:if test="${ path eq '/saleGoods.go' }">	
		 	  		<input type="button" id="goodsAll" class="saleGList" value="품절 상품 포함" onclick="location.href='glist.go'">
	 	  		</c:if>					
 	 		 </div>
 	 		 	
<!-- 			<div> -->
<!-- 				<p class="count"> -->
<%-- 				   <span class="inner_count">총 ${ listCount }개</span> --%>
<!-- 				</p> -->
<!-- 				<div class="select_type"> -->
<!-- 				   <a class="name_select" id="new" onclick="getList();">신상품순</a> -->
<!-- 				   <a class="name_select" id="sale" onclick="getList();">판매량순</a> -->
<!-- 				   <a class="name_select" id="low" onclick="getList();">낮은 가격순</a> -->
<!-- 				   <a class="name_select" id="high" onclick="getList();">높은 가격순</a> -->
<!-- 				   <a class="name_select" id="review">후기 많은 순</a> -->
<!-- 				</div> -->
<!-- 			</div>	 	  			 -->
<!--  	  		</div> -->
   	  </div>
  	  
 	 <div>
     	<div class="goods-page" id="selectType">
	      <c:if test="${ empty gList }">
	         <div id="nodata">등록된 용품이 없습니다.</div>
	      </c:if>

	     <!-- 용품 리스트 -->
	     <c:if test="${ !empty gList }">
	         <div class="row2">
	         
	            <!-- 리스트 1 -->
	<%--             <c:forEach var="g" items="${ gList }">       --%>
	            <c:forEach var="i" begin="0" end="${ gList.size()-1 }">  
	                  <div class="goods-list">
	                     
	                     <div class="goods-list-space">
	                        <div class="box-shadow">
	                           <input type="hidden" value=${ gList[i].goodsId } class="goodsId">
	                           <c:if test="${ gList[i].goodsId == gList[i].boardId }">               
	                                 <c:if test="${ gList[i].stock <= 0 }">
	                                    <div class="goods-img" style="background-color: black;">
	                                       <img id="gthumbnail${i}" class="goods-img-1" src="${contextPath}/resources/guploadFiles/${ gList[i].changeName }" style="opacity: 0.7;">
	                                       <div class="soldOutBox">
	                                          <div class="soldOut">SOLD OUT</div>
	                                       </div>
	                                    </div>
	                                 </c:if>
	                                 <c:if test="${ gList[i].stock > 0 }">
	                                    <div class="goods-img">
	                                       <img id="gthumbnail${i}" class="goods-img-1" src="${contextPath}/resources/guploadFiles/${ gList[i].changeName }">
	                                    </div>
	                                 </c:if>
	                           </c:if>
	                           <div class="goods-list-in">
	                              <p class="goods-Barnd" id="goods-Barnd${i}">${ gList[i].goodsBrand }</p>
	                              <p class="goods-list-text" id="goods-Name${i}">${ gList[i].goodsName }</p>
	                              <p class="goods-price" id="goods-price${i}">
	                                    <c:set var="price" value="${ gList[i].price }"/>
	                           ${ fn:split(price,'/')[0]}원
	                        </p>
	                           </div>
	                        </div>
	                      </div>
	                  
	                  </div>
	            </c:forEach>      
	         </div>
	     </c:if> 
	  </div>   
	      
	      <c:if test="${ !empty sessionScope.loginUser && loginUser.managerYN == 'Y' }">
	         <button id="goods-writing" onclick="location.href='goodsWriteForm.go';">글쓰기</button>
	      </c:if>
	      
	      
	      <!-- 페이징 처리 -->
	      <c:if test="${ !empty gList }">
	         <div class="paging" align="center" id="pagination";>
	         <c:if test="${ pi.currentPage <= 1 }">
	            <button class="paging-button">&lt;</button>
	         </c:if>
	         <c:if test="${ pi.currentPage > 1 }">
	               <c:url value="${ loc }" var="glistBack">
	               <c:param name="page" value="${ pi.currentPage - 1 }"/>
	                     <c:if test="${ !empty searchgName }">
	                  	 	<c:param name="searchGoods" value="${searchgName}"/>
	               	  	 </c:if>
	               	  	  <c:if test="${ !empty category }">
	                  	 	<c:param name="category" value="${category}"/>
	               	  	 </c:if>    
	               </c:url>
	               <button type="button" onclick="location.href='${ glistBack }'" class="paging-button">&lt;</button>
	            </c:if>
	            
	            <!-- 페이지 -->
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	               <c:if test="${ p eq pi.currentPage }">
	                  <button class="paging-button" style="background-color:#6495ED; color:white;">${ p }</button>
	               </c:if>
	               
	               <c:if test="${ p ne pi.currentPage }">
	                 <c:url value="${ loc }" var="glistNum">
	                     <c:param name="page" value="${ p }"/>
						 <c:if test="${ !empty searchgName }">C
	                  	 	<c:param name="searchGoods" value="${searchgName}"/>
	               	  	 </c:if>
	               	  	 <c:if test="${ !empty category }">
	                  	 	<c:param name="category" value="${category}"/>
	               	  	 </c:if>    
	                  </c:url>
	                  <button type="button" onclick="location.href='${ glistNum }'" class="paging-button" id="pagingBtn">${ p }</button>
	               </c:if>
	            </c:forEach>
	            
	            <!-- [다음] -->
	            <c:if test="${ pi.currentPage >= pi.maxPage }">
	               <button class="paging-button">&gt;</button>
	            </c:if>
	            <c:if test="${ pi.currentPage < pi.maxPage }">
	                 <c:url value="${ loc }" var="glistNext">
	                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
						 <c:if test="${ !empty searchgName }">	
	                  	 	<c:param name="searchGoods" value="${searchgName}"/>
	               	  	 </c:if>
	               	  	 <c:if test="${ !empty category }">
	                  	 	<c:param name="category" value="${category}"/>
	               	  	 </c:if>      
	               </c:url>
	               <button type="button" onclick="location.href='${ glistNext }'" class="paging-button">&gt;</button>
	            </c:if>
	        </div>
	       </c:if>
	      <!-- 페이징 처리 끝 -->
	   </div>   

      <script>
    		$('.goods-list-space').find('div').click(function(){
    			var gId = $(this).find('.goodsId').val();
//     			console.log(gId);
				location.href = 'gdetail.go?gId=' + gId + "&page=" + ${ pi.currentPage };
    		});
    		
      </script>	
    		
      <script>		
    		// 검색 시 엔터키 함수
    		function enterkey() {
				if(window.event.keyCode == 13) {
             	   // 엔터키가 눌렸을 때 실행할 내용
             	   var searchgName = document.getElementById('searchValue').value;
				   if(searchgName.length == 0 || searchgName == '') {
					   alert('상품 명을 입력해주세요!');
				   } else {
					   location.href = 'search.go?searchGoods=' + searchgName;
				   }
        		}
			}
      </script>
      
      <script>
      
      	// 카테고리분류
      	$('.goods-category').click(function(){
      		var cate = $(this).attr("id");
//       		console.log(id);
			location.href='gCate.go?category=' + cate			
			
      	});
      
      	
      	$(document).ready(function(){
      		var url = $(location).attr('search');
//       		console.log(url);
			if(url == '?category=bag') {
				$('#bag').css('border', '3px solid #4285F4');
			} else if(url == '?category=safety') {
				$('#safety').css('border', '3px solid #4285F4');
			} else if(url == '?category=etc') {
				$('#etc').css('border', '3px solid #4285F4');
			}
//      	       	
      	});
      	
      </script>
      
      <script>
      	$(document).ready(function(){
      		var list = new Array();
			<c:forEach items="${gList}" var="glist">
				list.push("${glist.stock}");
			</c:forEach>
			
			for(var i = 0; i < list.length; i++) {
      			if(list[i] <= 0) {
      				$(".goods-img-1").css("color", "white");
      			}
      		}	
      	
      	});
      	
      	
    // 선택 항목으로 글 조회
	function getList(page) {
     	$(".name_select").click(function(){
      		var select_type = $(this).attr("id");
//       		console.log(select_type);
      		
      		var pageSize = 6;
      		var maxPage = 0;
      		var curPage = 1;
      		if(page != null) {
      			curPage = page;
      		}
      		$("#pagingBtn").text(curPage); // 페이지 바꿔주기
      		
      		$.ajax({
      			url: 'select_type.go',
      			data: {select_type:select_type},
      			success: function(data){
//       				console.log(data);
      				
      				var listCount = data.length;
//       				console.log(listCount);
      				
      				if(data.length > 0) {
      					for(var i = 0; i < data.length; i++){
      						if(data[i].goodsId == data[i].boardId) {
      							$("#gthumbnail"+i).attr("src", "${contextPath}/resources/guploadFiles/" + data[i].changeName);
      						}
								$("#goods-Barnd"+i).text(data[i].goodsBrand);
								$("#goods-Name"+i).text(data[i].goodsName);
								$("#goods-price"+i).text(data[i].price);
								
								if(listCount != 0) {
									maxPage = Math.ceil(listCount / pageSize);
									var htmlStr = pageLink(curPage, maxPage, "getList");
									$("#pagination").html(htmlStr);
									
									console.log(curPage);
								}
      					}
      				} else {
      					$("#nodata").text("등록된 용품이 없습니다.");
      				}
      			},
      			error: function(data){
      				console.log(data);
      			}
      		});
      	});
     }

     	function pageLink(curPage, maxPage, funName) {
     		var pageUrl = "";
     		
     		var pageLimit = 5;
     		var startPage = parseInt((curPage - 1) / pageLimit) * pageLimit + 1;
     		var endPage = startPage + pageLimit - 1;
     		
     		if (maxPage < endPage) {
     		    endPage = maxPage;
     		}
     		
     		var nextPage = endPage + 1;
     		console.log(curPage,"curPage,",startPage,"startPage,",endPage,"endPage,",nextPage,"nextPage")
     		
     		//맨 첫 페이지
     		if (curPage > 1 && pageLimit < curPage) {
     		    pageUrl += "<a class='page first' href='javascript:" + funName + "(1);'>&lt;</a>";
     		}
     		//이전 페이지
     		if (curPage > pageLimit) {
     		    pageUrl += "<a class='page prev' href='javascript:" + funName + "(" + (startPage == 1 ? 1 : startPage - 1) + ");'><i class='fas fa-angle-left'></a>";
     		}
     		//~pageLimit 맞게 페이지 수 보여줌
     		for (var i = startPage; i <= endPage; i++) {
     		    //현재페이지면 진하게 표시
     		    if (i == curPage) {
     		        pageUrl += "<a href='#'><strong>" + i + "</strong></a>"
     		    } else {
     		        pageUrl += "<a href='javascript:" + funName + "(" + i + ");'> " + i + " </a>";
     		    }
     		}
     		//다음 페이지
     		if (nextPage <= maxPage) {
     		    pageUrl += "<a class='page next' href='javascript:" + funName + "(" + (nextPage < maxPage ? nextPage : maxPage) + ");'><i class='fas fa-angle-right'></a>";
     		}
     		//맨 마지막 페이지
     		if (curPage < maxPage && nextPage < maxPage) {
     		    pageUrl += "<a class='page last' href='" + funName + "(" + maxPage + ");'><i class='fas fa-angle-double-right'></a>";
     		}
     		console.log(pageUrl);
     		
     		return pageUrl;
     	}
     	
     // 테스트 시작

      	
    </script>
      

      
   
   
<c:import url="../common/footer.jsp"/>
</body>
</html>