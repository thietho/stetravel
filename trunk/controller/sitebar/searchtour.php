<?php
class ControllerSitebarSearchtour extends Controller
{
	public function index()
	{
		$this->load->model("core/category");
		$this->load->model("ste/tour");
		
		
		
		$this->data['gia'] = array();
		$this->model_core_category->getTree("gia",$this->data['gia']);
		unset($this->data['gia'][0]);
		
		$this->data['para'] = $this->request->get;
		
		$this->id="content";
		$this->template="sitebar/searchtour.tpl";
		$this->render();
	}
	public function getDiemDen()
	{
		$loaitour = $this->request->get['loaitour'];
		$this->load->model("core/category");
		switch($loaitour)
		{
			case "tour-nuoc-ngoai":
				break;
			case "tour-nuoc-ngoai":
				break;
			case "honeymoon-tour":
				break;
		}
		$this->data['location'] = array();
		$this->model_core_category->getTree("location",$this->data['location']);
		unset($this->data['location'][0]);
		
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
	}
}
?>