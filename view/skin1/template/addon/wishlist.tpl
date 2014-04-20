<style>
.ben-wishlist
{
	border:thin solid #CCC;	
	padding:5px;
}
</style>
<div id="addonwishlistlist">

</div>
<div align="center">
	<input type="button" class="ben-button" value="Tiếp tục mua hàng" onclick="window.location='<?php echo HTTP_SERVER?>'"/>
    
</div>
<script language="javascript">
$(document).ready(function() {
	$("#addonwishlistlist").load(HTTP_SERVER+"?route=addon/wishlist/getList");
});
</script>