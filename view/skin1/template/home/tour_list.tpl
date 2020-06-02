
<div class="ben-section-title">
	<div class="title"><?php echo $title?></div>
</div>
<div class="ben-right viewall"><a>&raquo; Xem tất cả</a></div>
<div class="clearer"></div>
<div class="ben-section-content">
    <table class="ste-touritem">
    	<?php for($i=0;$i<count($data_tour);){ ?>
        <tr>
            <?php for($j=0;$j<2;$j++){ ?>
            <td width="50%">
                <?php $tour = $data_tour[$i]?>
                <?php $i++?>
                <?php if(count($tour)){ ?>
                <table >
                	<tr>
                    	<td>
                        	
                        	<a class="islink" href="<?php echo $tour['link']?>" title="<?php echo $tour['tentour']?>">
                            	<?php if($tour['khuyenmai']){ ?>
                                <div class="ste-khuyenmai"><?php echo $tour['khuyenmai']?>%</div>
                                <?php } ?>
                            	<img src="<?php echo $tour['arrthumbnail'][0]?>" class='ben-center' alt="<?php echo $tour['tentour']?>" title="<?php echo $tour['tentour']?>"/>
                        	</a>
                        </td>
                        <td>
                        	<div class="ste_tentour"><a href="<?php echo $tour['link']?>"><?php echo $tour['tentour']?></a></div>
                            <div><?php echo $tour['thongtinvantac']?></div>
                            <div class="ste-tourprice">
                            	Giá: <strong><?php echo $this->string->numberFormate($tour[giatour])?></strong>
                                <a class="ste-button-order ben-right" href="<?php echo $tour['linkorder']?>">Đặt tour</a>
                                <div class="clearer"></div>
                            </div>
                        </td>
                    </tr>
                </table>
                <?php }?>
            <?php } ?>
        <?php } ?>
    </table>
</div>