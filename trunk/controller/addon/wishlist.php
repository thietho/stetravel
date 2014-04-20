<?php
class ControllerAddonWishlist extends Controller
{
	private $error = array();
	public function index()
	{
		$this->document->breadcrumb .= "Danh sách muong muốn";
		
		$this->id="content";
		$this->template="addon/wishlist.tpl";
		$this->render();
	}
	
	public function getList()
	{
		$this->data['medias'] =array();
		if(isset($_SESSION['wishlist']))
		{
			$this->data['medias'] = $_SESSION['wishlist'];
		}
		
		$this->id="content";
		$this->template="addon/wishlist_list.tpl";
		$this->render();
	}
	
	public function add()
	{
		$this->load->model("core/media");
		$this->load->helper('image');
		$data = $this->request->get;
		if(!isset($_SESSION['wishlist']))
		{
			$_SESSION['wishlist'] = array();	
		}
		$mediaid = $data['mediaid'];
		$media = $this->model_core_media->getItem($mediaid);
		
		$media['imagethumbnail'] = HelperImage::resizePNG($media['imagepath'], 100, 100);
		$title = $this->document->productName($media);
		
		
		$_SESSION['wishlist'][$mediaid] = array(
											'mediaid' => $mediaid,
											'title' => $title,
											'imagethumbnail' => $media['imagethumbnail'],
											
											);
		$this->data['output'] = "true";
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	public function update()
	{
		$this->load->model("core/media");
		$this->load->helper('image');
		$data = $this->request->get;
		if(!isset($_SESSION['wishlist']))
		{
			$_SESSION['wishlist'] = array();	
		}
		$mediaid = $data['mediaid'];
		$media = $this->model_core_media->getItem($mediaid);
		$media['imagethumbnail'] = HelperImage::resizePNG($media['imagepath'], 100, 100);
		$qty =  $this->string->toNumber($data['qty']);
		$_SESSION['wishlist'][$mediaid]['qty'] = $qty;
		
		$this->data['output'] = "true";
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	public function remove()
	{
		$data = $this->request->get;	
		$mediaid = $data['mediaid'];
		unset($_SESSION['wishlist'][$mediaid]);
		
		$this->data['output'] = "true";
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
}
?>