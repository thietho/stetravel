function WishList()
{
	this.load = function()
	{
		//$("#sitebarwishlistlist").load(HTTP_SERVER+"?route=sitebar/wishlist/getList");
			
		$.ajax({
			url: HTTP_SERVER+"?route=sitebar/wishlist/getCount",
			cache: false,
			success: function(html){
				if(html != "0")
					$("#wishlistcout").html("wishlist: "+html);
				if(html == 0)
					$("#ben-wishlist").hide();
				else
				{
					$("#ben-wishlist").show();
				}
			}
		});
	}
	this.add = function(mediaid)
	{
		
		$.get(HTTP_SERVER+"?route=addon/wishlist/add&mediaid="+mediaid,
			function(data){
				if(data == "true")
				{
					$("#ben-popup").attr('title','Danh sách mong muốn');
					$( "#ben-popup" ).dialog({
						autoOpen: false,
						show: "blind",
						hide: "explode",
						width: 550,
						height: 300,
						modal: true,
						buttons: {
							
							
							'Đóng': function() {
								$( this ).dialog( "close" );
							},
							'Xem danh sách': function(){
								window.location = HTTP_SERVER+'wishlist.html';	
							},
							
						}
					});
				
					
					$("#ben-popup-content").load(HTTP_SERVER+"?route=common/warring/wishlist&mediaid="+mediaid,function(){
						$("#ben-popup").dialog("open");	
					});
					wishlist.load()
					
				}
				
			}
		);
	}
	
	this.update = function(mediaid,qty)
	{
		$.get(HTTP_SERVER+"?route=addon/wishlist/update&mediaid="+mediaid+"&qty="+qty,
			function(data){
				if(data == "true")
				{
					//$("#sitebarwishlistlist").load(HTTP_SERVER+"?route=sitebar/wishlist/getList");
					$("#addonwishlistlist").load(HTTP_SERVER+"?route=addon/wishlist/getList");
				}
				
			}
		);
	}
	
	this.remove = function(mediaid)
	{
		$.get(HTTP_SERVER+"?route=addon/wishlist/remove&mediaid="+mediaid,
			function(data){
				if(data == "true")
				{
					//$("#sitebarwishlistlist").load(HTTP_SERVER+"?route=sitebar/wishlist/getList");
					$("#addonwishlistlist").load(HTTP_SERVER+"?route=addon/wishlist/getList");
				}
				
			}
		);
	}
}

var wishlist = new WishList();
$(document).ready(function(e) {
    //wishlist.load();
});