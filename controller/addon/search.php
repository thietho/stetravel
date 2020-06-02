<?php
class ControllerAddonSearch extends Controller
{
	private $error = array();
	public function index()
	{
		
		$keyword = urldecode($this->request->get['keyword']);
		
		$this->document->breadcrumb = "Kết quả tìm kiếm với từ khóa: '$keyword'";
		$this->getList($keyword);
		$this->id="content";
		$this->template="addon/search.tpl";
		$this->render();
	}
	
	private function getList($keyword)
	{
		$this->load->model("core/media");
		$this->load->model("core/sitemap");
		$this->load->helper('image');
		
		
		//
		//Get list
		$arrkey = split(' ', $keyword);
		$where = " AND mediatype in('module/product','module/news')";
		if($keyword !="")
		{
			$arr = array();
			$arrcode = array();
			$arrbarcode = array();
			$arrref = array();
			$arrsummary = array();
			$arrdescription = array();
			
			foreach($arrkey as $key)
			{
				$arr[] = "title like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrcode[] = "code like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrbarcode[] = "barcode like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrref[] = "ref like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrsummary[] = "summary like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrdescription[] = "description like '%".$key."%'";
			}
			$where .= " AND (
								(". implode(" AND ",$arr). ") 
								OR (". implode(" AND ",$arrcode). ") 
								OR (". implode(" AND ",$arrbarcode). ") 
								OR (". implode(" AND ",$arrref). ") 
								OR (". implode(" AND ",$arrsummary). ") 
								OR (". implode(" AND ",$arrdescription). ") 
							)";
		}
		
		$medias = $this->model_core_media->getList($where);
		
		$this->data['medias'] = array();
		
	
		$index = -1;
		foreach($medias as $media)
		{
			$index += 1;
			
			
			$arr = $this->string->referSiteMapToArray($media['refersitemap']);
			$sitemapid = $arr[0];
			
			$link = $this->document->createLink($sitemapid,$media['alias']);
			
			$imagethumbnail = "";
			if($media['imagepath'] != "" && $template['width'] >0 )
			{
				$imagethumbnail = HelperImage::resizePNG($media['imagepath'], $template['width'], $template['height']);
			}

			
			$this->data['medias'][] = array(
				'mediaid' => $media['mediaid'],
				'title' => $media['title'],
				'summary' => html_entity_decode($media['summary']),
				'imagethumbnail' => $imagethumbnail,
				'statusdate' => $this->date->formatMySQLDate($media['statusdate'], 'longdate', "/"),
				'link' => $link
			);
			
		}
	}
}
?>