$(function(){
	var search_user = $("#user-search-result");
	function appendUser(user) {	
		var html = `<div class ="chat-group-user clearfix">
								<div class= "user-box">	
								<img src="${user.avatar}">
								<a href="http://localhost:3000/users/${user.id}"></a>
								<p class ="chat-group-user__name">${user.name}</p>
								</div>
								<div class ="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}"></div>
								</div>`					
		search_user.append(html);
	}

	function appendErrMsgToHTML(msg) {

		var html = `<div class='listview__element--right-icon'>${ msg }</div>`
								
		search_user.append(html);
	}

	$("#user-search-field").on("keyup", function() {
		var input = $("#user-search-field").val();
		$("#user-search-result").empty();
		if (input !== ""){
		$.ajax({
			type: 'GET',
			url: '/tweets',
			data: { keyword: input },
			dataType: 'json'
		})
	
	.done(function(data) {
		console.log(data);
		if (data.length !== 0) {
			data.forEach(function(data){
				appendUser(data);
		
			});
		}
		else {
			appendErrMsgToHTML("該当するユーザーはいません");
		}
	}) 
	.fail(function() {
		alert('error');
			});
		}
	});
});