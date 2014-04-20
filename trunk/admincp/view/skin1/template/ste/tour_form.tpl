<div class="section" id="sitemaplist">

	<div class="section-title"><?php echo $this->document->title?></div>
    
    <div class="section-content padding1">
    
    	<form  id="frm_tour_form" action="<?php echo $action?>" method="post" enctype="multipart/form-data">
        	
            
        	<div class="button right">
            	<input type="button" value="Lưu" class="button" onClick="save('')"/>
                 <input type="button" value="Bỏ qua" class="button" onclick="linkto('?route=ste/tour')"/>  
     	        <input type="hidden" name="id" value="<?php echo $item['id']?>">
                
            </div>
            <div class="clearer">^&nbsp;</div>
        	<div id="error" class="error" style="display:none"></div>
        	<div id="container">
            	<ul>
                    <li class="tabs-selected"><a href="#fragment-tourinfo" ><span>Thông tin tour</span></a></li>
                    <li><a href="#fragment-chuongtrinh"><span>Chương trình</span></a></li>
                    <li><a href="#fragment-detail"><span>Chi tiết</span></a></li>
                    
                    
                </ul>
                <div id="fragment-tourinfo">
                	<div class="left">
                    	                        <p>
                            <label>Tên tour</label><br />
                            <input type="text" id="tentour" name="tentour" value="<?php echo $item['tentour']?>" class="text" size=60/>
                            
                        </p>
                        <p>
                            <label>Thời gian</label><br />
                            <input type="text" id="thoigian" name="thoigian" value="<?php echo $item['thoigian']?>" class="text" size=60/>
                            
                        </p>
                        <p>
                            <label>Giá tour</label><br />
                            <input type="text" id="giatour" name="giatour" value="<?php echo $item['giatour']?>" class="text number short"/>
                            
                        </p>
                        <p>
                            <label>Khuyến mãi</label><br />
                            <input type="text" id="khuyenmai" name="khuyenmai" value="<?php echo $item['khuyenmai']?>" class="text number short"/>%<br />
                            <label>Giá đã giảm: <span id="giadagiam"></span></label>
                        </p>
                        <p>
                            
                            <input type="checkbox" id="trangthai" name="trangthai" value="noibat" <?php echo ($item['trangthai']=='noibat')?'checked="checked"':''?>/> Tour nổi bật
                            
                        </p>
                        <p>
                            <label>Thông tin</label><br />
                            <input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('thongtin','editor')"/>
                            <input type="button" class="button" value="Chọn video" onclick="browserFile('thongtin','video')"/>
                            <textarea class="text" id="thongtin" name="thongtin"><?php echo $item['thongtin']?></textarea>
                        </p>

                    </div>
                    <div class="right">
                    	<p>
                        	<label>Hình ảnh</label><br />
                        	<input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('images','multi')"/>
                        	<div id="images">
                        	</div>
                        </p>
                    </div>
					<div class="clearer">^&nbsp;</div>
                </div>
                <div id="fragment-chuongtrinh">
                	
                    <input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('chuongtrinh','editor')"/>
                	<input type="button" class="button" value="Chọn video" onclick="browserFile('chuongtrinh','video')"/>
                    <br />
                	<textarea class="text" id="chuongtrinh" name="chuongtrinh"><?php echo $item['chuongtrinh']?></textarea>
                </div>
                <div id="fragment-detail">
                	<input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('chitiet','editor')"/>
                    <input type="button" class="button" value="Chọn video" onclick="browserFile('chitiet','video')"/>
                    <br />
                	<textarea class="text" id="chitiet" name="chitiet"><?php echo $item['chitiet']?></textarea>
                </div>
                
            </div>
            
        </form>
    
    </div>
    
</div>
<script type="text/javascript" charset="utf-8">
var arratt = new Array();
$(document).ready(function(e) {
	$("#images").sortable();
    <?php
		foreach($item['arrimage'] as $key => $item)
		{
			if(count($item))
			{
	?>
					arratt[<?php echo $key?>] = <?php echo $item['fileid']?>;
				
	<?php
				}
			}
	?>
	callAtt(0)
});
$('#khuyenmai').keyup(function(e) {
    var giatour = Number(stringtoNumber($('#giatour').val()));
	var khuyenmai = Number(stringtoNumber($('#khuyenmai').val()));
	var giagiam = giatour*(1 - khuyenmai/100 );
	
	$('#giadagiam').html(formateNumber(giagiam));
});
function callAtt(pos)
{
	if(arratt[pos]!= undefined)
	{
		$.getJSON("?route=core/file/getFile&fileid="+ arratt[pos] +"&width=100", 
		function(file) 
		{
			
			$('#images').append(attachment.creatAttachmentRow(file.file.fileid,file.file.filename,file.file.imagepreview));
			callAtt(pos+1);
		});
	}
}
function save()
{
	$.blockUI({ message: "<h1><?php echo $announ_infor ?></h1>" }); 
	var oEditor = CKEDITOR.instances['thongtin'] ;
	var pageValue = oEditor.getData();
	$('textarea#thongtin').val(pageValue);
	
	var oEditor = CKEDITOR.instances['chuongtrinh'] ;
	var pageValue = oEditor.getData();
	$('textarea#chuongtrinh').val(pageValue);
	
	var oEditor = CKEDITOR.instances['chitiet'] ;
	var pageValue = oEditor.getData();
	$('textarea#chitiet').val(pageValue);
	
	
	
	$.post("?route=ste/tour/save",$('#frm_tour_form').serialize(),
		function(data){
			if(data=="true")
			{
				window.location = "?route=ste/tour";
				
			}
			else
			{
				$('#error').html(data).show('slow');
				$.unblockUI();
			}
			
		});
}




$(document).ready(function() { 
	setCKEditorType('thongtin',2);
	setCKEditorType('chuongtrinh',2);
	setCKEditorType('chitiet',2);
	
	$('#container').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
	
});
</script>

