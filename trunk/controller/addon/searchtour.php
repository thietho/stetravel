<?php
class ControllerAddonSearchtour extends Controller
{
	private $error = array();
	public function index()
	{
		$this->load->model("ste/tour");
		$keyword = urldecode($this->request->get['keyword']);
		
		$this->document->breadcrumb = "Tìm kiếm tour";
		$this->data['title'] ="Kết quả tìm kiếm với từ khóa: '$keyword'";
		
		
		$template = array(
					  'template' => "module/tour_list.tpl",
					  'width' => 123,
					  'height' =>0,
					  'paging' => true,
					  'itemofpage' => 20,
					  'sorting' =>true
					  );
		if($keyword)
		{
			$arrkey = split(' ', $keyword);
			foreach($arrkey as $key)
			{
				$arr[] = "tentour like '%".$key."%'";
			}
			$where .= " AND (
								(". implode(" AND ",$arr). ")) Order by id desc";
			
			$data_tour = $this->model_ste_tour->getList($where);
		}
		if(count($data_tour))
		{
			$arr = array('',$data_tour,$template);
			$this->data['module'] = $this->loadModule('module/tour','listTour',$arr);
		}
		else
		{
			$this->data['module'] = "Không có tour phù hợp!!!";
		}
		$this->id="content";
		$this->template="addon/searchtour.tpl";
		$this->render();
	}
}
?>