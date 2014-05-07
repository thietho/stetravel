<div class="section">

	<div class="section-title"><?php echo $this->document->title?></div>
    
    <div class="section-content">
    	
        <form action="" method="post" id="frm_tour_list">
        	<div id="ben-search">
            	<label>Tên tour</label>
                <input type="text" id="tentour" name="tentour" class="text" value="" />
                <label>Loại tour</label>
                <select id="loaitour" name="loaitour">
                	<option value=""></option>
                    <?php foreach($data_loaitour as $loaitour){ ?>
                    <option value="<?php echo $loaitour['sitemapid']?>"><?php echo $loaitour['sitemapname']?></option>
                    <?php }?>
                </select>
                
                <label>Nơi khởi hành</label>
                <select id="diemdi" name="diemdi">
                    <option value=""></option>
                    <?php foreach($location as $it){ ?>
                    <option class="<?php echo $it['categoryid']?>" value="<?php echo $it['categoryid']?>" ref="<?php echo $it['categoryname']?>"><?php echo $this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo $it['categoryname']?></option>                        
                    <?php } ?>
                </select>
                <label>Nơi đến</label>
                <select id="diemden" name="diemden">
                    <option value=""></option>
                    <?php foreach($location as $it){ ?>
                    <option class="<?php echo $it['categoryid']?>" value="<?php echo $it['categoryid']?>" ref="<?php echo $it['categoryname']?>"><?php echo $this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo $it['categoryname']?></option>                        
                    <?php } ?>
                </select>
                <input type="checkbox" class="search" id="noibat" name="noibat" value="noibat"/> Tour nổi bật
                <input type="checkbox" class="search" id="hot" name="hot" value="hot"/> Tour hot
        		<input type="checkbox" class="search" id="khuyenmai" name="khuyenmai" value="khuyenmai"/> Tour khuyến mãi
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
            
            <div id="listtour" class="sitemap treeindex">
                
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
$('.search').click(function(e) {
    searchForm();
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
	$('#listtour').html(loading);
	$('#listtour').load(url);
}

function searchForm()
{
	var url =  "";
	if($("#frm_tour_list #tentour").val() != "")
		url += "&tentour=" + encodeURI($("#frm_tour_list #tentour").val());
	if($("#frm_tour_list #loaitour").val() != "")
		url += "&loaitour=" + encodeURI($("#frm_tour_list #loaitour").val());
	if($("#frm_tour_list #diemdi").val() != "")
		url += "&diemdi=" + encodeURI($("#frm_tour_list #diemdi").val());
	if($("#frm_tour_list #diemden").val() != "")
		url += "&diemden=" + encodeURI($("#frm_tour_list #diemden").val());	
	if(document.getElementById("noibat").checked == true)
		url += "&noibat=" + encodeURI($("#frm_tour_list #noibat").val());
	if(document.getElementById("hot").checked == true)
		url += "&hot=" + encodeURI($("#frm_tour_list #hot").val());	
	if(document.getElementById("khuyenmai").checked == true)
		url += "&khuyenmai=" + encodeURI($("#frm_tour_list #khuyenmai").val());	
	

	
	if("<?php echo $_GET['opendialog']?>" == "true")
	{
		url += "&opendialog=true";
	}
	$('#listtour').html(loading);
	$('#listtour').load("?route=ste/tour/getList"+url);
}

function moveto(url,eid)
{
	$(eid).html(loading);
	$(eid).load(url);	
}
</script>