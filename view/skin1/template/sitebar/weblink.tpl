<div class="ben-section">

	
    <div class="ben-section-title"><?php echo $sitemap['sitemapname']?></div>
    <div class="ben-section-content">
    	<div id="showLink">
            
    	</div>
    	
    </div>
</div>
<div style="display:none">           
    <?php foreach($medias as $key => $media) {?>
    <div id="link-<?php echo $key?>"><a href="<?php echo $media['weblink']?>" target="_blank"><img src="<?php echo $media['imagethumbnail']?>" title="<?php echo $media['title']?>" alt="<?php echo $media['title']?>" /></a></div>
    <?php } ?>
</div>
<script language="javascript">
$(document).ready(function(e) {
	 
});
function WebLink()
{
	this.index = 0;
	this.count = <?php echo count($medias)?>;
	this.show = function(p)
	{
		$('#showLink').fadeOut('slow',function(){
			$('#showLink').html($('#link-'+p).html());
			$('#showLink').fadeIn('slow');	
		});
	}
	this.run = function()
	{
		if(this.index < this.count)
		{
			this.show(this.index);
			this.index++;	
		}
		else
			this.index = 0;
		setTimeout('w.run()',5000);
	}
}
var w = new WebLink();
w.run();

</script>
<iframe src="//www.facebook.com/plugins/likebox.php?href=https://www.facebook.com/stetravel&width=230&height=240&colorscheme=light&show_faces=true&border_color=#caccce&stream=false&header=false&appId=230452393704666" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:234px; height:240px;" allowtransparency="true"></iframe>