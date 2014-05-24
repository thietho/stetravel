<?php
class ControllerPageHome extends Controller
{
	function __construct() 
	{
		//$this->iscache = true;
	 	$arr=array();
		foreach($_GET as $key => $val)
			$arr[] = $key."=".$val;
	 	$this->name ="PageHome".implode("_",$arr);
   	}
	public function index()
	{
		if($this->cachehtml->iscacht($this->name) == false)
		{
			$arr = array('menu-chinh');
			$this->data['mainmenu'] = $this->loadModule('common/header','showMenu',$arr);
			//Banner home
			$template = array(
						  'template' => "home/bannerhome.tpl",
						  'width' => 1000,
						  'height' =>1000,
						  );
		
			$arr = array("bannerhome",0,"",$template);
			$this->data['bannerhome'] = $this->loadModule('module/block','getList',$arr);
			//Tin nóng
			$template = array(
						  'template' => "home/news_list.tpl",
						  'width' => 450,
						  'height' =>0,
						  
						  );
			
			//$medias = $this->getHomeMedias('module/news');
			
			$arr = array("bang-tin",10,"",$template);
			$this->data['newshome'] = $this->loadModule('module/pagelist','getList',$arr);
			
			
			
			//Tour noi bat
			$this->load->model("ste/tour");
			$template = array(
						  'template' => "module/tour_list.tpl",
						  'width' => 123,
						  'height' =>0,
						  
						  );
			$data_tour = array();
			$listtournoibat = $this->document->setup['listtournoibat'];
			if($listtournoibat)
			{
				
				$arr_tourid = split(',',$listtournoibat);
				foreach($arr_tourid as $tourid)
				{
					$tour = $this->model_ste_tour->getItem($tourid);
					$data_tour[] = $tour;
				}
			}
			else
			{
				$where = " AND trangthai like '%[noibat]%' Order by id desc limit 0, 6";
				$data_tour = $this->model_ste_tour->getList($where);
			}
			$arr = array($this->document->getCategory('noibat'),$data_tour,$template);
			$this->data['noibat'] = $this->loadModule('module/tour','listTour',$arr);
			
			//Tour hàng ngày
			$data_tour = array();
			$this->load->model("ste/tour");
			$template = array(
						  'template' => "module/tour_list.tpl",
						  'width' => 123,
						  'height' =>0,
						  
						  );
			$listtourhangngay = $this->document->setup['listtourhangngay'];
			if($listtourhangngay)
			{
				
				$arr_tourid = split(',',$listtourhangngay);
				foreach($arr_tourid as $tourid)
				{
					$tour = $this->model_ste_tour->getItem($tourid);
					$data_tour[] = $tour;
				}
			}
			else
			{
				$where = " AND trangthai like '%[tourhangngay]%' Order by id desc limit 0, 6";
				$data_tour = $this->model_ste_tour->getList($where);
			}
			
			$arr = array($this->document->getCategory('tourhangngay'),$data_tour,$template);
			$this->data['tourhangngay'] = $this->loadModule('module/tour','listTour',$arr);
			//Tour hàng tuan
			$data_tour = array();
			$this->load->model("ste/tour");
			$template = array(
						  'template' => "module/tour_list.tpl",
						  'width' => 123,
						  'height' =>0,
						  
						  );
			$listtourhangtuan = $this->document->setup['listtourhangtuan'];
			if($listtourhangtuan)
			{
				
				$arr_tourid = split(',',$listtourhangtuan);
				foreach($arr_tourid as $tourid)
				{
					$tour = $this->model_ste_tour->getItem($tourid);
					$data_tour[] = $tour;
				}
			}
			else
			{
				$where = " AND trangthai like '%[tuorhangtuan]%' Order by id desc limit 0, 6";
				$data_tour = $this->model_ste_tour->getList($where);
			}
			
			$arr = array($this->document->getCategory('tuorhangtuan'),$data_tour,$template);
			$this->data['tuorhangtuan'] = $this->loadModule('module/tour','listTour',$arr);
			//TOUR HONEYMOON 
			/*$this->load->model("ste/tour");
			$template = array(
						  'template' => "module/tour_list.tpl",
						  'width' => 123,
						  'height' =>0,
						  
						  );
			$where = " AND loaitour like 'honeymoon-tour' Order by id desc limit 0, 6";
			$data_tour = $this->model_ste_tour->getList($where);
			
			$arr = array($this->document->getSitemap("honeymoon-tour"),$data_tour,$template);
			$this->data['honeymoontour'] = $this->loadModule('module/tour','listTour',$arr);*/
			
			//Tour khuyen mai
			/*$this->load->model("ste/tour");
			$template = array(
						  'template' => "module/tour_list.tpl",
						  'width' => 123,
						  'height' =>0,
						  
						  );
			$where = " AND khuyenmai > 0 Order by id desc limit 0, 8";
			$data_tour = $this->model_ste_tour->getList($where);
			
			$arr = array("Tour khuyến mãi",$data_tour,$template);
			$this->data['tourkhuyenmai'] = $this->loadModule('module/tour','listTour',$arr);*/
			$this->loadSiteBar();
			$this->document->title = $this->document->setup['Title'] ." - ". $this->document->setup['Slogan'];
			//print_r($this->data['leftsitebar']);
		}
		
		$this->id="content";
		$this->template="page/home.tpl";
		$this->layout="layout/home";
		$this->render();
	}
	
	private function loadSiteBar()
	{
		//Left sitebar
		$this->data['leftsitebar']['searchtour'] = $this->loadModule('sitebar/searchtour');
		$arr = array('danh-muc');
		$this->data['leftsitebar']['produtcategory'] = $this->loadModule('sitebar/catalogue','index',$arr);
		$this->data['leftsitebar']['supportonline'] = $this->loadModule('sitebar/supportonline');
		//$this->data['leftsitebar']['myaccount'] = $this->loadModule('sitebar/myaccount');
		//$this->data['leftsitebar']['trackingorder'] = $this->loadModule('sitebar/trackingorder');
		//$this->data['leftsitebar']['search'] = $this->loadModule('sitebar/searchproduct');
		$this->data['leftsitebar']['dknhantinh'] = $this->loadModule('sitebar/dangkynhantin');
		$this->data['leftsitebar']['banner'] = $this->loadModule('sitebar/weblink');
		
		//$this->data['leftsitebar']['exchange'] = $this->loadModule('sitebar/exchange');
		
		//$this->data['leftsitebar']['hitcounter'] = $this->loadModule('sitebar/hitcounter');
		
		//Rigth sitebar
		/*$this->data['rightsitebar']['cart'] = $this->loadModule('sitebar/cart');
		$this->data['rightsitebar']['login'] = $this->loadModule('sitebar/login');
		$this->data['rightsitebar']['supportonline'] = $this->loadModule('sitebar/supportonline');
		
		$template = array(
						  'template' => "sitebar/news.tpl",
						  'width' => 50,
						  'height' =>50
						  
						  );
		$arr = array('tin-tuc-san-pham',10,'',$template);
		$this->data['rightsitebar']['newsproduct'] = $this->loadModule('sitebar/news','index',$arr);
		$this->data['rightsitebar']['weblink'] = $this->loadModule('sitebar/weblink');*/
		//$this->data['rightsitebar']['search'] = $this->loadModule('sitebar/search');
		
		//$this->data['rightsitebar']['banner'] = $this->loadModule('sitebar/banner');
		//$this->data['rightsitebar']['question'] = $this->loadModule('sitebar/question');
	}
	
	function getHomeMedias($mediatype)
	{
		
		$this->load->model('core/media');
		//$siteid = $this->member->getSiteId();
		//$sitemaps = $this->model_core_sitemap->getListByModule("module/product", $siteid);
		//$arrsitemapid = $this->string->matrixToArray($sitemaps,"sitemapid");
		$queryoptions = array();
		$queryoptions['mediaparent'] = '';
		$queryoptions['mediatype'] = $mediatype;
		$queryoptions['refersitemap'] = '%';
		$data = $this->model_core_media->getPaginationList($queryoptions,$step=0,$to=0);
		
		return $data;
	}
	
	function getProduct($status)
	{
		$this->load->model('core/media');
		//$siteid = $this->member->getSiteId();
		//$sitemaps = $this->model_core_sitemap->getListByModule("module/product", $siteid);
		//$arrsitemapid = $this->string->matrixToArray($sitemaps,"sitemapid");
		$queryoptions = array();
		$queryoptions['mediaparent'] = '';
		$queryoptions['mediatype'] = 'module/product';
		$queryoptions['refersitemap'] = '%';
		$queryoptions['groupkeys'] = $status;
		$data = $this->model_core_media->getPaginationList($queryoptions, $step=0, $to=0);
		
		return $data;
	}
}
?>