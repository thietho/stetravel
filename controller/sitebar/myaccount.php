<?php
class ControllerSitebarMyaccount extends Controller
{
	public function index($sitemapid = "",$status = "" )
	{
		
		
		$this->id="content";
		$this->template="sitebar/myaccount.tpl";
		$this->render();
	}
}
?>