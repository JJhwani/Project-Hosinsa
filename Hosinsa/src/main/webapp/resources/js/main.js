console.log("Main Module......");

var mainService = (function(){

	$(".category").on("click", function(e){
		e.preventDefault();
		//actionForm.find("input[name='category']").remove();
		actionForm.append("<input type='hidden' name='category' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/category");
		actionForm.submit();
	});

})();