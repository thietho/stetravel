<?php
class ControllerAddonBooking extends Controller
{
	private $error = array();
	public function index()
	{
		$this->document->breadcrumb .= "Đặt tour";
		
		$this->id="content";
		$this->template="addon/booking.tpl";
		$this->render();
	}
}
?>