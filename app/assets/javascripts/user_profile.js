$(function(){

	$("#profile-friends").on("click", "a[data-method='delete']", function(e){
		e.preventDefault();
		e.stopPropagation();

		var url = $(this).attr('href');
		var request = $.ajax({
			method: "DELETE",
			url: url,
		});
		request.done(function(res){
			$("#profile-friends").empty();
			$("#profile-friends").append(res);
		});
	});

	$("#profile-friends").on("click", "a[data-method='post']", function(e){
		e.preventDefault();
		e.stopPropagation();

		var url = $(this).attr('href');
		var request = $.ajax({
			method: "POST",
			url: url,
		});
		request.done(function(res){
			$("#profile-friends").empty();
			$("#profile-friends").append(res);
		});

	});
});