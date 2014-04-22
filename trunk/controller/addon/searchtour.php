<?php
class ControllerAddonSearchtour extends Controller
{
	private $error = array();
	public function index()
	{
		
		$keyword = urldecode($this->request->get['keyword']);
		
		$this->document->breadcrumb = "Kết quả tìm kiếm với từ khóa: '$keyword'";
		
		$this->id="content";
		$this->template="addon/searchtour.tpl";
		$this->render();
	}
	
	
}
?>