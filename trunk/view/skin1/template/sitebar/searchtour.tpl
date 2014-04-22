<div class="ben-section">
    <div class="ste-sitebar-searchtour">
    	<table style="width:100%">
        	<tr>
            	<td><input type="text" id="txt_search" class="ben-text-searchtour" value="Tour du lich, điểm đến du lịch..." onfocus="this.value=''" onblur="this.value='Tour du lich, điểm đến du lịch...'"/></td>
                <td width="34px" id="btnSearch"><center><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>btn-search.png"/></center></td>
            </tr>
        </table>
        
    </div>
</div>
<script language="javascript">

$('#btnSearch').click(function(e) {
    window.location = "<?php echo $this->document->createLink('searchtour')?>?keyword="+ $('#txt_search').val();
});
$('#txt_search').keyup(function(e) {
    if(e.keyCode == 13)
		$('#btnSearch').click();
});
</script>