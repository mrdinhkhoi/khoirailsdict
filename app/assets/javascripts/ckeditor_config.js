ready = function(){
  $("textarea[editor='true']").each(function(){
   CKEDITOR.replace( $(this).attr('id'), {
   allowedContent: true,
   extraPlugins: 'wysiwygarea'
  });
  });
  
};
$(document).ready(ready);

