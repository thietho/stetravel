<div class="ben-section-title"><div class="title"><?php echo $sitemap['sitemapname']?></div></div>
<div class="ben-section-content">
    <div class="ben-post">
        
        <h2><?php echo $post['title'.$this->language->getLang()]?></h2>
        <div class="ben-post-date"><?php echo $this->date->formatMySQLDate($post['statusdate'] , 'longdate', "/");?></div>
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
    

    <h3>Các tin khác</h3>             
    <div>
        <ul id="othernews">

        </ul>
    </div>

    <div class="ben-post-pagination ben-post-pagination-bottom">
        <a class="ben-left" id="btnprevious">« Về trước</a>
        <a class="ben-right" id="btnnext">Tiếp theo »</a>
        <div class="clearer">&nbsp;</div>
    </div>
    <div class="clearer">&nbsp;</div>
</div>
<script type="application/javascript">
    function Pager()
    {
        this.index = 1;
        this.numitem = 10;
        this.data = new Object();
        this.show = function(page)
        {
            if(page <1)
                page = 1;

            var i = (page - 1)*this.numitem;
            $('#othernews').html('');
            for(i = (page - 1)*this.numitem; i< page*this.numitem && i < this.data.length ;i++)
            {

                var str = '<li><a href="'+this.data[i].link+'">'+this.data[i].title+'&nbsp;<span class="ben-other">('+this.data[i].statusdate+')</span></a></li>';
                $('#othernews').append(str);
            }
            if(this.index == 1)
                $('#btnprevious').hide();
            else
                $('#btnprevious').show();

            if(pager.index*pager.numitem >= pager.data.length)
                $('#btnnext').hide();
            else
                $('#btnnext').show();
        }
    }
    var pager = new Pager();
    $(document).ready(function () {
        $.getJSON("<?php echo HTTP_SERVER?>?route=module/pagedetail/getOtherNews&mediaid=<?php echo $post['alias']?>", function (data) {
            pager.data = data;
            pager.show(1);
        });
    });
    $('#btnnext').click(function(){
        if(pager.index*pager.numitem < pager.data.length)
            pager.show(++pager.index);
    });
    $('#btnprevious').click(function(){
        if(pager.index>1)
            pager.show(--pager.index);
    });
</script>
