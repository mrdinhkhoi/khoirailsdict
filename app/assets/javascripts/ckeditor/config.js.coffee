CKEDITOR.editorConfig = (config) ->
  config.language = "vi"
  config.uiColor = "#1a1a1a"
  true
  config.toolbar_Menu = [
    { name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', '-', 'Templates'] },  
    { name: 'editing', items: ['Find', 'Replace'] }, 
    { name: 'tools', items: ['Maximize', 'ShowBlocks'] },
    { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike'] }, 
    { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] }, 
    { name: 'links', items: ['Link', 'Unlink', 'Anchor'] }, 
    { name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize'] }, 
    { name: 'colors', items: ['TextColor', 'BGColor'] }, 
    { name: 'insert', items: ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak'] }
  ];
  config.toolbar = 'Menu';
