<div class="ben-home-news">
    
    <table class="tabletop">
        <tr>
            <td width="450px">
                <a href="<?php echo $medias[0]['link']?>"><img src="<?php echo $medias[0]['imagethumbnail']?>" /></a>
                <p>
                    <h4><a href="<?php echo $medias[0]['link']?>"><?php echo $medias[0]['title']?></a></h4>
                    <?php echo $medias[0]['summary']?>
                </p>
            </td>
            <td>
            	<table>
                <?php for($i=1;$i<count($medias)&& $i<9;$i++){ ?>
                	<tr height="50px">
                    	<td><a href="<?php echo $medias[$i]['link']?>"><img src="<?php echo $medias[$i]['imagethumbnail']?>" width="50px"/></a></td>
                        <td><a href="<?php echo $medias[$i]['link']?>"><?php echo $medias[$i]['title']?></a></td>
                    </tr>
                <?php } ?>
                </table>
            </td>
        </tr>
    </table>
    
</div>

            