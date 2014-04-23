<?php
class ControllerSitebarSearchtour extends Controller
{
	public function index()
	{
		$this->load->model("core/category");
		$this->data['location'] = array();
		$this->model_core_category->getTree("location",$this->data['location']);
		unset($this->data['location'][0]);
		
		$this->data['gia'] = array();
		$this->model_core_category->getTree("gia",$this->data['gia']);
		unset($this->data['gia'][0]);
		
		$this->id="content";
		$this->template="sitebar/searchtour.tpl";
		$this->render();
	}
}
?>