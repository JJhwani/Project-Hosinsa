$(document).ready(function(){
    var operForm = $("#operForm");
    var removeForm = $("#removeForm");

    $("button[data-oper='modify']").on("click",function(e){
		operForm.attr("action","/member/modify").submit();
  	});

    $("button[data-oper='remove']").on("click",function(e){
      var url = "/member/remove";
      var form = $("#removeForm");
      var target = "_blank_1";
      window.open(url, target,
        "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");

      form.attr("action", url);
      form.attr("target", target);
      form.attr("method", "get");

      form.submit();
      });
});