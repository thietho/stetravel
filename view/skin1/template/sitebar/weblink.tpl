<style type="text/css">
/*<![CDATA[*/




#tst {
  position:absolute;width:218px;height:400px;background-Color:#FFFFCC;
}

.inner {
  position:absolute;left:0px;top:0px;width:200px;
}

.inner IMG {
  float:left;margin-Top:5px;
}


/*]]>*/
</style>
<div class="ben-section">

	
    <div class="ben-section-title"><?php echo $sitemap['sitemapname']?></div>
    <div class="ben-section-content" style="height:400px;">
    	<div id="tst">
            <div class="inner" >
                
            <?php foreach($medias as $media) {?>
            <a href="<?php echo $media['weblink']?>" target="_blank"><img src="<?php echo $media['imagethumbnail']?>" title="<?php echo $media['title']?>" alt="<?php echo $media['title']?>" /></a>
            
            <?php } ?>
            </div>
    	</div>
    	
    </div>

</div>
<script language="javascript">
function zxcCrawler(o){
 var oop=this,mde=o.Mode,mde=typeof(mde)=='string'&&mde.charAt(0).toUpperCase()=='V'?['top','offsetTop','offsetHeight',1]:['left','offsetLeft','offsetWidth',0],obj=document.getElementById(o.ID),div=obj.getElementsByTagName('DIV')[0],clds=div.getElementsByTagName('*'),lst=clds[clds.length-1],psz=obj[mde[2]],max,nu,sobj=document.createElement('DIV'),div,z0=0,e=o.Edge,e=typeof(e)=='number'?e:50,maxspd=o.MaxScroll,minspd=o.MinScroll;
 
 obj.style.overflow='hidden';
 div.style[mde[4]]='10000px';
 sobj.style.position='absolute';
 sobj.style.left='0px';
 sobj.style.top='0px';
 obj.appendChild(sobj);
 max=lst[mde[1]]+lst[mde[2]],nu=Math.ceil(psz/max)+1;
 for (;z0<nu;z0++){
  div=z0>0?div.cloneNode(true):div;
  div.style.position='absolute';
  div.style[mde[0]]=max*z0+'px';
  sobj.appendChild(div);
 }
 this.ow=obj.offsetWidth;
 this.oh=obj.offsetHeight;
 this.mde=mde;
 this.max=max;
 this.edge=e;
 this.rev=o.ReverseEdges==true?-1:1;
 this.save=o.SaveDirection;
 this.obj=obj;
 this.sobj=sobj;
 this.mm=[e,psz-e];
 this.maxspd=typeof(maxspd)=='number'?maxspd:5;
 this.minspd=typeof(minspd)=='number'?minspd:0;
 this.spd=this.minspd;
 setInterval(function(){ oop.scroll(); },50);
 this.addevt(document,'mousemove','scrollmove');
}

zxcCrawler.prototype={

 scrollmove:function(e){
  var mde=this.mde[3],mse=this.mse(e),pos=this.pos(this.obj),x=mse[0]-pos[0],y=mse[1]-pos[1],s=mse[mde]-pos[mde],mm=this.mm,e=this.edge,spd=this.maxspd;
  this.spd=this.minspd;
  if (x>0&&x<this.ow&&y>0&&y<this.oh){
   this.spd=0;
   if (s<mm[0]||s>mm[1]){
    this.spd=(s<mm[0]?e-s:mm[1]-s)/e*spd*this.rev;
    if (this.save){
     this.minspd=Math.abs(this.minspd)*(this.spd>0?1:-1);
    }
   }
  }
 },

 scroll:function(){
  var sobj=this.sobj;
  mde=this.mde;
  spd=this.spd;
  x=this.style(sobj,mde[0])+spd;
  
  x+=this.max*(spd<0&&x<-this.max?1:spd>0&&x>0?-1:0);
  
  sobj.style[mde[0]]= x+'px';
 },

 pos:function(obj){
  var rtn=[0,0];
  while(obj){
   rtn[0]+=obj.offsetLeft;
   rtn[1]+=obj.offsetTop;
   obj=obj.offsetParent;
  }
  return rtn;
 },

 addevt:function(o,t,f,p){
  var oop=this;
  if (o.addEventListener) o.addEventListener(t,function(e){ return oop[f](e,p);}, false);
  else if (o.attachEvent) o.attachEvent('on'+t,function(e){ return oop[f](e,p); });
 },

 style:function(obj,p){
  if (obj.currentStyle){
   return parseInt(obj.currentStyle[p.replace(/-/g,'')]);
  }
  return parseInt(document.defaultView.getComputedStyle(obj,null).getPropertyValue(p));
 },

 mse:function(e){
	 
  if (window.event){
   var docs=[document.body.scrollLeft,document.body.scrollTop];
   if (!document.body.scrollTop){
    docs=[document.documentElement.scrollLeft,document.documentElement.scrollTop];
   }
   
   return [e.clientX+docs[0],e.clientY+docs[1]];
  }
  return [e.pageX,e.pageY];
 }

}
function runWeblink()
{
	new zxcCrawler({
	  ID:'tst',           // the unique ID name of the parent DIV.                      (string)
	  Mode:'Vertical',    //(optional) the type of display, 'Horizontal' or 'Vertical'. (string, default = 'Horizontal')
	  MaxScroll:-5,        //(optional) the maximum scroll speed.                        (number, default = 5)
	  MinScroll:-2,        //(optional) the mouseout scroll speed.                       (number, default = 0)
	  Edge:50,            //(optional) distance from the edges to activate scrolling.   (number, default = 50)
	  ReverseEdges:false, //(optional) reverse the edge scroll direction.               (boolean, default = false)
	  SaveDirection:true  //(optional)  remember the current scroll direction.          (boolean, default = false)
	 }
	);
}
setTimeout('runWeblink()',1000);
</script>