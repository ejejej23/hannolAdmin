//메뉴 슬라이드 업다운
$(function(){
	$(".menu_icon").click(function(){
		if(!$(".navMenu").is(":visible")){
			$(".navMenu").slideDown();
		}else{
			$(".navMenu").slideUp();
		}
	});
});
