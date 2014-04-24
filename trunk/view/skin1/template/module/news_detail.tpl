<div class="ben-section-title"><div class="title"><?php echo $sitemap['sitemapname']?></div></div>
<div class="ben-section-content">
    <div class="ben-post">
        
        <h2><?php echo $post['title'.$this->language->getLang()]?></h2>
        <div class="ben-post-date"><?php echo $post['statusdate']?></div>
        <div class="ben-post-body">
            <p><b><?php echo $post['summary'.$this->language->getLang()]?></b></p>
        </div>
        <div class="clearer">&nbsp;</div>
    </div>
    <div class="ben-hline"></div>
    <p>
        <?php echo $post['description'.$this->language->getLang()]?>
    </p>
    <p class="ben-text-right">
        <b><?php echo $post['source']?></b>
    </p>
    <div class="ben-hline"></div>
    
    <?php if($othernews) {?>
    <h3>Các tin khác</h3>             
    <div>
        <ul>
            <?php foreach($othernews as $media) {?>
            <li><a href="<?php echo $media['link']?>"><?php echo $media['title'.$this->language->getLang()]?>&nbsp;<span class="ben-other">(<?php echo $media['statusdate']?>)</span></a></li>
            <?php } ?>    
        </ul>
    </div>
    <?php } ?>
    
    <div class="clearer">&nbsp;</div>
</div>