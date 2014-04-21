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
		$siteid = $this->user->getSiteId();
		$where = " AND moduleid = 'module/tour'";
		$this->data['data_loaitour'] = $this->model_core_sitemap->getList($siteid, $where);
		
		
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
		
		$datasearchlike['tentour'] = urldecode($this->request->get['tentour']);
		
		
		$arr = array();
		foreach($datasearchlike as $key => $item)
		{
			if($item !="")
				$arr[] = " AND " . $key ." like '".$item."%'";
		}
		
		
		
		$where = implode("",$arr);
		
		$where .= " Order by id desc";
		$rows = $this->model_ste_tour->getList($where);
		//Page
		$page = $this->request->get['page'];		
		$x=$page;		
		$limit = 20;
		$total = count($rows); 
		// work out the pager values 
		$this->data['pager']  = $this->pager->pageLayoutAjax($total, $limit, $page,"#listmovie");
		
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
			
			//$arr = $this->string->referSiteMapToArray($this->data['item']['images']);
			//$file = $this->model_core_file->getFile($this->data['item']['image']);
			//$this->data['item']['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);	
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
		if($data['trangthai'] == "")
			$data['trangthai'] = "";
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