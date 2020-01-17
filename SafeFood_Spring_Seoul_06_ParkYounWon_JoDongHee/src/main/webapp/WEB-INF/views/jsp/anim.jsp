<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/7ad89d9866.js"></script>
<link rel="stylesheet" type="text/css" href="anim.css"/>
<style type="text/css">
.btn-secondary {
	display: block;
	margin: 40px auto 0px;
	text-align: center;
	background: #ed2553;
	border-radius: 3px;
	box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
	padding: 10px 17px;
	font-size: 18px;
	cursor: pointer;
	border: none;
	outline: none;
	color: #ffffff;
	text-decoration: none;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.btn-secondary:hover {
	transform: translateY(-3px);
}

.btn-secondary .fa {
	margin-right: 5px;
}

.animate-like {
	animation-name: likeAnimation;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
	animation-duration: 0.65s;
}

@keyframes likeAnimation { 
	0% {transform: scale(30);}
	100%{transform :scale(1);}
}


@-webkit-keyframes sparkle {
  from {
    background-position: 0% 100%;
  }
  to {
    background-position: 200% 100%;
  }
}

@keyframes sparkle {
  from {
    background-position: 0% 100%;
  }
  to {
    background-position: 200% 100%;
  }
}
.test {
  background: white;
  display: inline-block;
  padding: 1em;
  font-family: Helvetica Neue;
  border-radius: 4px;
  position: relative;
}
.test:before {
  -webkit-animation: sparkle 4s infinite linear;
          animation: sparkle 4s infinite linear;
  background: linear-gradient(90deg, #7FEFBD 0%, #FFF689 11%, #EC0B43 22%, #7FEFBD 33%, #FFF689 44%, #EC0B43 55%, #7FEFBD 66%, #FFF689 77%, #EC0B43 88%, #7FEFBD 100%);
  background-size: 300% 100%;
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border-radius: 4px;
  -webkit-filter: blur(3px);
          filter: blur(3px);
  z-index: -1;
  -webkit-transform: scale(0.99) translateY(3px);
          transform: scale(0.99) translateY(3px);
}

/* 마우스 오버 */
/*
* core styles
*/

.sm-link{
    --uismLinkDisplay: var(--smLinkDisplay, inline-flex);   
    --uismLinkTextColor: var(--smLinkTextColor);
    --uismLinkTextColorHover: var(--smLinkTextColorHover);  
    
    display: var(--uismLinkDisplay);
    color: var(--uismLinkTextColor);
    position: relative;
    overflow: hidden;
}

a.sm-link{
    text-decoration: none;
}

.sm-link__label{
  display: block;
}

/* sm-link_padding-all */ 

.sm-link_padding-all{
    --uismLinkLineWeight: var(--smLinkLineWeight, 2px);
    --uismLinkLineColor: var(--smLinkLineColor, #000);
    --uismLinkPadding: var(--smLinkPadding, 5px);
    
    padding: var(--uismLinkPadding);
}

.sm-link_padding-all::before, 
.sm-link_padding-all::after{
  width: 100%;
  height: var(--uismLinkLineWeight);
  left: 0;
}

.sm-link_padding-all::before{
  top: 0;
}

.sm-link_padding-all::after{
  bottom: 0;
}

.sm-link_padding-all .sm-link__label::before,
.sm-link_padding-all .sm-link__label::after{
  width: var(--uismLinkLineWeight);
  height: 100%;
  top: 0;
}

.sm-link_padding-all .sm-link__label::before{
  left: 0;
}

.sm-link_padding-all .sm-link__label::after{
  right: 0;
}

.sm-link_padding-all::before,
.sm-link_padding-all::after,
.sm-link_padding-all .sm-link__label::before,
.sm-link_padding-all .sm-link__label::after{
  content: "";     
    background-color: var(--uismLinkLineColor);
  position: absolute; 
    opacity: 0;
    
    will-change: transform, opacity;
    transition-property: transform, opacity;
}

.sm-link_padding-all:hover::before,
.sm-link_padding-all:hover::after,
.sm-link_padding-all:hover .sm-link__label::before,
.sm-link_padding-all:hover .sm-link__label::after{
    opacity: 1;
}

/* sm-link_padding-bottom */ 

.sm-link_padding-bottom{
    --uismLinkLineWeight: var(--smLinkLineWeight, 2px);
    --uismLinkLineColor: var(--smLinkLineColor, #000);  
    
    padding-bottom: var(--uismLinkLineWeight);  
    position: relative;
}

.sm-link_padding-bottom::after{
  content: "";
  width: 100%;
  height: var(--uismLinkLineWeight);
    background-color: var(--uismLinkLineColor);
    
  position: absolute;
  left: 0;
  bottom: 0;
}

/* sm-link_bg */ 

.sm-link_bg {
    --uismLinkLineColor: var(--smLinkLineColor, #000);  
    --uismLinkTextColorHover: var(--smLinkTextColorHover, #fff);    
    --uismLinkPadding: var(--smLinkPadding, 5px);
    
    padding: var(--uismLinkPadding);
    transition: color .3s ease-out;
}

.sm-link_bg::before, 
.sm-link_bg::after{
  content: "";
    background-color: var(--uismLinkLineColor); 
  opacity: 0;
  position: absolute;
    
    transition: transform .2s ease-out, opacity .2s ease-out .03s;
}

.sm-link_bg .sm-link__label{
  position: relative;
  z-index: 2;
}

.sm-link_bg:hover::before, 
.sm-link_bg:hover::after{
  opacity: 1;
    transition-duration: .35s, .35s;
    transition-delay: 0s, 0s;
}

.sm-link_bg:hover{
    color: var(--uismLinkTextColorHover);
}

/* sm-link_text */ 

.sm-link_text::before{
  content: attr(data-sm-link-text);
    color: var(--uismLinkTextColorHover);
  position: absolute;
}

.sm-link_text::before, 
.sm-link_text .sm-link__label{
  transition-property: transform;
    transition-timing-function: cubic-bezier(.86, .6, .08, 1.01); 
    transition-duration: .3s;
}

.sm-link_text:hover::before,
.sm-link_text:hover .sm-link__label{
    transition-duration: .4s;
}

/* effect 1 */

.sm-link1::before{
  transform: translate3d(-105%, 0, 0);
}

.sm-link1::after{
  transform: translate3d(105%, 0, 0);
}

.sm-link1 .sm-link__label::before{
  transform: translate3d(0%, -100%, 0);
}

.sm-link1 .sm-link__label::after{
  transform: translate3d(0%, 100%, 0);
}

.sm-link1::before,
.sm-link1::after,
.sm-link1 .sm-link__label::before,
.sm-link1 .sm-link__label::after{
    transition-timing-function: ease-out;
    transition-duration: .2s, .15s;
    transition-delay: 0s, .15s;
}

.sm-link1:hover::before,
.sm-link1:hover::after,
.sm-link1:hover .sm-link__label::before,
.sm-link1:hover .sm-link__label::after{
  transform: translate3d(0, 0, 0);
    opacity: 1;
    
    transition-duration: .25s;
    transition-delay: 0s;
}

/*
SETTINGS
*/

.sm-link{
    --smLinkPadding: 10px 15px;
    --smLinkLineWeight: 5px;
    --smLinkLineColor: #243aab;
    --smLinkTextColor: #243aab;
    --smLinkTextColorHover: #1b255a;
}

.sm-link_bg{
    --smLinkTextColorHover: #fff;
}


/* 카드뷰 이벤트 */
.card {
  width: 200px;
  height: 200px;
  margin: auto;
  position: relative;
  text-align: center;
  cursor: pointer;
}
.card:hover {
  z-index: 50;
}
.card .material-icons {
  line-height: 200px;
  font-size: 100px;
}
.card .f-card {
  width: 200px;
  height: 200px;
  position: absolute;
  box-shadow: 0 0 0 #eee;
  left: 0;
  top: 0;
  color: #555;
  background: #fff;
  z-index: 5;
  transition: ease-in 0.3s;
}
.card .b-card {
  width: 200px;
  height: 200px;
  background: #eee;
  color: #f53249;
  position: relative;
  overflow: hidden;
  box-shadow: 0 0 10px #ccc inset;
}
.card .b-card .material-icons {
  -webkit-animation: bb 1s infinite;
  animation: bb 1s infinite;
}

#model-1 .card:hover .f-card {
  box-shadow: 2px 0 3px #eee;
  -webkit-transform: translateX(-100%);
  transform: translateX(-100%);
}

@-webkit-keyframes bb {
  0% , 100% {
    -webkit-transform: scale(0.85, 0.85);
    transform: scale(0.85, 0.85);
  }
  50% {
    -webkit-transform: scale(1, 1);
    transform: scale(1, 1);
  }
}
@keyframes bb {
  0% , 100% {
    -webkit-transform: scale(0.85, 0.85);
    transform: scale(0.85, 0.85);
  }
  50% {
    -webkit-transform: scale(1, 1);
    transform: scale(1, 1);
  }
}


/* 상세정보 뜨게하기 */
.snip1264 {
  font-family: 'Raleway', Arial, sans-serif;
  color: #fff;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 220px;
  max-width: 310px;
  width: 100%;
  color: #000000;
  text-align: center;
  background-color: #ffffff;
}
.snip1264 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.6s ease;
  transition: all 0.6s ease;
}
.snip1264 img {
  max-width: 100%;
  vertical-align: top;
  -webkit-transition: opacity 0.35s;
  transition: opacity 0.35s;
}
.figcaption {
  position: absolute;
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  width: 100%;
  z-index: 1;
}
.snip1264 h2,
.snip1264 p {
  margin: 0;
  width: 100%;
  left: 0;
  opacity: 0;
}
.snip1264 h2 {
  padding: 0 30px;
  display: inline-block;
  font-weight: 400;
  text-transform: uppercase;
  bottom: 50%;
  -webkit-transform: translateX(-100px);
  transform: translateX(-100px);
}
.snip1264 h2 span {
  font-weight: 400;
}
.snip1264 p {
  top: 50%;
  padding: 0 50px;
  font-size: 0.8em;
  font-weight: 500;
  -webkit-transform: translateX(-50px);
  transform: translateX(-50px);
}
.snip1264 .icons {
  -webkit-transform: translateX(50px);
  transform: translateX(50px);
  opacity: 0;
}
.snip1264 i {
  padding: 2px 5px;
  display: inline-block;
  font-size: 28px;
  color: #000000;
  text-align: center;
  opacity: 0.5;
}
.snip1264 i:hover {
  opacity: 1;
}
.snip1264 a {
  text-decoration: none;
}
.snip1264:hover img,
.snip1264.hover img {
  -webkit-filter: grayscale(100%);
  filter: grayscale(100%);
  opacity: 0.2;
}
.snip1264:hover h2,
.snip1264.hover h2,
.snip1264:hover p,
.snip1264.hover p,
.snip1264:hover .icons,
.snip1264.hover .icons {
  -webkit-transition-delay: 0.2s;
  transition-delay: 0.2s;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}
.snip1264:hover h2,
.snip1264.hover h2,
.snip1264:hover .icons,
.snip1264.hover .icons {
  opacity: 1;
}
.snip1264:hover p,
.snip1264.hover p {
  opacity: 0.7;
}
</style>
<script type="text/javascript">
$(function(){
    $(document).one('click', '.like-review', function(e) {
        $(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this');
        $(this).children('.fa-heart').addClass('animate-like');
    });
});

$(".hover").mouseleave(
	    function () {
	      $(this).removeClass("hover");
	    }
 );
</script>
</head>
<body>
	<a class="btn-secondary like-review">
		<i class="fa fa-heart" aria-hidden="true"></i> Like
	</a>
	<a href="chuga.dd?code=1" style="width: 100px;"class="btn-secondary like-review">
			<i class="fa fa-heart" aria-hidden="true"></i> 추가
	</a>
	
	<div class="test">
	  Look ma, no hands
	</div>
	        <div class="sm-link sm-link_padding-all sm-link1" style="width: 300px; height: 300px;">
	        	<img src="images/logo.PNG" style="width: 50px; height: 50px;"/>
	            <div class="sm-link__label">Hover effect #1</div>
	        </div>
	        
	        

	<div class="col" id="model-1">
	  <div class="card">
	    <div class="f-card">fingerprint</div>
	    <div class="b-card"><i class="material-icons">favorite</i></div>
	  </div>
	</div>



	<div class="snip1264">
		<img src="images/logo.PNG" alt="sample45" />
		<div class="figcaption">
			<h2>Gunther Beard</h2>
			<p>Until you stalk and overrun, you can't devour anyone.</p>
			<div class="icons">
				<a href="#"><i class="ion-social-reddit-outline"></i></a><a href="#">
					<i class="ion-social-twitter-outline"></i>
				</a><a href="#"> <i class="ion-social-vimeo-outline"></i></a>
			</div>
		</div>
		<a href="#"></a>
	</div>
</body>
</html>