<?php
class ControllerAddonSearchtour extends Controller
{
	private $error = array();
	public function index()
	{
		$this->load->model("ste/tour");
		$keyword = urldecode($this->request->get['keyword']);
		$loaitour = urldecode($this->request->get['loaitour']);
		$diemdi = urldecode($this->request->get['diemdi']);
		$diemden = urldecode($this->request->get['diemden']);
		$gia = urldecode($this->request->get['gia']);
		
		$this->document->breadcrumb = "Tìm kiếm tour";
		
		
		
		$template = array(
					  'template' => "module/tour_list.tpl",
					  'width' => 123,
					  'height' =>0,
					  'paging' => true,
					  'itemofpage' => 20,
					  'sorting' =>true
					  );
		$where = "";
		if($keyword)
		{
			$this->data['title'] ="Kết quả tìm kiếm với từ khóa: '$keyword'";
			$arrkey = split(' ', $keyword);
			foreach($arrkey as $key)
			{
				$arr[] = "tentour like '%".$key."%'";
			}
			$where .= " AND (
								(". implode(" AND ",$arr). "))";
			
			
		}
		if($loaitour)
		{
			$where.= " AND loaitour like '".$loaitour."'";
		}
		if($diemdi)
		{
			$where.= " AND diemdi like '".$diemdi."'";
		}
		if($diemden)
		{
			$where.= " AND diemden like '%[".$diemden."]%'";
		}
		if($gia)
		{
			$arrgia = split("-",$gia);
			if($arrgia[0])
				$where .= " AND giatour >= ".$arrgia[0];
			if($arrgia[1])
				$where .= " AND giatour <= ".$arrgia[1];
		}
		$where .=" Order by id desc";
		$data_tour = $this->model_ste_tour->getList($where);
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