document.addEventListener("DOMContentLoaded", () => {
	const dropzoneElement2 = document.querySelector("#kt_dropzonejs_example_4");
	const myDropzone2 = Dropzone.forElement(dropzoneElement2);
	// ck 에디터
	  ClassicEditor
      .create(document.querySelector('#sntncCn'), {
          licenseKey: 'eU5USHA5OURMMVdUZE9LeFhNanYyVGZDTlNEZFZndzRVbGZwTThvRkVwdlFPRGZXRHZ3dUhnT056eXRMQmc9PS1NakF5TkRBMk1qST0='
      })
      .then(newEditor => {
          editor = newEditor;
      })
      .catch(error => {
          console.error(error);
      });
	// 상세 조회에서 수정버튼 누르고 데이터 세팅
	$('[data-post-toggle="update"]').on('click',()=>{
		$('#detail_post').toggle();
		$('#postInsertForm').toggle();
		
		let formTitle = document.querySelector('#formTitle');
		let button = document.querySelector('#insert_newpost_btn');
		formTitle.innerHTML = "게시글 수정";
		button.innerHTML = "수정";
		let sntncNo = upbtn.dataset.sntncno;
		let hiddenSntncNoInput = document.querySelector('#post_sntncNo');
		let prjctCode = prjctCodeEl.val();
		  $.ajax({
			  url:`/projectPost/${prjctCode}/detailPost/${sntncNo}`,
			  method:'GET',
			  contentType:'application/json',
			  success:function(resp){
				  if(resp){
					  console.log("뉴뉴",resp);
					  sntncSjEl.val(resp.sntncSj);
					  editor.setData(resp.sntncCn);
				      hiddenSntncNoInput.value = sntncNo;
				  }
			  },
		  })
		
	})
	
	$('[data-post-toggle="delete"]').on('click',()=>{
		let sntncNo = delbtn.dataset.sntncno;
		let prjctCode = prjctCodeEl.val();
		$.ajax({
			url:`/projectPost/${prjctCode}/deletePost/${sntncNo}`,
			method:'DELETE',
			success:function(resp){
				if(resp=='ok'){
					location.reload();
				}
			}
		})
	})
	
	var postTitleIp = document.querySelector("#detail_postTitle");
	var postSntncCn = document.querySelector("#detail_sntncCn");
	var postWriter = document.querySelector("#detail_writer");
	var upbtn = document.querySelector('[data-post-toggle="update"]');
	var delbtn = document.querySelector('[data-post-toggle="delete"]');
	
	  // 게시글 상세조회
	  $(document).on('click','.sntncSj',(e)=>{
		  var sntncNo = e.target.dataset.sntncno;
		  var prjctCode = $('input[name=post_prjctCode]').val();
		  console.log("ㅎㅇ~~~~~",sntncNo);
		  console.log("ㅎㅇ~~~~~",prjctCode);
		  console.log("ㅎㅇ루",postTitleIp);
		  
		  $.ajax({
			  url:`/projectPost/${prjctCode}/detailPost/${sntncNo}`,
			  method:'GET',
			  contentType:'application/json',
			  success:function(resp){
				  if(resp){
					  console.log("정신차려시발노마!!!!",resp);
					  console.log("정신차려라 병수야!!!",resp.sntncSj);
					  postTitleIp.innerHTML  = resp.sntncSj;
					  postSntncCn.innerHTML = resp.sntncCn;
					  postWriter.innerHTML = resp.emplNm;
					  upbtn.dataset.sntncno = resp.sntncNo;
					  delbtn.dataset.sntncno = resp.sntncNo;
					  console.log("정신차리라고 병수야!!",upbtn.dataset.sntncno);
				  }
			  },
		  })
		  
		  $('#detail_post').toggle();
		  $('#postListForm').toggle();;
	  })
	  
	  $('[data-post-toggle="back"]').on('click',()=>{
		  $('#detail_post').toggle();
		  $('#postListForm').toggle();
	  })
	  const fn_update = () =>{
		  let newSntncSj = sntncSjEl.val();
		  let newSntncCn = editor.getData();
		  let sntncNo = $('#post_sntncNo').val();
		  let prjctCode = $('input[name=post_prjctCode]').val();
		  
		  console.log("하하하하하 ㅋㅋ",newSntncSj);
		  console.log("하하하하하 ㅋㅋ",newSntncCn);
		  console.log("하하하하하 ㅋㅋ",sntncNo);
		  
		  const projectPostVO = {
				  sntncSj:newSntncSj,
				  sntncCn:newSntncCn,
		  }
		  $.ajax({
			  url:`/projectPost/${prjctCode}/updatePost/${sntncNo}`,
			  method:'PUT',
			  contentType:'application/json',
			  data:JSON.stringify(projectPostVO),
			  success:function(resp){
				  if(resp=='ok'){
					  location.reload();
					  
				  }
			  }
		  })
	  }
	  
	  var sntncSjEl = $('input[name=sntncSj]');
	  var prjctCodeEl = $('input[name=post_prjctCode]');
	  
	  
	  const fn_insert  = () =>{
		  var sntncSj = sntncSjEl.val();
	    	var sntncCn = editor.getData();
	    	let prjctCode = prjctCodeEl.val();

			const currentFileNames = myDropzone2.files.map(file => file.name);
			
	    	const projectPostVO = {
	    			sntncSj: sntncSj,
	    			sntncCn: sntncCn,
	    	}
			const sendData = {
				projectPostVO:projectPostVO,
				attach:currentFileNames,
				attachTemp:uploadedFileList2
		}
          Swal.fire({
              text: "새로운 게시물이 등록되었습니다.",
              icon: "success",
              buttonsStyling: false,
              confirmButtonText: "예",
              customClass: {
                  confirmButton: "btn btn-primary"
              }
          }).then(function (result) {
              if (result.isConfirmed) {
                  
                  $.ajax({
	    	    		url:`/projectPost/${prjctCode}/insertPost`,
	    	    		method:'POST',
	    	    		contentType:'application/json',
	    	    		data:JSON.stringify(sendData),
	    	    		success:function(resp){
	    	    			if(resp=='ok'){
		    	    			location.reload();
		    	    			$('#postListForm').show();
	    	    			}
	    	    		}
	    	    	})
              }
          });
	  }
	  // 게시판 글 등록
		$('#post_insert').on('click',()=>{
			$('#postListForm').toggle();
			$('#postInsertForm').toggle();
		})
	    
	    // 게시글 등록 버튼
	    $('#insert_newpost_btn').on('click',(e)=>{
	    	console.log("e==>",e);
	    	if($(e.target).text()=='등록'){
	    		fn_insert(e);
	    	}
	    	else if($(e.target).text()=='수정'){
	    		fn_update(e);
	    	}
	    });
	  
	    $('#tab_post').on('shown.bs.tab',()=>{
	    	$('#postListForm').show();
	    	
	    	$('#postInsertForm').hide();
	    	
	    })
	  
})