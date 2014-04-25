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
		$this->data['output'] = "<option value=''>---Tất cả---</option>";
		switch($loaitour)
		{
			case "tour-nuoc-ngoai":
				$location = array();
				$this->model_core_category->getTree("location",$location,-1, "", "","vietnam");
				unset($location[0]);
				foreach($location as $it)
				{
					$this->data['output'] .= "<option class='".$it['categoryid']."' value='".$it['categoryid']."' ref='".$it['categoryname']."'>".$it['categoryname']."</option>";
					
                }
				break;
			case "tour-trong-nuoc":
				$location = array();
				$this->model_core_category->getTree("vietnam",$location);
				unset($location[0]);
				foreach($location as $it)
				{
					$this->data['output'] .= "<option class='".$it['categoryid']."' value='".$it['categoryid']."' ref='".$it['categoryname']."'>".$it['categoryname']."</option>";
				
                        
                }
				break;
			case "honeymoon-tour":
				$location = array();
				$this->model_core_category->getTree("location",$location);
				unset($location[0]);
				foreach($location as $it)
				{
					$this->data['output'] .= "<option class='".$it['categoryid']."' value='".$it['categoryid']."' ref='".$it['categoryname']."'>".$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']).$it['categoryname']."</option>";
					
                }
				break;
		}
		
		
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
	}
}
?>