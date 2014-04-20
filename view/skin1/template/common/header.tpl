<div id="ben-header">
    <div id="ben-top">
        <div class="ben-left" id="ben-logo">
            <a href="<?php echo HTTP_SERVER?>"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo.png" alt="Logo" title="logo"/></a>
        </div>
    	
        
        <div id="ben-top-menu" class="ben-right">
        	<ul>
            	<li><a href="#" title="English" id="en" class="lang"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>flagen.png" /></a></li>
                <li><a href="#" title="Việt Nam" id="vn" class="lang"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>flagvn.png" /></a></li>
                <?php if($this->member->isLogged()){?>
                <li><a href="<?php echo $this->document->createLink('memberinfor')?>"><?php echo $this->member->getId()?></a> <a>|</a> <a href="#" onclick="logout();"><?php echo $text_logout?></a></li>
                <?php }else{ ?>
            	<li><a href="<?php echo $this->document->createLink('memberinfor')?>"><?php echo $text_myaccount?></a></li>
                <?php }?>
                <li>|</li>
                <li><a href="<?php echo HTTP_SERVER?>"><?php echo $text_gift?></a></li>
                <li>|</li>
                <li><a href="<?php echo HTTP_SERVER?>"><?php echo $text_outbrands?></a></li>
                <li>|</li>
                <li><a href="<?php echo $this->document->createLink('cart')?>" id="cartcout"><?php echo $text_cardisempty?></a></li>
                
                
            </ul>
        	
        </div>
    	
        
        
        <div class="clearer">&nbsp;</div>
        <div class="ben-right" id="ben-header-search">
        	
            <input id="txtsearch" class="ben-textbox" type="text" value="<?php echo $button_search?>" style="width:221px;" onclick="this.value = ''" onblur="if(this.value == '') this.value = '<?php echo $button_search?>'"/>
        </div>
        <div class="clearer">&nbsp;</div>
        
    </div>
    <div class="ben-navigation ">
        
        <ul id="ben-main-nav">
            <?php echo $mainmenu?>
        </ul>

        <div class="clearer">&nbsp;</div>

    </div>
    <div id="ben-header-bottom"></div>
</div>

<script src="<?php echo HTTP_SERVER.DIR_JS?>menu.js" language="javascript"></script>
<script language="javascript">
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