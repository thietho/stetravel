<table class="ben-table">
	<thead>
        <tr>
            <th>Hình</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            
            <th></th>
        </tr>
    </thead>
    <tbody>
	<?php 
    	$sum = 0;
    	foreach($medias as $media) {
        $sum += $media['price'] * $media['qty'];
    ?>
        <tr>
            <td><img src="<?php echo $media['imagethumbnail']?>" class="ben-center"/></td>
            <td><?php echo $media['title']?></td>
            <td class="number"><?php echo $this->string->numberFormate($media['price'])?><?php echo $this->document->setup['Currency']?></td>
            
            <td><input type="button" class="ben-button" name="btnRemove" value="Xóa" onclick="wishlist.remove('<?php echo $media['mediaid']?>')"/></td>
        </tr>
    <?php } ?>
    </tbody>
    
</table>
<script language="javascript">
$(document).ready(function(){
	numberMod()		   
});
</script>