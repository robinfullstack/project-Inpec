tinymce.init({
  selector: 'textarea',
  plugins: 'print preview tinydrive searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap mentions quickbars advtable code',
  toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons |  preview print | insertfile image media link | ltr rtl badge styleselect',
    formats: {
        badge: {
            // Declare that a badge should be wrapped in a span
            inline: 'span',
            // The span should have these attributes
            attributes: {
                class: 'badge',
                // Replacement variables can also be used
                style: '%styles'
            },
        },
    // We name our format "calltoaction"
        calltoaction: {
            // The format is only applicable on links
            selector: 'a',
            // Apply the class "btn" when enabled.
            classes: 'dx-btn dx-btn-primary'
        }
    },
    // The style_formats option controls the styleformat toolbar button menu
    // https://www.tiny.cloud/docs/configure/editor-appearance/#style_formats
    style_formats: [
        { title: 'Paragraph', format: 'p' },
        { title: 'Heading 1', format: 'h1' },
        { title: 'Heading 2', format: 'h2' },
        { title: 'Button styles'},
        { title: 'Call-to-action', format: 'calltoaction' },
    ],
    inline_boundaries_selector: 'a[href],code,.mce-annotation,span.badge',
    content_style: `
        span.badge {
            background-color: gray;
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 0px 4px;
            border-radius: 4px;
            font-weight: 600;
        },
    .btn {
    background-color: #706FD3;
    padding: 12px 16px;
    color: #ffffff;
    border-radius: 4px;
    text-decoration: none;
    display: inline-block;
    }
    `,
  tinydrive_token_provider: '../../../libs/jwt/jwt.php',
  height: 600,
  mode : "specific_textareas",
  editor_selector : "mceEditor",
  selector: "#contenido_docs",
  toolbar_mode: 'floating',
  tinycomments_mode: 'embedded',
  tinycomments_author: 'Author name',
  setup: (editor) => {
    // Instead of defining a custom icon pack, we can register individual
    // icons using the API.
    // https://www.tiny.cloud/docs/api/tinymce.editor.ui/tinymce.editor.ui.registry/#addbutton
    editor.ui.registry.addIcon('badge', '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"><g fill="none" fill-rule="evenodd" stroke="#000" stroke-width="2" transform="rotate(-45 11.894 11.644)"><path d="M5 7h10.343a3 3 0 0 1 2.121.879l3.415 3.414a.997.997 0 0 1 0 1.414l-3.415 3.414a3 3 0 0 1-2.12.879H5a.997.997 0 0 1-1-1V8a.997.997 0 0 1 1-1z"/><path stroke-linecap="round" transform="rotate(-135 15.828 12)" d="M16.414 11.414L15.707 12.121"/></g></svg>');

    // Register a custom toolbar button for opening the badge dialog.
    // https://www.tiny.cloud/docs/ui-components/toolbarbuttons/
    editor.ui.registry.addButton('badge', {
        icon: 'badge',
        tooltip: 'Insert/edit badge',
        onAction: function () {

            // Get a selected badge's background color or set the
            // default default color.
            const backgroundColor = function() {

                // Fetch the node of the current selection.
                // https://www.tiny.cloud/docs/api/tinymce.dom/tinymce.dom.selection/
                node = editor.selection.getNode();

                // Check if the node has the badge class, if so
                // it will have a background color style.
                // https://www.tiny.cloud/docs/api/tinymce.dom/tinymce.dom.domutils/
                if (editor.dom.hasClass(node, 'badge')) {
                    return node.style.backgroundColor;
                }

                // If the selection contains no badge, then set the default color.
                return 'rgb(0, 123, 255)';
            }

            // Get a selected badge's text color or set the
            // default default color. This is the same as
            // background color above but for text color.
            const textColor = function() {
                node = editor.selection.getNode();

                if (editor.dom.hasClass(node, 'badge')) {
                    return node.style.color;
                }

                return 'rgb(255, 255, 255)';
            }

            // Open a TinyMCE modal where the user can set the badge's
            // background and text color.
            // https://www.tiny.cloud/docs/ui-components/dialog/
            // https://www.tiny.cloud/docs/ui-components/dialogcomponents/
            editor.windowManager.open({
                title: 'Insert/edit Badge',
                body: {
                    type: 'panel',
                    items: [
                        {
                            type: 'colorinput', // component type
                            name: 'backgroundcolor', // identifier
                            label: 'Background color' // text for the label
                        },
                        {
                            type: 'colorinput', // component type
                            name: 'textcolor', // identifier
                            label: 'Text color' // text for the label
                        }
                    ]
                },
                buttons: [
                {
                    type: 'cancel',
                    name: 'closeButton',
                    text: 'Cancel'
                },
                {
                    type: 'submit',
                    name: 'submitButton',
                    text: 'Save',
                    primary: true
                }
                ],
                initialData: {
                    backgroundcolor: backgroundColor(),
                    textcolor: textColor()
                },
                onSubmit: function (dialog) {
                    // Get the form data.
                    var data = dialog.getData();

                    // Get the currently selected node.
                    // https://www.tiny.cloud/docs/api/tinymce.dom/tinymce.dom.selection/
                    const node = editor.selection.getNode();

                    // Working directly with the DOM often requires manually adding
                    // the actions to the undo stack.
                    // https://www.tiny.cloud/docs/api/tinymce/tinymce.undomanager/
                    editor.undoManager.transact(() => {
                        // Check if the selected node is a badge.
                        // https://www.tiny.cloud/docs/api/tinymce.dom/tinymce.dom.domutils/
                        if (editor.dom.hasClass(node, 'badge')) {
                            // If the selection is a badge, we manipulate the styles directly
                            // instead of using the formatter to set a new format which caused
                            // nested spans (it creates a badge inside the badge).
                            // https://www.tiny.cloud/docs/api/tinymce.dom/tinymce.dom.domutils/#setstyles
                            editor.dom.setStyles(node, {'background-color': data.backgroundcolor, 'color': data.textcolor});
                        }
                        else {
                            // If not a badge, then apply the badge format to the current selection
                            // or the word the text caret is currently placed in.
                            // https://www.tiny.cloud/docs/api/tinymce/tinymce.formatter/#apply
                            editor.formatter.apply('badge', {styles: `background-color: ${data.backgroundcolor}; color: ${data.textcolor};`});
                        }
                    });

                    // Tell TinyMCE that the ui has been updated.
                    // https://www.tiny.cloud/docs/api/tinymce/tinymce.editor/#nodechanged
                    editor.nodeChanged();

                    // Close the dialog.
                    dialog.close();
                }
            });
        }
    });
}
});