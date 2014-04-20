<div class="ben-section">
    <div class="ben-section-title"><div class="title"><?php echo $text_myaccount?></div></div>
    <div>
        
        <ul id="menu">
        	<li>
                <div class="collape">
                    <a href="<?php echo $this->document->createLink('historyorder');?>"><?php echo $text_orders?></a>
                    <div class="clearer">^ </div>
                </div>
            </li>
            <li>
                <div class="collape">
                    <a href="#"><?php echo $text_comparelist?></a>
                    <div class="clearer">^ </div>
                </div>
            </li>
            <li>
                <div class="collape">
                    <a href="#"><?php echo $text_event?></a>
                    <div class="clearer">^ </div>
                </div>
            </li>
            <li>
                <div class="collape">
                    <a href="<?php echo $this->document->createLink('wishlist')?>"><?php echo $text_wishlist?></a>
                    <div class="clearer">^ </div>
                </div>
            </li>
        </ul>
    </div>
</div>