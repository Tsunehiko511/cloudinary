$(function(){
	$('.deleteCmd').click(function(){
		var oya = $(this).parent();
		if (confirm('消す')){
			if (oya.data('class') == undefined){
				$.post('/delete',{id: oya.data('id')}, function(){oya.fadeOut(800);});
			}else{
				$.post('/delete',{id: oya.data('id'),filename: oya.data('class')}, function(){oya.fadeOut(800);
			});};
		}
	});
})