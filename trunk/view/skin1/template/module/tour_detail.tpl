<div class="ben-section-title"><div class="title"><?php echo $this->document->getSiteMap($tour['loaitour'])?></div></div>


<div class="ben-post">
	<h2><?php echo $tour['tentour']?></h2>
	<div class="ben-left product-left">
    	
    	<?php if(count($tour['arr_imagethumbnail'])){ ?>
        <div class="product-mainimage">
        	<table>
            	<tr valign="middle">
                	<td id="product-preview" height="250px" align="center"><a class="zoom" href="<?php echo $tour['arr_imagepreview'][0]?>"><img  src="<?php echo $tour['arr_imagethumbnail'][0]?>" /></a></td>
                </tr>
            </table>
	        
        </div>
        
        <?php }?>
        
        <div id="ben-galary" class="ben-center">
            <table>
                <tr>
                    <td style="width:14px">
                        <img class="ben-link" id="ben-prev" src="<?php echo HTTP_SERVER.DIR_IMAGE?>galary_button_prev.png" title="<?php echo $post['title']?>" alt="<?php echo $post['title']?>"/>
                    </td>
                    <td>
                        <div style="overflow:hidden;width:248px;margin:0 auto;">
                            <table id="ben-scroll">
                                <tr>
                                   
                                    <?php foreach($tour['arr_icon'] as $key => $val){ ?>
                                    <td>
                                        <img  id="icon-<?php echo $key?>" class="ben-icon-item" src="<?php echo $val?>" />
                                    </td>
                                    <?php } ?>
                                </tr>
                            </table>
                        </div>
                        
                    </td>
                    <td style="width:14px">
                        <img class="ben-link" id="ben-next" src="<?php echo HTTP_SERVER.DIR_IMAGE?>galary_button_next.png" />
                    </td>
                </tr>
            </table>
        </div>
<script language="javascript">
$(document).ready(function() { 
$(".ben-icon-item").click(function(){
	var arr = this.id.split("-");
	var key = arr[1];
	$("#product-preview").html($("#preview-"+key).html());
	$(".zoom").fancybox({
			'overlayShow'	: true,
			'transitionIn'	: 'elastic',
			'transitionOut'	: 'elastic'
		});
});

	
	$('#ben-container').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
	
	$(".zoom").fancybox({
			'overlayShow'	: true,
			'transitionIn'	: 'elastic',
			'transitionOut'	: 'elastic'
		});
});
</script>
<script language="javascript">
var block1 = 62;
var length = $("#ben-scroll").width();
var view = 248;
var move = true
var movenext = true
$("#ben-prev").click(function(){
	movenext = true;
	if(move == true)
	{
		move = false;
		var left = $("#ben-scroll").css("margin-left").replace("px","");
		//alert(left);
		if(left < 0)
		{
			
			$("#ben-scroll").animate({"marginLeft": "+="+ block1 +"px"}, "slow",function(){
				/*left = $("#ben-scoll").css("margin-left").replace("px","");
				if(left > 0)
					$("#ben-scoll").css("margin-left","0px");*/
				move = true;
			});
			
			
		}
		else
			move = true;
	}
		
});
$("#ben-next").click(function(){
	length = $("#ben-scroll").width();
	if(movenext == true)
	{
		movenext = false;
		
		var left = $("#ben-scroll").css("margin-left").replace("px","");
		
		if( parseInt(length) + parseInt(left) > view)
			$("#ben-scroll").animate({"marginLeft": "-="+ block1 +"px"}, "slow",function(){
				movenext = true;
			});
	}
	
});
</script>
        <div style="display:none">
            <?php foreach($tour['arr_imagethumbnail'] as $key => $val){ ?>
            <div  id="preview-<?php echo $key?>">
                <a class="zoom" href="<?php echo $tour['arr_imagepreview'][$key]?>"><img src="<?php echo $val?>" /></a>
            </div>
            <?php } ?>
        </div>
     
    </div>
    <div class="ben-right product-right">
        
        
        <div class="ben-post-body">
        	<p>
            	<strong>Thời gian:</strong>
                <?php echo $tour['thoigian']?>
            </p>
            
            <p>
            	<strong>Giá tour:</strong>
                <span class="ste_tourprice"><?php echo $this->string->numberFormate($tour['giatour'])?> <?php echo $this->document->setup['Currency']?></span>
                
                <?php if(!$tour['khuyenmai']){ ?>
                <a class="ste-button-order" href="<?php echo $tour['linkorder']?>">Đặt tour</a>
                <?php } ?>
            </p>
            <?php if($tour['khuyenmai']){ ?>
            <p>
            	<strong>Khuyến mãi:</strong>
                <?php echo $tour['khuyenmai']?>%
            </p>
            <p>
            	<strong>Giá còn:</strong>
                <span class="ste_tourprice"><?php echo $this->string->numberFormate($tour['giatour']*(1-$tour['khuyenmai']/100))?> <?php echo $this->document->setup['Currency']?></span>
                
                
                <a class="ste-button-order" href="<?php echo $tour['linkorder']?>">Đặt tour</a>
            </p>
            <?php }?>
            <p>
            	<strong>Phương tiện:</strong>
                <?php echo $tour['phuongtien']?>
            </p>
            <p>
            	<strong>Khởi hành:</strong>
                <?php echo $tour['khoihanh']?>
            </p>
            <p class="short_intro">
            	<?php echo html_entity_decode($tour['thongtin'])?>
                
            </p>
            <?php if(count($data_samplecode)>1){ ?>
            <p>
            	<?php foreach($data_samplecode as $key => $item){?>
                <a href="<?php echo $this->document->createLink($this->document->sitemapid,$item['alias'])?>" title="<?php echo $item['color']?>"><img src="<?php echo $item['icon']?>" /></a>
                <?php } ?>
            </p>
            <?php } ?>
        </div>
        
    </div>
    <div class="clearer">&nbsp;</div>

    <div class="ben-hline"></div>
    <div id="container">
        <ul>
            <li class="tabs-selected"><a href="#fragment-chuongtrinh" ><span>Chương trình tour</span></a></li>
            <li><a href="#fragment-dieukhoan"><span>Điều khoản</span></a></li>
            <li><a href="#fragment-banggia"><span>Bảng Giá</span></a></li>
            
        </ul>
        <div id="fragment-chuongtrinh">
        	<?php echo html_entity_decode($tour['chuongtrinh'])?>
        </div>
        <div id="fragment-dieukhoan">
        	<?php echo html_entity_decode($tour['dieukhoan'])?>
        </div>
        <div id="fragment-banggia">
        	<?php echo html_entity_decode($tour['banggia'])?>
        </div>
    </div>
    
    
    <div class="clearer">&nbsp;</div>
</div>


    
<script language="javascript">
$(document).ready(function(e) {
    $('#container').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
});
$(".product-icon").click(function(){
	var arr = this.id.split("-");
	var key = arr[1];
	$("#product-preview").attr("src",$("#preview-"+key).attr("src"));
});






</script>
