<?php
class ControllerModuleTour extends Controller
{
	function __construct() 
	{
		$this->load->model("core/file");
		$this->load->helper('image');
   	}
	public function listTour($title,$data_tour,$template)
	{
		
		foreach($data_tour as $key => $tour)
		{
			$arr_fileid = $this->string->referSiteMapToArray($data_tour[$key]['images']);
			$arr_imagethumbnail =array();
			foreach($arr_fileid as $fileid)
			{
				$file = $this->model_core_file->getFile($fileid);
				$arr_imagethumbnail[] = HelperImage::resizePNG($file['filepath'], $template['width'], $template['height']);
			}
			$data_tour[$key]['arrthumbnail'] = $arr_imagethumbnail;
			$str = $this->string->chuyenvekodau(trim($tour['tentour']));
			$str = $this->string->removeKtdatbiet(trim($tour['tentour']));
			$str = strtolower(str_replace(" ",'-',$str));
			$alias = $tour['id']."-".$str;
			$link = $this->document->createLink($tour['loaitour'],$alias);
			$linkorder = $this->document->createLink('booking',$alias);
			$data_tour[$key]['link'] = $link;
			$data_tour[$key]['linkorder'] = $linkorder;
		}
		$this->data['title'] = $title;
		$this->data['data_tour'] = array();
		if(!$template['paging'])
		{
			$this->data['data_tour'] = $data_tour;
		}
		else
		{
			$page = $_GET['page'];
			$x=$page;		
			$limit = $template['itemofpage'];
			$total = count($data_tour);
			//$uri = $this->document->createLink($sitemapid);
			$uri = $this->document->getURI();
			// work out the pager values 
			$this->data['pager']  = $this->pager->pageLayoutWeb($total, $limit, $page,$uri); 
			
			$pager  = $this->pager->getPagerData($total, $limit, $page); 
			$offset = $pager->offset; 
			$limit  = $pager->limit; 
			$page   = $pager->page;
			for($i=$offset;$i < $offset + $limit && count($data_tour[$i])>0;$i++)
			{
				$this->data['data_tour'][] = $data_tour[$i];
			}
		}
		
		
		$this->id="content";
		$this->template = $template['template'];
		$this->render();
	}
	
	public function detail($tour,$template)
	{
		$arr_fileid = $this->string->referSiteMapToArray($tour['images']);
		$arr_imagethumbnail =array();
		$arr_icon =array();
		$arr_imagepreview =array();
		foreach($arr_fileid as $fileid)
		{
			$file = $this->model_core_file->getFile($fileid);
			$arr_icon[] = HelperImage::resizePNG($file['filepath'], 0, 60);
			$arr_imagethumbnail[] = HelperImage::resizePNG($file['filepath'], $template['width'], $template['height']);
			$arr_imagepreview[] = HelperImage::resizePNG($file['filepath'], $template['widthpreview'], $template['widthpreview']);
			
		}
		$tour['arr_icon'] = $arr_icon;
		$tour['arr_imagethumbnail'] = $arr_imagethumbnail;
		$tour['arr_imagepreview'] = $arr_imagepreview;
		
		$str = $this->string->chuyenvekodau(trim($tour['tentour']));
		$str = $this->string->removeKtdatbiet(trim($tour['tentour']));
		$str = strtolower(str_replace(" ",'-',$str));
		$alias = $tour['id']."-".$str;
		$link = $this->document->createLink($tour['loaitour'],$alias);
		$linkorder = $this->document->createLink('booking',$alias);
		$tour['link'] = $link;
		$tour['linkorder'] = $linkorder;
		
		$diemdentext = "";
		$arrdiemden = $this->string->referSiteMapToArray($tour['diemden']);
		foreach($arrdiemden as $diemden)
		{
			if($diemdentext == "")
				$diemdentext .= $this->document->getCategory($diemden);
			else
				$diemdentext .= " - ".$this->document->getCategory($diemden);
			
		}
		$tour['diemdentext'] = $diemdentext;
		
		$this->data['tour'] = $tour;
		
		$this->id="content";
		$this->template = $template['template'];
		$this->render();
	}
}
?>