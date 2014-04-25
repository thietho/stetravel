<div class="ben-section">
	<div class="ste-sitebar-searchtouradvant">
    	<div class="clearer">&nbsp;</div>
    	<div class="ste-sitebar-searchtouradvant-title">Tìm tour</div>
        <form id="frmAdvsearch" method="get" action="<?php echo $this->document->createLink('searchtour')?>">
        <table style="margin:0 auto">
        	<tr>
            	<td><input type="radio" id="tour-nuoc-ngoai" class="loaitour" name="loaitour" value="tour-nuoc-ngoai" /></td>
                <td>Tour nước ngoài</td>
            </tr>
            <tr>
            	<td><input type="radio" id="tour-trong-nuoc" class="loaitour" name="loaitour" value="tour-trong-nuoc" /></td>
                <td>Tour trong nước</td>
            </tr>
            <tr>
            	<td><input type="radio" id="honeymoon-tour" class="loaitour" name="loaitour" value="honeymoon-tour" /></td>
                <td>Honeymoon tour</td>
            </tr>
        </table>
        <table style="margin:0 auto">
        	<tr>
            	<td>Nơi khởi hành</td>
                <td>
                	<select id="diemdi" name="diemdi" class="location">
                        <option class="hochiminh" ref="Hồ Chí Minh" value="hochiminh">Hồ Chí Minh</option>
                        <option class="hanoi" ref="Hà Nội" value="hanoi">Hà Nội</option>
                        
                    </select>
                </td>
            </tr>
            <tr>
            	<td>Nơi đến</td>
                <td>
                	<select id="diemden" name="diemden" class="location">
                        <option value="">---Tất cả---</option>
                        
                    </select>
                </td>
            </tr>
            <tr>
            	<td>Giá</td>
                <td>
                	<select id="gia" name="gia" class="gia">
                        <option value="">---</option>
                        <?php foreach($gia as $it){ ?>
                        <option class="<?php echo $it['categoryid']?>" value="<?php echo $it['categoryid']?>" ref="<?php echo $it['categoryname']?>"><?php echo $it['categoryname']?></option>                        
                        <?php } ?>
                    </select>
                    <?php echo $this->document->setup['Currency']?>
                </td>
            </tr>
            
        </table>
        <center>
        	<input type="submit" id="btnAdvSearch" class="button" value="Tìm kiếm" />
        </center>
        </form>
        
    </div>
</div>
<div class="ben-section">
    <div class="ste-sitebar-searchtour">
    	<table style="width:100%">
        	<tr>
            	<td><input type="text" id="txt_search" class="ben-text-searchtour" value="Tour du lịch, điểm đến du lịch..." onfocus="this.value=''" onblur="if(this.value=='') this.value='Tour du lịch, điểm đến du lịch...'"/></td>
                <td width="34px" id="btnSearch"><center><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>btn-search.png"/></center></td>
            </tr>
        </table>
        
    </div>
</div>
<script language="javascript">
$("#<?php echo $para['loaitour']?>").attr('checked','checked');
$('#diemdi').val("<?php echo $para['diemdi']?>");
$('#diemden').val("<?php echo $para['diemden']?>");
$('#gia').val("<?php echo $para['gia']?>");
$('#btnSearch').click(function(e) {
	if($('#txt_search').val()!='Tour du lịch, điểm đến du lịch...')
    	window.location = "<?php echo $this->document->createLink('searchtour')?>?keyword="+ $('#txt_search').val();
	else
		alert("Bạn chưa nhập từ khóa tìm kiếm")
});
$('#txt_search').keyup(function(e) {
    if(e.keyCode == 13)
		$('#btnSearch').click();
});
$('.loaitour').click(function(e) {
    $.get("?route=sitebar/searchtour/getDiemDen&loaitour="+ this.value,function(html){
			$('#diemden').html(html);
		})
});
$(document).ready(function(e) {
	$.get("?route=sitebar/searchtour/getDiemDen&loaitour=honeymoon-tour",function(html){
			$('#diemden').html(html);
		})  
});
</script>