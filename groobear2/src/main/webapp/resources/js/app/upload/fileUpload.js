let uploadedFileList = [];
document.addEventListener("DOMContentLoaded", function() {
    // set the dropzone container id
    const id = "#kt_dropzonejs_example_3";
    const dropzone = document.querySelector(id);
    
    // set the preview element template
    var previewNode = dropzone.querySelector(".dropzone-item");
    previewNode.id = "";
    var previewTemplate = previewNode.parentNode.innerHTML;
    previewNode.parentNode.removeChild(previewNode);
    
    var myDropzone = new Dropzone(id, { // Make the whole body a dropzone
        url: "/attach", // Set the url for your upload script location
        parallelUploads: 20,
        maxFilesize: 100, // Max filesize in MB
        previewTemplate: previewTemplate,
        previewsContainer: id + " .dropzone-items", // Define the container to display the previews
        clickable: id + " .dropzone-select",  // Define the element that should be used as click trigger to select files.
        success: function(file, response) {
            uploadedFileList.push(response);
        }
    });
    
    myDropzone.on("addedfile", function (file) {
        // Hookup the start button
        const dropzoneItems = dropzone.querySelectorAll('.dropzone-item');
        dropzoneItems.forEach(dropzoneItem => {
            dropzoneItem.style.display = '';
        });
    });
    
    // Update the total progress bar
    myDropzone.on("totaluploadprogress", function (progress) {
        const progressBars = dropzone.querySelectorAll('.progress-bar');
        progressBars.forEach(progressBar => {
            progressBar.style.width = progress + "%";
        });
    });
    
    myDropzone.on("sending", function (file) {
        // Show the total progress bar when upload starts
        const progressBars = dropzone.querySelectorAll('.progress-bar');
        progressBars.forEach(progressBar => {
            progressBar.style.opacity = "1";
        });
    });
    
    // Hide the total progress bar when nothing's uploading anymore
    myDropzone.on("complete", function (progress) {
        const progressBars = dropzone.querySelectorAll('.dz-complete');
    
        setTimeout(function () {
            progressBars.forEach(progressBar => {
                progressBar.querySelector('.progress-bar').style.opacity = "0";
                progressBar.querySelector('.progress').style.opacity = "0";
            });
        }, 300);
    });
	if ($('input[name=attachFileNm]').length > 0) {
	 const attachFileList = [];
	    $('input[name=attachFileNm]').each(function (index, element) {
	        const fileNm = $(element).val();
	        const saveFileNm = $('input[name=attachSaveFileNm]').eq(index).val();
	        const filePath = $('input[name=attachFilePath]').eq(index).val();
	        const fileSize = $('input[name=attachFileSize]').eq(index).val();
	
	        attachFileList.push({
	            fileNm: fileNm,
	            saveFileNm: saveFileNm,
	            filePath: filePath,
	            fileSize: fileSize
	        });
	
	        let mockFile = { name: fileNm, size: fileSize };
	        myDropzone.displayExistingFile(mockFile, filePath + '/' + saveFileNm);
	    });
	}
});