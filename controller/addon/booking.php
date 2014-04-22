<?php
class ControllerAddonBooking extends Controller
{
	private $error = array();
	
	public function index()
	{
		$this->load->model("ste/tour");
		$this->document->breadcrumb .= "Đặt tour";
		$alias = $this->request->get['id'];
		$arr = split('-',$alias);
		$tour = $this->model_ste_tour->getItem($arr[0]);
		
		$this->data['tour'] = $tour;
		$this->id="content";
		$this->template="addon/booking.tpl";
		$this->render();
	}
	
	public function order()
	{
		
		$data=$this->request->post;
		$error = $this->validate($data);
		if(count($error))
		{
			foreach($error as $item)
				$this->data['output'].=$item."<br>";
		}
		else
		{
			
			$this->load->model("core/media");
			$sitemapid = $data['sitemapid'];
			$media = $this->model_core_media->getItem($this->member->getSiteId().$sitemapid);
			/*$email1 = $this->model_core_media->getInformation($this->member->getSiteId().$data['sitemapid'], "email1");
			$email2 = $this->model_core_media->getInformation($this->member->getSiteId().$data['sitemapid'], "email2");
			$email3 = $this->model_core_media->getInformation($this->member->getSiteId().$data['sitemapid'], "email3");*/
			$email = $this->model_core_media->getInformation("setting", 'EmailContact');
			$email1 = $email;
			$arrmail = array();
			if($email1)
				$arrmail[] = $email1;
			if($email2)
				$arrmail[] = $email2;
			if($email3)
				$arrmail[] = $email3;
			$this->load->model("core/message");
			$message['to']="admin," .implode(",",$arrmail) ;
			$message['from']='"'.$data['fullname'].'" '.$data['email'];
			$message['title'] = $media['title'];
			$message['description']="Họ tên: ".$data['fullname']."<br>";
			$message['description'].="Email: ".$data['email']."<br>";
			$message['description'].="Địa chỉ: ".$data['address']."<br>";
			$message['description'].="Điện thoại: ".$data['phone']."<br>";
			$message['description'].="Nội dung: ".$data['description']."<br>";
			$message['folder']="inbox";
			$this->model_core_message->insert($message);
			
			$mail['from'] = $data['email'];
			$mail['FromName'] = $data['fullname'];
			$mail['to'] = implode(",",$arrmail);
			$mail['name'] = "Admin";
			$mail['subject'] =  $message['title'];
			$arr = array($message['description']);
			$mail['body'] = $this->loadModule('module/contact','createEmailTemplate',$arr);
			$this->mailsmtp->sendMail($mail);
			
			$this->data['output'] = "true";
		}
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
	}
	
	private function validate($data)
	{
		$err = array();
		
		if($data['fullname'] == "")
			$err["fullname"] = $this->data['war_fullnamenotnull'];
		if($data['email'] == "")
			$err["email"] = $this->data['war_emailnotnull'];
		else
			if ($this->validation->_checkEmail($data['email']) == false )
				$err["email"] = $this->data['war_emailnotformate'];
		if($data['address'] == "")
			$err["address"] = $this->data['war_addressnotnull'];
		if($data['phone'] == "")
			$err["phone"] = $this->data['war_phonenotnull'];
		
		return $err;
	}
}
?>