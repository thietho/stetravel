<div class="section" id="sitemaplist">

	<div class="section-title"><?php echo $dash_header ?></div>
    
    <div class="section-content padding1">
    
    	<form name="frm" id="frm" action="<?php echo $action?>" method="post" enctype="multipart/form-data">
        
        	<div class="button right">
            	<input type="button" value="<?php echo $button_save ?>" class="button" onClick="save()"/>   
     	        <input type="hidden" name="mediaid" value="<?php echo $item['mediaid']?>">
                
            </div>
            <div class="clearer">^&nbsp;</div>
        	<div id="error" class="error" style="display:none"></div>
        	<div>
            	<h3><?php echo $dash_infor_header ?></h3><br />
            	<p>
            		<label><?php echo $dash_title ?></label><br />
					<input type="text" name="Title" value="<?php echo $item['Title']?>" class="text" size=60 />
            	</p>
                <p>
            		<label><?php echo $dash_slogan ?></label><br />
					<input type="text" name="Slogan" value="<?php echo $item['Slogan']?>" class="text" size=60 />
            	</p>
                  
                <p>
            		<label><?php echo $dash_currency ?></label><br />
					<input type="text" name="Currency" value="<?php echo $item['Currency']?>" class="text" size=60 />
            	</p>
                
                <p>
            		<label><?php echo $dash_email ?></label><br />
					<input type="text" name="EmailContact" value="<?php echo $item['EmailContact']?>" class="text" size=60 />
            	</p>
                <p>
                    <label>Keyword</label><br />
                    <textarea name="Keyword"><?php echo $item['Keyword']?></textarea>
                        
                </p>
				<p>
                    <label>Mô tả</label><br />
                    <textarea name="Description"><?php echo $item['Description']?></textarea>
                        
                </p>
            </div>
            <div>
            	<label>Tour nổi bật</label><br />
                <input type="button" class="button" id="btnAddTourNoiBat" value="Chọn tour" onclick="selectTour('listtournoibat','add')"/>
                <div id="listtournoibat"></div>
            </div>
        </form>
    
    </div>
    
</div>

<script language="javascript">

function save()
{
	$.blockUI({ message: "<h1><?php echo $announ_infor ?></h1>" }); 
	/*var oEditor = CKEDITOR.instances['editor1'] ;
	var pageValue = oEditor.getData();
	$('textarea#editor1').val(pageValue);*/
	$.post("?route=common/dashboard/save", $("#frm").serialize(),
		function(data){
			if(data == "true")
			{
				//window.location.reload();
			}
			$.unblockUI();
		}
	);
}
var index = 0;
function addRow(obj)
{
	var str ='<tr id="row'+index+'">';
	str += '<td><input type="hidden" id="film'+index+'" name="film['+index+']" value="'+obj.id+'"/><span id="film'+index+'_name">'+obj.moviename+'</span></td>';
	str += '<td><img id="film'+index+'_icon" src="'+obj.icone+'"/></td>';
	str += '<td><input type="button" class="button" value="Chọn film" onclick="selectFilm(\'film'+index+'\',\'edit\')"/><input type="button" class="button" value="X" onclick="$(\'#row'+index+'\').remove()"/></td>';
	str += '</tr>';
	$('#listfilm').append(str);
	index++;
}
function selectTour(eid,type)
{
    $('#handler').val(eid);
	$('#outputtype').val(type);
	$('body').append('<div id="tourform" style="display:none"></div>');
	var eid = "#tourform";
	$(eid).attr('title','Chọn tour');
		$( eid ).dialog({
			autoOpen: false,
			show: "blind",
			hide: "explode",
			width: $(document).width()-100,
			height: window.innerHeight,
			modal: true,
			close:function()
				{
					$(eid).remove();
				},
			
		});
	
		$(eid).dialog("open");
		$(eid).html(loading);
		$(eid).load("?route=ste/tour&opendialog=true",function(){
			
		});
		
}
</script>
