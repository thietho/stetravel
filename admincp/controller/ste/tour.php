<?php
class ControllerSteTour extends Controller
{
	private $error = array();
	function __construct() 
	{
		
		$this->load->model("core/module");
		$moduleid = $this->getRoute();
		$this->document->title = $this->model_core_module->getBreadcrumbs($moduleid);
		if($this->user->checkPermission($moduleid)==false)
		{
			$this->response->redirect('?route=page/home');
		}
		
		
		
		$this->load->helper('image');
		$this->load->model("ste/tour");
		$this->load->model("core/file");
		$this->load->model("core/sitemap");
		$this->load->model("core/category");
		$siteid = $this->user->getSiteId();
		$where = " AND moduleid = 'module/tour'";
		$this->data['data_loaitour'] = $this->model_core_sitemap->getList($siteid, $where);
		$this->data['location'] = array();
		$this->model_core_category->getTree("location",$this->data['location']);
		unset($this->data['location'][0]);
		
		
   	}
	public function index()
	{
		$this->data['insert'] = $this->url->http('ste/tour/insert');
		$this->data['delete'] = $this->url->http('ste/tour/delete');
		
		$this->id='content';
		$this->template="ste/tour_list.tpl";
		$this->layout="layout/center";
		
		if($this->request->get['opendialog']=='true')
		{
			$this->layout="";
			$this->data['dialog'] = true;
			
		}
		$this->render();
	}
	
	public function insert()
	{
    	$this->getForm();
	}
	
	public function update()
	{
		$this->data['haspass'] = false;
		$this->data['readonly'] = 'readonly="readonly"';
		$this->getForm();		
  	}
	
	public function delete() 
	{
		$listid=$this->request->post['delete'];
		//$listmadonvi=$_POST['delete'];
		
		if(count($listid))
		{
			foreach($listid as $id)
			$this->model_ste_tour->delete($id);
			$this->data['output'] = "Xóa thành công";
		}
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
  	}
	
	public function getList() 
	{
		
		
		$this->data['datas'] = array();
		$where = "";
		
		$tentour = urldecode($this->request->get['tentour']);
		$loaitour = urldecode($this->request->get['loaitour']);
		$diemdi = urldecode($this->request->get['diemdi']);
		$diemden = urldecode($this->request->get['diemden']);
		$noibat = urldecode($this->request->get['noibat']);
		$hot = urldecode($this->request->get['hot']);
		$khuyenmai = urldecode($this->request->get['khuyenmai']);
		if($tentour)
		{
			$arrkey = split(' ', $tentour);
			foreach($arrkey as $key)
			{
				$arr[] = "tentour like '%".$key."%'";
			}
			$where .= " AND ((". implode(" AND ",$arr). "))";
		}
		if($loaitour)
		{
			$where .= " AND loaitour like '".$loaitour."'";	
		}
		if($diemdi)
		{
			$where .= " AND diemdi like '".$diemdi."'";	
		}
		if($diemden)
		{
			$where .= " AND diemden like '%[".$diemden."]%'";	
		}
		if($diemdi)
		{
			$where .= " AND diemdi like '".$diemdi."'";	
		}
		if($noibat)
		{
			$where .= " AND trangthai like '%[".$noibat."]%'";	
		}
		if($hot)
		{
			$where .= " AND trangthai like '%[".$hot."]%'";	
		}
		if($khuyenmai)
		{
			$where .= " AND khuyenmai > 0";	
		}
		
		$where .= " Order by id desc";
		$rows = $this->model_ste_tour->getList($where);
		//Page
		$page = $this->request->get['page'];		
		$x=$page;		
		$limit = 20;
		$total = count($rows); 
		// work out the pager values 
		$this->data['pager']  = $this->pager->pageLayoutAjax($total, $limit, $page,"#listtour");
		
		$pager  = $this->pager->getPagerData($total, $limit, $page); 
		$offset = $pager->offset; 
		$limit  = $pager->limit; 
		$page   = $pager->page;
		for($i=$offset;$i < $offset + $limit && count($rows[$i])>0;$i++)
		//for($i=0; $i <= count($this->data['datas'])-1 ; $i++)
		{
			$this->data['datas'][$i] = $rows[$i];
			$this->data['datas'][$i]['link_edit'] = $this->url->http('ste/tour/update&id='.$this->data['datas'][$i]['id']);
			$this->data['datas'][$i]['text_edit'] = "Sửa";
			;
			//
			$arr = $this->string->referSiteMapToArray($this->data['datas'][$i]['images']);
			
			$file = $this->model_core_file->getFile($arr[0]);
			$this->data['datas'][$i]['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
			
			$arr = array($this->data['datas'][$i]['id']);
			
		}
		$this->data['refres']=$_SERVER['QUERY_STRING'];
		$this->id='content';
		$this->template="ste/tour_table.tpl";
		
		if($this->request->get['opendialog']=='true')
		{
			$this->layout="";
			$this->data['dialog'] = true;
			
		}
		$this->render();
	}
	
	
	private function getForm()
	{
		
		$sanphamid = $this->request->get['id'];
		if($sanphamid) 
		{
      		$this->data['item'] = $this->model_ste_tour->getItem($this->request->get['id']);
			$diemdentext = "";
			$arrdiemden = $this->string->referSiteMapToArray($this->data['item']['diemden']);
			foreach($arrdiemden as $diemden)
			{
				if($diemdentext == "")
					$diemdentext .= $this->document->getCategory($diemden);
				else
					$diemdentext .= "-".$this->document->getCategory($diemden);
				
			}
			$this->data['item']['trangthai'] = $this->string->referSiteMapToArray($this->data['item']['trangthai']);
			$this->data['item']['diemdentext'] = $diemdentext;
			$this->data['item']['arrimage'] = $this->string->referSiteMapToArray($this->data['item']['images']);
			
    	}
		
		$this->id='content';
		$this->template='ste/tour_form.tpl';
		$this->layout="layout/center";
		
		$this->render();
	}
	
	public function save()
	{
		$data = $this->request->post;
		if(count($data['trangthai']) == 0)
			$data['trangthai'] = "";
		else
			$data['trangthai'] = $this->string->arrayToString($data['trangthai']);
		
		$data['giatour'] = $this->string->toNumber($data['giatour']);
		$data['khuyenmai'] = $this->string->toNumber($data['khuyenmai']);
		$arr_fileid = $data['attimageid'];
		$data['images'] = $this->string->arrayToString($arr_fileid);
		if($this->validateForm($data))
		{
			
			
			$data['id'] = $this->model_ste_tour->save($data);
			
			
			$this->data['output'] = "true";
		}
		else
		{
			foreach($this->error as $item)
			{
				$this->data['output'] .= $item."<br>";
			}
		}
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	private function validateForm($data)
	{
    	if($data['tentour'] == "")
		{
      		$this->error['tentour'] = "Bạn chưa nhập tên tour";
    	}
		

		if (count($this->error)==0) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}
	//Cac ham xu ly tren form
	
	
}
?>