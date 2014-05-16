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
                    <li><a href="#fragment-dieukhoan"><span>Điều khoản</span></a></li>
                    <li><a href="#fragment-banggia"><span>Bảng Giá</span></a></li>
                    
                </ul>
                <div id="fragment-tourinfo">
                	<div class="left">
                    	                        <p>
                            <label>Tên tour</label><br />
                            <input type="text" id="tentour" name="tentour" value="<?php echo $item['tentour']?>" class="text" size=60/>
                            
                        </p>
                        <p>
                            <label>Loại tour</label><br />
                            <select id="loaitour" name="loaitour">
                            	<?php foreach($data_loaitour as $loaitour){ ?>
                                <option value="<?php echo $loaitour['sitemapid']?>"><?php echo $loaitour['sitemapname']?></option>
                                <?php }?>
                            </select>
                        </p>
                        <p>
                            <label>Thời gian</label><br />
                            <input type="text" id="thoigian" name="thoigian" value="<?php echo $item['thoigian']?>" class="text" size=60/>
                            
                        </p>
                        <p>
                            <label>Nơi khởi hành</label><br />
                            <select id="diemdi" name="diemdi">
                                <option value=""></option>
                                <?php foreach($location as $it){ ?>
                                <option class="<?php echo $it['categoryid']?>" value="<?php echo $it['categoryid']?>" ref="<?php echo $it['categoryname']?>"><?php echo $this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo $it['categoryname']?></option>                        
                                <?php } ?>
                            </select>
                            
                        </p>
                        <p>
                            <label>Nơi đến</label><br />
                            <input type="hidden" id="diemden" name="diemden" value="<?php echo $item['diemden']?>"/>
                            <span id="diemdentext"><?php echo $item['diemdentext']?></span><br />
                            <input type="button" class="button" id="btnAddDiemden" value="Thêm điểm đến"/>
                        </p>
                        <p>
                            <label>Giá tour</label><br />
                            <input type="text" id="giatour" name="giatour" value="<?php echo $item['giatour']?>" class="text number short"/>
                            
                        </p>
                        <p>
                            <label>Phương tiện</label><br />
                            <input type="text" id="phuongtien" name="phuongtien" value="<?php echo $item['phuongtien']?>" class="text" size=60/>
                            
                        </p>
                        <p>
                            <label>Khởi hành</label><br />
                            <input type="text" id="khoihanh" name="khoihanh" value="<?php echo $item['khoihanh']?>" class="text" size=60/>
                            
                        </p>
                        <p>
                            <label>Khuyến mãi</label><br />
                            <input type="text" id="khuyenmai" name="khuyenmai" value="<?php echo $item['khuyenmai']?>" class="text number short"/>%<br />
                            <label>Giá đã giảm: <span id="giadagiam"></span></label>
                        </p>
                        <p>
                            <?php foreach($trangthaitour as $it){ ?>
                            <input type="checkbox" id="trangthai" name="trangthai[]" value="<?php echo $it['categoryid']?>" <?php echo (in_array($it['categoryid'],$item['trangthai']))?'checked="checked"':''?>/> <?php echo $it['categoryname']?>
                            <?php }?>
                            
                            
                        </p>
                        <p>
                            <label>Thông tin vắn tắc</label><br />
                            
                            <textarea class="text" id="thongtinvantac" name="thongtinvantac"><?php echo $item['thongtinvantac']?></textarea>
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
                <div id="fragment-dieukhoan">
                	<input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('dieukhoan','editor')"/>
                    <input type="button" class="button" value="Chọn video" onclick="browserFile('dieukhoan','video')"/>
                    <br />
                	<textarea class="text" id="dieukhoan" name="dieukhoan"><?php echo $item['dieukhoan']?></textarea>
                </div>
                <div id="fragment-banggia">
                	<input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('banggia','editor')"/>
                    <input type="button" class="button" value="Chọn video" onclick="browserFile('banggia','video')"/>
                    <br />
                	<textarea class="text" id="banggia" name="banggia"><?php echo $item['banggia']?></textarea>
                </div>
                
            </div>
            
        </form>
    
    </div>
    
</div>
<script type="text/javascript" charset="utf-8">
var arratt = new Array();
function showLocation()
{
	var eid = "fromlocation";
	$('body').append('<div id="'+eid+'" style="display:none"></div>');
	
	$("#"+eid).attr('title','Thông tin file');
		$("#"+eid).dialog({
			autoOpen: false,
			show: "blind",
			hide: "explode",
			width: 300,
			height: 150,
			modal: true,
			close:function()
				{
					$("#"+eid).remove();
				},
			buttons: {
				
				
				
				'Chon':function()
				{
					var diemden = $('#diemden').val();
					diemden +="["+ $('#selectlocation').val() +"]"
					$('#diemden').val(diemden);
					if($('#diemdentext').html() == "")
						$('#diemdentext').append($('.'+$('#selectlocation').val()).attr('ref'));
					else
						$('#diemdentext').append("-"+$('.'+$('#selectlocation').val()).attr('ref'));
					$("#"+eid).dialog( "close" );
				},
				'Đóng': function() 
				{
					
					$("#"+eid).dialog( "close" );
					
				},
			}
		});
	
		$("#"+eid).dialog("open");
		$("#"+eid).html("<select id='selectlocation'>"+$('#diemdi').html()+"</select>");
}
$(document).ready(function(e) {
	$('#loaitour').val("<?php echo $item['loaitour']?>");
	$('#diemdi').val("<?php echo $item['diemdi']?>");
	$("#images").sortable();
	$('#khuyenmai').keyup();
	$('#btnAddDiemden').click(function(e) {
        showLocation();
    });
    <?php
	if(count($item['arrimage']))
		foreach($item['arrimage'] as $key => $fileid)
		{
			if(count($item))
			{
	?>
					arratt[<?php echo $key?>] = "<?php echo $fileid?>";
				
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
	if(arratt[pos]!= undefined && arratt[pos]!="")
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
	
	var oEditor = CKEDITOR.instances['dieukhoan'] ;
	var pageValue = oEditor.getData();
	$('textarea#dieukhoan').val(pageValue);
	
	var oEditor = CKEDITOR.instances['banggia'] ;
	var pageValue = oEditor.getData();
	$('textarea#banggia').val(pageValue);
	
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
	setCKEditorType('dieukhoan',2);
	setCKEditorType('banggia',2);
	
	$('#container').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
	
});
</script>

