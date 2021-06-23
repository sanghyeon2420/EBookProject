

$(document).ready(function(){
	
	
	$("#searchButton").click(function(){
		
		location.href="/EBookProject/web/search?keyword="+$("#keyword").val();
	});
});