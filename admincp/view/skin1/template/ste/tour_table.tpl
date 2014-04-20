				<?php echo $pager?>
                <table class="data-table" cellpadding="0" cellspacing="0">
                <thead>
                    <tr class="tr-head">
                    	<?php if($dialog!=true){ ?>
                        <th width="1%">
                        	
                        	<input id="inputchk" type="checkbox" onclick="$('input[name*=\'delete\']').attr('checked', this.checked);">
                           
                        </th>
                        <?php } ?>
                        <th>STT</th>
                        <th>Tên tour</th>
                        <th>Thời gian</th>
                        <th>Giá</th>
                        <th>Khuyến mãi</th>
                        <th>Hình</th>
                        
                        <?php if($dialog!=true){ ?>
                        <th>Control</th>     
                        <?php } ?>
                    </tr>
                </thead>
                <tbody>
        
        
        <?php
            foreach($datas as $key => $item)
            {
        ?>
                    <tr class="item" id="<?php echo $item['id']?>" tentour="<?php echo $item['tentour']?>" icone="<?php echo $item['iconethumbnail']?>" banner="<?php echo $item['bannerthumbnail']?>" image="<?php echo $item['imagethumbnail']?>">
                    	<?php if($dialog!=true){ ?>
                        <td class="check-column"><input class="inputchk" type="checkbox" name="delete[<?php echo $item['id']?>]" value="<?php echo $item['id']?>" ></td>
                        <?php } ?>
                        <td><?php echo $key+1 ?></td>
                        <td><?php echo $item['tentour']?></td>
						<td><?php echo $item['thoigian']?></td>
                        <td class="number"><?php echo $this->string->numberFormate($item['giatour'])?></td>      
                        <td class="number"><?php echo $this->string->numberFormate($item['khuyenmai'])?></td>                        
                        <td><img src="<?php echo $item['imagethumbnail']?>"></td>
        				
                       	
                        <?php if($dialog!=true){ ?>
                        <td class="link-control">
                            <?php if($this->user->checkPermission("ste/tour/update")==true){ ?>
                            <input type="button" class="button" name="btnEdit" value="<?php echo $item['text_edit']?>" onclick="window.location='<?php echo $item['link_edit']?>'"/>
                            <?php } ?>
                           
                            
                        </td>
                        <?php } ?>
                    </tr>
        <?php
            }
        ?>
                        
                                                    
                </tbody>
                </table>
                <?php echo $pager?>

<?php if($dialog){ ?>
<script language="javascript">
	intSelectMovie()
</script>
<?php } ?>