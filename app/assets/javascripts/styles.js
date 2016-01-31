$(document).ready(function(){
  $(".answers").click(function(e) {
    e.preventDefault();
    $("#answer_id").val($(this).val());
    $(".edit_lesson").submit();
  });
});