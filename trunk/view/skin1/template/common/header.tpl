<div id="ben-header">
    <div id="ben-top">
        <div class="ben-left" id="ben-logo">
            <a href="<?php echo HTTP_SERVER?>"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo.png" alt="Logo" title="logo"/></a>
        </div>
    	
        
        
    	
        <div class="ben-right" id="ben-hotline">HOT LINE: <span>0909 556 023‏</span></div>
        <div class="ben-navigation ben-right">
        
            <ul id="ben-main-nav">
                <?php echo $mainmenu?>
            </ul>
    
            <div class="clearer">&nbsp;</div>
    
        </div>
        <div id="ben-header-bottom"></div>
        <div class="clearer">&nbsp;</div>
        
        
    </div>
    
    
</div>

<script src="<?php echo HTTP_SERVER.DIR_JS?>menu.js" language="javascript"></script>
<script language="javascript">
var arrcolor = new Array('#6e4709',"#de3f01","#fb0303","#ecfb03");
var incolor = 0;
function runChangeColor()
{
	//alert(incolor)
	$('#ben-hotline span').css('color',arrcolor[incolor]);
	incolor++;
	
	if(incolor>=arrcolor.length)
	{
		incolor = 0;
	}
	setTimeout('runChangeColor();',500);
}
$(document).ready(function(e) {
    runChangeColor();
});
$('.lang').click(function(e) {
    $.get("<?php echo HTTP_SERVER?>?lang="+this.id,function(){
		$.blockUI({ message: "<h1>Please wait!!!</h1>" }); 
		window.location.reload();	
	});
});
$('#txtsearch').keyup(function(e) {
    if(e.keyCode == 13)
	{
		window.location = "<?php echo HTTP_SERVER?>search/keyword/"+ this.value+".html";
	}
});
<?php
	if($_GET['keyword'])
	{
?>
$(document).ready(function(e) {
    $('#txtsearch').val("<?php echo $_GET['keyword']?>");
});
<?php
	}
?>
</script>