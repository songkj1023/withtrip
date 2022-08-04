<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>WITHTRIP :: 함께라서 좋은 여행</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

  
<!--     <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet"> -->
<!--     <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet"> -->
<!--     <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet"> -->

    <link rel="stylesheet" href="resources/css6/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="resources/css6/animate.css">
    
    <link rel="stylesheet" href="resources/css6/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css6/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css6/magnific-popup.css">

    <link rel="stylesheet" href="resources/css6/aos.css">

    <link rel="stylesheet" href="resources/css6/ionicons.min.css">

    <link rel="stylesheet" href="resources/css6/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/css6/jquery.timepicker.css">
    <link rel="stylesheet" href="resources/css6/flaticon.css">
    <link rel="stylesheet" href="resources/css6/icomoon.css">
    <link rel="stylesheet" href="resources/css6/style.css">
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/fa40c2d47c.js" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
   
<style>
   body{background: #eee}
   .fs-14{font-size: 14px}
   .form-control{width: 100%;height: 140px; resize: none;border:2px solid #eee}
   .form-control:focus{box-shadow: none}
   .comment-area{position: relative;}
   .post-btn{height: 50px;font-size: 16px; color:#FFF; border:none; border-radius: 10px; margin-top: 5px; background-color: #6495ED; transition: background 0.3s ease-in-out;}
   .post-btn:hover{background:black; color:#FFF;}
   .dots{height: 6px;width: 6px;border-radius: 50%;background-color: #eee;margin-top: 2px;margin-left: 5px;margin-right: 5px}
   
   .time-text{font-size: 12px}
   .top-comment{background-color: #eee;padding: 2px;padding-left: 10px;padding-right: 10px;font-size: 12px;border-radius: 40px}
   .user-comment-text{font-size: 14px}
   .fs-13{font-size: 13px}   
   .box {
    width: 40px;
    height: 40px; 
    border-radius: 100%;
    overflow: hidden;
   }
   .small{
      font-size : 13px;
      color: light-gray;
      cursor: pointer;
   }
   .small:hover{
      color: black;
   }
   #padding{
/*        padding-left: 410px;  */
       padding-left: 30px; 
   }


/* 댓글 목록 css */
.rupdateBtn, .rdeleteBtn, .rsubmitBtn {
   border: 0;
   outline: 0 !import;
    font-color: #8a8372;
   font-size: 13px;
   background: none;
}

.deleteBtn {
   width: 40px;
}   
   
   /* 댓글 창 */
#comment_inner {
   margin-top: 1px;
}

.box {
   display: inline-block;
   width: 30px;
   height: 30px;
}
   
#loginUser {
   display: inline-block;
   width: 200px;
   height: 30px;
   margin-left: 10px;
}   

#loginId {
   color: black;
   font-weight: bolder;
   font-size: 13px;
}

.comment_outer {
   border: 1px solid #ababab;
   width: 700px;
   height: 230px;
   padding: 25px;
   overflow: hidden;
   border-radius: 5px;
}

#comment_text {
   
} 

#textarea {
   border: none;
   height: 70px;
   font-size: 14px;
    display: block;
     z-index: 1;    
    position: relative;
    border: 1px solid #ababab;
    border-radius: 5px;
    overflow-x: hidden;
    overflow-y: auto;
    width: 100%;
    margin-top: 10px;
    padding-left: 5px;
    color: black;
}

#replyContent:focus {
   border: 3px solid black;
}

#content_label {
   z-index: 10;
   position: absolute;
   display: inline;
   font-size: 14px;
   margin-left: 5px;
}

#loginMsg {
   text-align: center;
   font-size: 20px;
   margin-bottom: 30px;
}

#countContent {
   margin: 3px 16px;
    font-size: 13px;
    font-family: tahoma,helvetica,sans-serif;
    color: #999;
    line-height: 22px;
    text-align: right;
}

.count_area {
   position: absolute;
   clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    overflow: hidden;
}

#write_total {
    margin: -3px 16px 10px;
    font-size: 13px;
    font-family: tahoma,helvetica,sans-serif;
    color: #999;
    line-height: 22px;
    text-align: right;
}

#rSubmit {
   width: 200px;
    height: 40px;
    margin: auto;
}

#review_area {
/*    background-color: rgb(245, 240, 223); */   
   background-color: #f6f6f6;
   padding: 50px 0px;
}

.profileTd {
   width: 30px;
   height: 50px;
}

.profile {
   width: 32px;
   height: 32px;
   border-radius: 100%;
}

.rwriter {
   width: 200px;
   padding-left: 10px;
   color: #8a8372;
   font-size: 15px;
   font-weight: bold;
}

.rdate {
   width: 150px;
   text-align: right;
   font-size: 14px;
}

.rContent {
   height: 50px;
   padding: 10px 5px 20px;
   border-bottom: 1px solid #c1c1c1;
   font-size: 16px;
   color: black;
}
.updateArea {
   display: none;
   border: 2px solid black;
   border-radius: 5px;
   height: 70px;
   padding: 5px;
   font-size: 15px;
   color: black;
}

   /* 댓글 창 */
  
/* 썸네일 크기 고정 */

.img-fluid {
   width: 500px;
   height: 500px;
}

</style>   

</head>

<body class="goto-here"> 
   
   <!-- header -->
   <c:import url="../common/navbar.jsp"/>
   
    <div class="hero-wrap hero-bread" style="background-image: url(https://imgur.com/xryJjh2.jpg)";>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate ">
             <p class="breadcrumbs"><span class="mr-2">
<!--              <a href="index.html">Home</a></span> <span class="mr-2"><a href="index.html">Product</a></span>  -->
             <span>Travel Goods</span></p>
            <h1 class="mb-0 bread">여행 용품</h1>
          </div>
        </div>
      </div>
    </div>

<!-- 카테고리 --> 
   <form action="gupView.go" method="post">   
         <div class="container">
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
         <c:if test="${ !empty sessionScope.loginUser && loginUser.managerYN == 'Y' }">
            <div style="margin-left: 70%;"><!-- style="margin-left: 70%;" -->
         
             <c:url var="gdelete" value="gdelete.go">
                  <c:param name="gId" value="${ g.goodsId }" />
                  <c:forEach var="f" items="${ fList }"> 
                     <c:param name="changeName" value="${ f.changeName }" />
                    </c:forEach>
                  <!-- 보드 아이디만 갖고가면 사진 삭제하기 힘들다.. 할순있는디,,셀렉트해서 -->
               </c:url>
               <button class="modify_btn">수정하기</button>
               <button id="deleteBtn" type="button" class="modify_btn" onclick="Gdelete()">삭제하기</button>
<%--                <button id="deleteBtn" type="button" class="modify_btn" onclick="location.href='${ gdelete }'">삭제하기</button> --%>
            </div>
         </c:if>
            
        
         <!-- 메인 상품 --> 
              <input type="hidden" name="goodsId" value="${ g.goodsId }">
              <input type="hidden" name="goodsName" value="${ g.goodsName }">
              <input type="hidden" name="price" value="${ g.price }">
              <input type="hidden" name="stock" value="${ g.stock }">
              <input type="hidden" name="gcateNo" value="${ g.gcateNo }">
              <input type="hidden" name="gContent" value="${ g.gContent }">
              <input type="hidden" name="goodsSize" value="${ g.goodsSize }">
              <input type="hidden" name="goodsColor" value="${ g.goodsColor }">
              <input type="hidden" name="goodsBrand" value="${ g.goodsBrand }">
              <input type="hidden" name="page" value="${ page }">
             
             
             <section class="ftco-section">
                <div class="container">
                   <div class="row">
                      <div class="col-lg-6 mb-5 ftco-animate">
                         <!-- 클릭 시 보이는 이미지 -->
         <!--                 <a href="https://imgur.com/ARYQqDp.jpg" class="image-popup"></a> -->
                         <!-- 상세보기에서 보이는 이미지 -->
                         
                        <!-- updateForm에 기존에 업로드한 사진이 남아있게 하기 위해 기존 파일의 원본,바뀐 이름을 컨트롤러에 넘기기 -->
                        <c:forEach var="f" items="${ fList }">
                            <input type="hidden" name="changeName" value="${ f.changeName }">
                            <input type="hidden" name="originName" value="${ f.originName }">
                         </c:forEach>    
                         
                      <c:if test="${ !empty fList[0] }">
   <%--                       <c:forEach var="f" items="${ fList[0] }">  --%>
                           
   <%--                          <c:if test="${ f.fileLevel == 0 }"> --%>
                               <img src="${ contextPath }/resources/guploadFiles/${ fList[0].changeName }" class="img-fluid" alt="Colorlib Template">                  
   <%--                          </c:if> --%>
   <%--                       </c:forEach> --%>
   
   
                      </c:if>    
                      </div>
                      <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                            <div class="rating d-flex">
                               <p class="brand"><span style="font-weight: bold; font-size: 15px;">${ g.goodsBrand }</span></p>
                            </div>
                            <h4>${ g.goodsName }</h4>
                            
                            
                            <div class="rating d-flex">
                               <p class="price" style="font-size: 25px; color: black;">￦<span id="goodsPrice" style="font-size: 25px;">${ g.price }</span></p>
                            </div>
                            
                            <p>
                               <% pageContext.setAttribute("newLineChar", "\r\n"); %>
                               ${ fn:replace(g.gContent, newLineChar, "<br>") }
                            </p>
                              <div class="row mt-4">
                                 <div class="col-md-6" style="display: flex;">
                                       <div class="form-group d-flex">
                                         <div class="select-wrap">
                                         
                                            <!-- 사이즈 -->
                                            <div>
                                               <label style="padding-right: 5px;"><strong>SIZE</strong></label>
                                               <span id="goodsSize">${ g.goodsSize }</span>
                                            </div>
<!--                                              <div class="icon"><i class="fas fa-caret-down"></i></div> -->
<!--                                              <select id="goodsSize" style="width: 130px;" name="goodsSize" class="form-control" onchange="changeValue();"> -->
<!--                                                <option>SIZE</option> -->
<%--                                                <c:forTokens var="size" items="${ g.goodsSize }" delims=", /-."> --%>
<%--                                               <option>${ size }</option> --%>
<%--                                           </c:forTokens> --%>
<!--                                              </select> -->
                                         </div>
                                       </div>
                                       <div class="form-group d-flex">
                                         <div class="select-wrap">
                                         
                                            <!-- 색상 -->
<!--                                              <div class="icon"><i class="fas fa-caret-down"></i></div> -->
<!--                                              <select id="goodsColor" style="width: 130px; margin-left: 10px;" name="goodsColor" id="goodsColor" class="form-control"> -->
<!--                                                <option>COLOR</option> -->
<%--                                                <c:forTokens var="color" items="${ g.goodsColor }" delims=", /-."> --%>
<%--                                               <option>${ color }</option> --%>
<%--                                           </c:forTokens> --%>
<!--                                              </select> -->
                                         </div>
                                       </div>
                                    </div>
                                   
                                   <!-- 색상 -->
                                    <div class="w-100">
                                      <div style="padding-left: 15px; width: 223px; height: 52px;" >
                                      <label style="padding-right: 5px;"><strong>COLOR</strong></label>
                                      <span id="goodsColor">${ g.goodsColor }</span>
                                     </div>
                                    </div>
                                                               
                                            
                    
                                    <!-- 수량 선택 -->
                                       <div class="input-group col-md-6 d-flex mb-3">
                                              <span class="input-group-btn mr-2">
                                              <button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
                                                    <i class="fas fa-minus"></i>
                                              </button>
                                          </span>
                                              <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="5">
                                              <span class="input-group-btn ml-2">
                                              <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                                  <i class="fas fa-plus"></i>
                                            </button>
                                           </span>
                                     </div>
                                     <div class="w-100"></div>
                                     <div class="col-md-12" style="margin-top: 5px;">
                     <!--                <p style="color: #000;">600 kg available</p> -->
                                          <i class="fa-solid fa-truck">&emsp;무료배송</i>
                                     </div>
                            </div>
                            <div style="margin-top: 10px;"></div>
<!--                                <p style="text-align: right;"><a id="orderBtn" class="btn btn-black py-3 px-5" style="border-radius: 70px; color: #fff;">구매하기</a></p> -->
                             <c:if test="${ g.stock <= 0  }">   
                           <p style="text-align: right;">
                              <a class="btn btn-black py-3 px-5" style="border-radius: 70px; color: #fff; cursor: default;">일시 품절</a>
                           </p>
                        </c:if>
                        <c:if test="${ g.stock > 0  }">   
                           <p style="text-align: right;">
                              <a id="orderBtn" class="btn btn-black py-3 px-5" style="border-radius: 70px; color: #fff;">구매하기</a>
                           </p>
                        </c:if>
                      </div>
                   </div>
                </div>
             </section>
            </form>
            
            <hr>
             <section class="ftco-section">
                <div class="container">
                     <div class="row justify-content-center mb-3 pb-3">
                   <div class="col-md-12 heading-section text-center ftco-animate">
         <!--              <span class="subheading">Products</span> -->
                     <h2 class="mb-4"></h2>
         <!--             <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p> -->
                   </div>
                 </div>         
                </div>
             </section>
             
             <!-- 상세보기 사진 -->
   <%--           <c:forEach var="f" items="${ fList }"> --%>
   <%--              <c:if test="${ !empty fList[1] }">    --%>
   <%--                 <c:if test="${ fList[1].fileLevel == 1 }"> --%>
   <!--                    <div class="text-center"> -->
   <%--                       <img src="${ contextPath }/resources/guploadFiles/${ fList[1].changeName }"> --%>
   <!--                    </div> -->
   <%--                 </c:if> --%>
   <%--             </c:if>     --%>
   <%--           </c:forEach> --%>
            
             <!-- 상세보기 사진 -->
             <c:forEach var="i" begin="1" end="${ fList.size() }">
                <c:if test="${ !empty fList[i] }">   
                    <div class="text-center">
                        <img src="${ contextPath }/resources/guploadFiles/${ fList[i].changeName }"  style="margin-bottom: 100px;">
                    </div>
                </c:if>
              </c:forEach>
   
       
     <hr style="margin-bottom: 0;">
   
   
   <div id="review_area">
         <div style="text-align: center;">
            <img src="https://imgur.com/5CNrGWQ.jpg">
       </div>
      
      
 <!-- 댓글 작성 창 -->
      <div class="container mt-5">
          <div class="row d-flex justify-content-center">
              <div class="col-md-7">
               <c:if test="${ !empty sessionScope.loginUser }">
                     <div class="comment_outer">
                        
                        <div style="display: flex;">
                            <div class="box">
	                            <c:if test="${loginUser.changeName == null and loginUser.managerYN == 'Y' }">
	                               <img id="userprofile" src="${contextPath}/resources/image2/profile.png" width="30" height="30">
	                            </c:if>
	                            <c:if test="${loginUser.changeName == null and loginUser.managerYN == 'N' }">
	                               <img id="userprofile" src="${contextPath}/resources/images4/logo_whiteBackground.png" width="30" height="30">
	                            </c:if>
                               	   <img id="userprofile" src="${contextPath}/resources/profileUploadFiles/${loginUser.changeName}" width="30" height="30">
                            </div>
                            <div id="loginUser">
                              <span id="loginId">${ loginUser.nickName }</span>
                           </div>
                      </div>        
                          <div class="d-flex flex-row" id="comment_inner"> 
                             <div class="w-100 comment-area" id="comment_text"> 
                                   <div id="comment_box">
                                      <label for="textarea" id="content_label">후기를 작성해주세요!</label>
                                      <div id="textarea" contenteditable="true"></div>
                                 </div>
                                 <div id="countContent">
                                    <span class="count_area">현재 입력한 글자 수</span>
                                    <strong id="countNum">0</strong>
                                    /
                                    <span class="count_area">전체 입력 가능한 글자 수</span>
                                    <span id="wirte_total">150</span>
                                 </div>
                                 <div>
                                     <button class="btn-block post-btn" id="rSubmit">후기작성</button>
                                  </div> 
                             </div>
                            
                         </div>
                    </div>  
               </c:if>
               <c:if test="${ empty sessionScope.loginUser }">
                  <div id="loginMsg">후기 작성은 로그인 후 가능합니다.</div>
               </c:if>             
                      
                    <br>
                   
                    <!-- 작성된 댓글 리스트-->
                      <table class="replyTable" id="rTb" style="width: 700px; padding: 15px;">
                         <thead>
                            <tr>
                               <td colspan="2" style="padding-bottom: 50px;"><b id="rCount"></b></td>
                            </tr>
                         </thead>
                         <tbody></tbody>
                      </table>
                 
              </div>
          </div>
      </div>
   </div>
   
      
 <script>
    
    // 삭제 클릭 시 confirm
    function Gdelete(){
       var ans = confirm('삭제하시겠습니까?');
       if(ans){
          location.href='${ gdelete }'
       }
    }
 
      // 댓글 등록
      $('#rSubmit').click(function(){
         
         if($('#textarea').text().length == 0 || $('#textarea').text().trim() == '') {
                  alert('내용을 입력하세요');
            } else {
            
            var rContent = $('#textarea').text();
            var replyId = ${ g.goodsId };
            // 아래에서 로그인유저와 댓글 작성자 비교를 위해 로그인 유저의 email 담기
            var isWriter = "${loginUser.email}";
            var manager = "${loginUser.managerYN}"
                        
            $.ajax({
               url: 'addReply.go',
               data: {replyContent:rContent, gId:${g.goodsId}},
               success: function(data){
                  console.log(data);
                  
                  $('#textarea').text(''); // 댓글창 비우기
                  $('#countNum').text('0'); // 글자 카운트 초기화
                  $('#content_label').css('display', 'inline'); // div에 라벨 넣기
                  
                  $tableBody = $('#rTb tbody');
                  $tableBody.html(''); 
                  
                  $('#rCount').text('등록된 후기(' + data.length +'개)'); 
                  
                  if(data.length > 0){
                     console.log(data);
                     
                        for(var i in data){
                           $userTr = $('<tr>').css('padding', '10px 5px'); // tr만들어준다
                           $profileTd = $('<td class="profileTd">');
                          

                           if(data[i].profileImg == null && data[i].manager_yn == 'Y') {
                         	  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/image2/profile.png");
                           } else if(data[i].profileImg == null && data[i].manager_yn == 'N') {
                        	   $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/images4/logo_whiteBackground.png");
                           } else {
         	                  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/profileUploadFiles/" + data[i].profileImg);
                           }
                           
                           $writer = $('<td class="rwriter">').text(data[i].nickName);
                           $date = $('<td colspan="2" class="rdate">').text(data[i].createDate);
                           $btnTr = $('<tr>').css({'text-align':'right', 'width':'150px', 'background-color': 'none'});
                           $upbtn = $('<td colspan="3"><button id="update' + data[i].replyId + '" class="rupdateBtn">수정</button><button id="submit' + data[i].replyId + '" class="rsubmitBtn" style="display:none;">등록</button>');
                           $debtn = $('<td class="deleteBtn"><button id="delete' + data[i].replyId + '" class="rdeleteBtn"">삭제</button>')
                           
                           $contentTr = $('<tr>');
                           $content = $('<td colspan="4" id="content' + data[i].replyId + '" class="rContent">').text(data[i].replyContent);
                           
//                            $countArea = $('<tr id="count">')
//                            $count = $('<td colsapn="3"><div id="countContent"><span class="count_area">현재 입력한 글자수</span><strong id="countNum">0</strong>/<span class="count_area">전체 입력 가능한 글자 수</span><span id="write_total">300</span></div>')
                           
                           $updateArea = $('<tr><td colspan="4" width="400px"><div id="updateArea' + data[i].replyId + '" class="updateArea" contenteditable="true">');
                           
                           $profileTd.append($profile);
                           $userTr.append($profileTd);
                           $userTr.append($writer);
                           $userTr.append($date);
                           
                           // 댓글 작성자 = 로그인 유저 같은 경우 수정, 삭제 버튼 보이게
                           var rWriter = data[i].email;
                           if(isWriter === rWriter) {
                              $btnTr.append($upbtn);
                              $btnTr.append($debtn);
                           } else if(manager == 'Y') {
                              $debtn = $('<td colspan="4" class="deleteBtn"><button id="delete' + data[i].replyId + '" class="rdeleteBtn"">삭제</button>')
                              $btnTr.append($debtn);
                           }
                           
                           $contentTr.append($content);
                           
                           $tableBody.append($userTr);
                           $tableBody.append($btnTr);
                           $tableBody.append($contentTr);
                           
                           $tableBody.append($updateArea);
                           
                        }
                    } else {
                              $tr = $('<tr>');
                              $content = $('<td colspan="3">').text('등록된 후기가 없습니다.');
                              
                              $tr.append($content);
                              $tableBody.append($tr);
                       }
                  },
               error: function(data){
                  console.log(data);
               }
            });
         }
      });   
      
      
      // 댓글 가져오기
      $(document).ready(function getReplyList(){
        // 아래에서 로그인유저와 댓글 작성자 비교를 위해 로그인 유저의 email 담기
        var isWriter = "${loginUser.email}";
        var manager = "${loginUser.managerYN}"
   
         $.ajax({
           url: 'rList.go',
           data : {gId:${g.goodsId}},
           success: function(data){
             console.log(data);
             
            $tableBody = $('#rTb tbody');
            $tableBody.html(''); 
            
            
            $('#rCount').text('등록된 후기(' + data.length +'개)'); 
            
            if(data.length > 0){
               
               console.log(data);
               for(var i in data){
                  $userTr = $('<tr>').css('padding', '10px 5px'); // tr만들어준다
                  $profileTd = $('<td class="profileTd">');

                  
                  if(data[i].profileImg == null && data[i].manager_yn == 'Y') {
                 	  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/image2/profile.png");
                   } else if(data[i].profileImg == null && data[i].manager_yn == 'N') {
                	   $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/images4/logo_whiteBackground.png");
                   } else {
 	                  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/profileUploadFiles/" + data[i].profileImg);
                   }
                  
                  $writer = $('<td class="rwriter">').text(data[i].nickName);
                  $date = $('<td colspan="2" class="rdate">').text(data[i].createDate);
                  $btnTr = $('<tr>').css({'text-align':'right', 'width':'150px', 'background-color': 'none'});
                  $upbtn = $('<td colspan="3"><button id="update' + data[i].replyId + '" class="rupdateBtn">수정</button><button id="submit' + data[i].replyId + '" class="rsubmitBtn" style="display:none;">등록</button>');
                  $debtn = $('<td class="deleteBtn"><button id="delete' + data[i].replyId + '" class="rdeleteBtn"">삭제</button>')
                  
                  $contentTr = $('<tr>');
                  $content = $('<td colspan="4" id="content' + data[i].replyId + '" class="rContent">').text(data[i].replyContent);
                  $updateArea = $('<tr><td colspan="4" width="400px"><div id="updateArea' + data[i].replyId + '" class="updateArea" contenteditable="true">');
                  
                  $profileTd.append($profile);
                  $userTr.append($profileTd);
                  $userTr.append($writer);
                  $userTr.append($date);
                  
                  // 댓글 작성자 = 로그인 유저 같은 경우 수정, 삭제 버튼 보이게
                  var rWriter = data[i].email;
                  if(isWriter === rWriter) {
                     $btnTr.append($upbtn);
                     $btnTr.append($debtn);
                  } else if(manager == 'Y') {
                     $debtn = $('<td colspan="4" class="deleteBtn"><button id="delete' + data[i].replyId + '" class="rdeleteBtn"">삭제</button>')
                     $btnTr.append($debtn);
                  }
                  
                  $contentTr.append($content);
                  
                  $tableBody.append($userTr);
                  $tableBody.append($btnTr);
                  $tableBody.append($contentTr);
                  
                  $tableBody.append($updateArea);
                  
               }
              } else {
                        $tr = $('<tr>');
                        $content = $('<td colspan="3">').text('등록된 후기가 없습니다.');
                        
                        $tr.append($content);
                        $tableBody.append($tr);
                 }
       
           },
           error: function(data){
              console.log(data);
           }
         });
      });
      
     
//        $(function(){
//           getReplyList();
          
//           setInterval(function(){
//              getReplyList();
//           }, 5000); //5초
//         });                
         
         /* 수정칸 글자 수 제한 */
         
//        $(document).ready(function(){
//            $('#updateArea').keyup(function(){
//               var content = $('#updateArea').val();
              
//               if(content.length >= 300){
//                  alert("최대 300자까지 입력 가능합니다.");
//               }
//            });
//        });

      
      $('.updateArea').keyup(function(){
         var content = $(this).text();
         
         if(content.length >= 150){
            alert("최대 150자까지 입력 가능합니다.");
            $(this).val(content.substring(0,149));
         }
      });



       
       
         // 댓글 수정
         $(document).on("click", ".rupdateBtn", function(){
            var rId = $(this).attr("id").substring(6);
         var rContent = $('#content' + rId).text();
         
         $("#updateArea" + rId).css('display', 'block').focus().text(rContent);
         $('#submit' + rId).css('display', 'inline');
         $('#update' + rId).css('display', 'none');
         $('#count').css('display','inline');
         
         

      
         });
         
         
         $(document).on("click", ".rsubmitBtn", function(){
            var rId = $(this).attr("id").substring(6);
         var rContent = $('#updateArea' + rId).text();
         var isWriter = "${loginUser.email}";
         var manager = "${loginUser.managerYN}"
         
         $("#updateArea" + rId).css('display', 'none');
         $('#submit' + rId).css('display', 'none');
         $('#update' + rId).css('display', 'block');
         
         $.ajax({
            url: 'rupdate.go',
            data: {rId:rId, rContent:rContent, gId:${g.goodsId}},
            success: function(data){
               console.log(data);
                
               $tableBody = $('#rTb tbody');
               $tableBody.html(''); 
               
               
               $('#rCount').text('등록된 후기(' + data.length +'개)'); 
               
               if(data.length > 0){
                  
                  console.log(data);
                  for(var i in data){
                     $userTr = $('<tr>').css('padding', '10px 5px'); // tr만들어준다
                     $profileTd = $('<td class="profileTd">');
                   
                     if(data[i].profileImg == null && data[i].manager_yn == 'Y') {
                    	  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/image2/profile.png");
                      } else if(data[i].profileImg == null && data[i].manager_yn == 'N') {
                   	   $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/images4/logo_whiteBackground.png");
                      } else {
    	                  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/profileUploadFiles/" + data[i].profileImg);
                      }
                     
                     $writer = $('<td class="rwriter">').text(data[i].nickName);
                     $date = $('<td colspan="2" class="rdate">').text(data[i].createDate);
                     $btnTr = $('<tr>').css({'text-align':'right', 'width':'150px', 'background-color': 'none'});
                     $upbtn = $('<td colspan="3"><button id="update' + data[i].replyId + '" class="rupdateBtn">수정</button><button id="submit' + data[i].replyId + '" class="rsubmitBtn" style="display:none;">등록</button>');
                     $debtn = $('<td class="deleteBtn"><button id="delete' + data[i].replyId + '" class="rdeleteBtn"">삭제</button>')
                     
                     $contentTr = $('<tr>');
                     $content = $('<td colspan="4" id="content' + data[i].replyId + '" class="rContent">').text(data[i].replyContent);
                     $count = $('')
                     $updateArea = $('<tr><td colspan="4" width="400px"><div id="updateArea' + data[i].replyId + '" class="updateArea" contenteditable="true">');
                     
                     $profileTd.append($profile);
                     $userTr.append($profileTd);
                     $userTr.append($writer);
                     $userTr.append($date);
                     
                     // 댓글 작성자 = 로그인 유저 같은 경우 수정, 삭제 버튼 보이게
                     var rWriter = data[i].email;
                     if(isWriter === rWriter) {
                        $btnTr.append($upbtn);
                        $btnTr.append($debtn);
                     } else if(manager == 'Y') {
                        $debtn = $('<td colspan="4" class="deleteBtn"><button id="delete' + data[i].replyId + '" class="rdeleteBtn"">삭제</button>')
                        $btnTr.append($debtn);
                     }
                     
                     $contentTr.append($content);
                     
                     $tableBody.append($userTr);
                     $tableBody.append($btnTr);
                     $tableBody.append($contentTr);
                     
                     $tableBody.append($updateArea);
                     
                  }
                 } else {
                           $tr = $('<tr>');
                           $content = $('<td colspan="3">').text('등록된 후기가 없습니다.');
                           
                           $tr.append($content);
                           $tableBody.append($tr);
                    }
               
            },
            error: function(data){
               console.log(data);
            }
         });
         });
         
         
         
         
     // 댓글 삭제
        $(document).on("click", ".rdeleteBtn", function(){
           var rId = $(this).attr("id").substring(6);
           // 아래에서 로그인유저와 댓글 작성자 비교를 위해 로그인 유저의 email 담기
           var isWriter = "${loginUser.email}";
           var manager = "${loginUser.managerYN}"
           
           var ans = confirm("선택하신 댓글을 삭제하시겠습니까?");
           if(!ans) return false;
           
           $.ajax({
           url: 'rdelete.go',
           data: {rId:rId, gId:${g.goodsId}},
           success: function(data){
               console.log(data);
               
               $tableBody = $('#rTb tbody');
              $tableBody.html(''); 
              
              $('#rCount').text('등록된 후기(' + data.length +'개)'); 
              
              if(data.length > 0){
                 
                 console.log(data);
                 
                 for(var i in data){
                    $userTr = $('<tr>').css('padding', '10px 5px'); // tr만들어준다
                    $profileTd = $('<td class="profileTd">');
                    
                    if(data[i].profileImg == null && data[i].manager_yn == 'Y') {
                   	  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/image2/profile.png");
                     } else if(data[i].profileImg == null && data[i].manager_yn == 'N') {
                  	   $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/images4/logo_whiteBackground.png");
                     } else {
   	                  $profile = $('<img class="profile">').attr("src", "${contextPath}/resources/profileUploadFiles/" + data[i].profileImg);
                     }
                    
                    $writer = $('<td class="rwriter">').text(data[i].nickName);
                    $date = $('<td colspan="2" class="rdate">').text(data[i].createDate);
                    $btnTr = $('<tr>').css({'text-align':'right', 'width':'150px', 'background-color': 'none'});
                    $upbtn = $('<td colspan="3"><button id="update' + data[i].replyId + '" class="rupdateBtn">수정</button><button id="submit' + data[i].replyId + '" class="rsubmitBtn" style="display:none;">등록</button>');
                    $debtn = $('<td class="deleteBtn"><button id="delete' + data[i].replyId + '" class="rdeleteBtn"">삭제</button>')
                    
                    $contentTr = $('<tr>');
                    $content = $('<td colspan="4" id="content' + data[i].replyId + '" class="rContent">').text(data[i].replyContent);
                    $updateArea = $('<tr><td colspan="4" width="400px"><div id="updateArea' + data[i].replyId + '" class="updateArea" contenteditable="true">');
                    
                    $profileTd.append($profile);
                    $userTr.append($profileTd);
                    $userTr.append($writer);
                    $userTr.append($date);
                    
                    // 댓글 작성자 = 로그인 유저 같은 경우 수정, 삭제 버튼 보이게
                    var rWriter = data[i].email;
                    if(isWriter === rWriter) {
                       $btnTr.append($upbtn);
                       $btnTr.append($debtn);
                    } else if(manager == 'Y') {
                       $debtn = $('<td colspan="4" class="deleteBtn"><button id="delete' + data[i].replyId + '" class="rdeleteBtn"">삭제</button>')
                       $btnTr.append($debtn);
                    }
                    
                    $contentTr.append($content);
                    
                    $tableBody.append($userTr);
                    $tableBody.append($btnTr);
                    $tableBody.append($contentTr);
                    
                    $tableBody.append($updateArea);
                    
                 }
                } else {
                          $tr = $('<tr>');
                          $content = $('<td colspan="3">').text('등록된 후기가 없습니다.');
                          
                          $tr.append($content);
                          $tableBody.append($tr);
                   }
             },
            error: function(data){
              console.log(data);
            } 
         });
         });
         
         // 댓글 입력 폼 안에 라벨 제거
         $(document).ready(function(){
            $('#textarea').keyup(function(){
               
               // div안에 라벨 없애기   
               if($('#textarea').text().length == 0 || $('#textarea').text() == '') {
                  $('#content_label').css('display', 'inline');
               } else {
                  $('#content_label').css('display', 'none');
               }
               
               // 댓글 글자 수 세기
               var comment = $(this).text();
               $('#countNum').text(comment.length);
            
            if(comment.length >= 150) {
               alert("최대 150글자까지 입력 가능합니다");
               $(this).text(comment.substring(0,149));
            } 
            }); 
            
         });
         
  </script>
   
     
  <script>
       // 용품 수량 카운트
      $(document).ready(function(){

      var quantitiy=0;
         $('.quantity-right-plus').click(function(e){
              
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
                  
                  $('#quantity').val(quantity + 1);

                
                  // Increment
          });

           $('.quantity-left-minus').click(function(e){
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
            
                  // Increment
                  if(quantity>0){
                  $('#quantity').val(quantity - 1);
                  }
          });
          
      });
      
      
       // 카테고리분류
      $('.goods-category').click(function(){
         var cate = $(this).attr("id");
      location.href='gCate.go?category=' + cate      
      });
      
     
      // 사이즈에 따라 가격 변경
//       function changeValue() {
//          var sizeArr = "${g.goodsSize}".split("/");
//          console.log(sizeArr);
//          var priceArr = "${g.price}".split("/");
//          console.log(priceArr);
         
//          for(var i = 0; i < sizeArr.length; i++) {
//             if($("#goodsSize option:selected").text() == sizeArr[i]) {
//                var priceInt = parseInt(priceArr[i]);
//                priceArr[i] = priceInt;
//                $("#goodsPrice").text(priceArr[i]);
               
//                var priceInt = parseInt(priceArr[i]);
//                priceArr[i] = priceInt;
//                priceArr[i] = priceInt.toLocaleString("ko-KR", "currency")
               
               
//                $("#goodsPrice").text(priceArr[i]);
//                console.log(typeof priceArr[i]);   
//             }
//          }
//       }
       
     
    // 구매하기 버튼 클릭
//     $("#orderBtn").click(function(){
//        var goodsSize = $("#goodsSize option:selected").text();
//        var goodsColor = $("#goodsColor option:selected").text();
//        var goodsPrice = $("#goodsPrice").text().replace(",", "");
//        var goodsQtt = $("#quantity").val();
//        var totalPrice = (goodsPrice * goodsQtt);
//        location.href="order.go?goodsId="+${g.goodsId}+"&goodsName="+"${g.goodsName}"+"&goodsBrand="+"${g.goodsBrand}"
//                    +"&goodsSize="+goodsSize+"&goodsColor="+goodsColor+"&totalPrice="+totalPrice+"&thumbnail="+"${fList[0].changeName}"
//                    +"&goodsQtt="+goodsQtt;
//     });
  
 // 구매하기 버튼 클릭
    $("#orderBtn").click(function(){
      var goodsSize = $("#goodsSize").text();
      var goodsColor = $("#goodsColor").text();
      var goodsPrice = $("#goodsPrice").text().replace(",", "");
      var goodsQtt = $("#quantity").val();
      var totalPrice = (goodsPrice * goodsQtt);
      
      if(${loginUser == null}) {
         alert("로그인 후 구매 가능합니다.");
         window.location.href="loginView.me";
      } else {
         location.href="order.od?goodsId="+${g.goodsId}+"&goodsName="+"${g.goodsName}"+"&goodsBrand="+"${g.goodsBrand}"
                  +"&goodsSize="+goodsSize+"&goodsColor="+goodsColor+"&totalPrice="+totalPrice+"&thumbnail="+"${fList[0].changeName}"
                  +"&goodsQtt="+goodsQtt;
         }    
      
    });
    
    
    
          
   </script>
   
   
   
   
  <script src="resources/js6/jquery.min.js"></script>
  <script src="resources/js6/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/js6/popper.min.js"></script>
  <script src="resources/js6/bootstrap.min.js"></script>
  <script src="resources/js6/jquery.easing.1.3.js"></script>
  <script src="resources/js6/jquery.waypoints.min.js"></script>
  <script src="resources/js6/jquery.stellar.min.js"></script>
  <script src="resources/js6/owl.carousel.min.js"></script>
  <script src="resources/js6/jquery.magnific-popup.min.js"></script>
  <script src="resources/js6/aos.js"></script>
  <script src="resources/js6/jquery.animateNumber.min.js"></script>
  <script src="resources/js6/bootstrap-datepicker.js"></script>
  <script src="resources/js6/scrollax.min.js"></script>
  <script src="resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="resources/js6/google-map.js"></script>
  <script src="resources/js6/main.js"></script>
    
    <!-- footer -->
    <c:import url="../common/footer.jsp"/>
 </body>

</html>