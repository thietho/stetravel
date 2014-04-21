<div class="section">

	<div class="section-title"><?php echo $this->document->title?></div>
    
    <div class="section-content">
    	
        <form action="" method="post" id="frm_tour_list">
        	<div id="ben-search">
            	<label>Tên tour</label>
                <input type="text" id="moviename" name="moviename" class="text" value="" />
                
                
                <br />
                <input type="button" class="button" name="btnSearch" value="Tìm" onclick="searchForm()"/>
                <input type="button" class="button" name="btnSearch" value="Xem tất cả" onclick="viewAll()"/>
            </div>
        	<div class="button right">
            	<?php if($dialog==true){ ?>
            	
                
                
                <?php }else{ ?>
                
               
                <?php if($this->user->checkPermission("ste/tour/insert")==true){ ?>
                <input class="button" value="Thêm" type="button" onclick="window.location='<?php echo $insert?>'">
                <?php } ?>
                <?php if($this->user->checkPermission("ste/tour/delete")==true){ ?>
            	<input class="button" type="button" name="delete_all" value="Xóa" onclick="deleteitem()"/>
                <?php } ?>
                <?php } ?>
            </div>
            <div class="clearer">^&nbsp;</div>
            
            <div id="listmovie" class="sitemap treeindex">
                
            </div>
        	
        
        </form>
        
    </div>
    
</div>
<script language="javascript">

function deleteitem()
{
	var answer = confirm("Bạn có muốn xóa không?")
	if (answer)
	{
		$.post("?route=ste/tour/delete", 
				$("#frm_tour_list").serialize(), 
				function(data)
				{
					if(data!="")
					{
						alert(data)
						window.location.reload();
					}
				}
		);
	}
}
$(document).ready(function(e) {
    viewAll();
});

$('.text').keyup(function(e) {
    searchForm();
});
$('select').change(function(e) {
    searchForm();
});
function viewAll()
{
	url = "?route=ste/tour/getList";
	if("<?php echo $_GET['opendialog']?>" == "true")
	{
		url += "&opendialog=true";
	}
	$('#listmovie').html(loading);
	$('#listmovie').load(url);
}

function searchForm()
{
	var url =  "";
	if($("#frm_movie #moviename").val() != "")
		url += "&moviename=" + encodeURI($("#frm_movie #moviename").val());
	
	

	
	if("<?php echo $_GET['opendialog']?>" == "true")
	{
		url += "&opendialog=true";
	}
	$('#listmovie').html(loading);
	$('#listmovie').load("?route=ste/tour/getList"+url);
}

function moveto(url,eid)
{
	$(eid).html(loading);
	$(eid).load(url);	
}
</script>