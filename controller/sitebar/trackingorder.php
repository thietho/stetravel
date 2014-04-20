<?php
class ControllerSitebarTrackingorder extends Controller
{
	public function index($sitemapid = "",$status = "" )
	{
		
		
		$this->id="content";
		$this->template="sitebar/trackingorder.tpl";
		$this->render();
	}
}
?>