<?php
class ControllerSitebarSearchtour extends Controller
{
	public function index()
	{
		$this->id="content";
		$this->template="sitebar/searchtour.tpl";
		$this->render();
	}
}
?>