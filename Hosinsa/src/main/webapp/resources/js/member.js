$(document).ready(function(){
    var operForm = $("#operForm");

    $("button[data-oper='modify']").on("click",function(e){
		operForm.attr("action","/member/modify").submit();
	});
});