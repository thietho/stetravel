<?php
class ControllerSitebarCart extends Controller
{
	public function index()
	{
		
		$this->id="content";
		$this->template="sitebar/cart.tpl";
		$this->render();
	}
	
	public function getList()
	{
		$this->data['medias'] =array();
		if(isset($_SESSION['cart']))
		{
			$this->data['medias'] = $_SESSION['cart'];
		}
		
		$this->id="content";
		$this->template="sitebar/cart_list.tpl";
		$this->render();	
	}
	public function getCount()
	{
		$this->data['medias'] =array();
		if(isset($_SESSION['cart']))
		{
			$this->data['medias'] = $_SESSION['cart'];
		}
		$count = 0;
		foreach($this->data['medias'] as $item)
		{
			$count+=$item['qty'];
		}
		$this->data['output'] = $count;
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
	}
}
?>