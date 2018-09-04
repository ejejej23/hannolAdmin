//메뉴 슬라이드 업다운
$(function(){
	$(".menu_icon").click(function(){
		if(!$(".nav").is(":visible")){
			$(".nav").slideDown();
		}else{
			$(".nav").slideUp();
		}
	});
});