$(document).ready(function(){
    var operForm = $("#operForm");
    var removeForm = $("#removeForm");

    $("button[data-oper='modify']").on("click",function(e){
		operForm.attr("action","/member/modify").submit();
  	});

    $("button[data-oper='remove']").on("click",function(e){
     removeForm.attr("action", "/member/remove").submit();
      });
});