<div class="ben-section">

	
    <div class="ben-section-title"><?php echo $sitemap['sitemapname']?></div>
    <div class="ben-section-content">
    	
        	
        <?php foreach($medias as $media) {?>
        <a href="<?php echo $media['weblink']?>"><img src="<?php echo $media['imagethumbnail']?>" title="<?php echo $media['title']?>" alt="<?php echo $media['title']?>" /></a>
        
        <?php } ?>
        
    	
    	
    </div>

</div>