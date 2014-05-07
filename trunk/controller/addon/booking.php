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
			
			
			$email = $this->document->setup['EmailContact'];
			$this->load->model("core/message");
			$message['to']="admin" ;
			$message['from']='"'.$data['fullname'].'" '.$data['email'];
			$message['title'] = "Thông tin đặt tour";
			$message['description']="Họ tên: ".$data['fullname']."<br>";
			$message['description'].="Email: ".$data['email']."<br>";
			$message['description'].="Địa chỉ: ".$data['address']."<br>";
			$message['description'].="Điện thoại: ".$data['phone']."<br>";
			$message['description'].="Tên tour: ".$data['tentour']."<br>";
			$message['description'].="Tổng số khách: ".$data['numcostomer']."<br>";
			$message['description'].="Người lớn: ".$data['nguoilon']."<br>";
			$message['description'].="Trẻ em: ".$data['treem']."<br>";
			$message['description'].="Trẻ nhỏ: ".$data['trenho']."<br>";
			$message['description'].="Yêu cầu riêng: ".$data['requirements']."<br>";
			$message['folder']="inbox";
			$this->model_core_message->insert($message);
			//Gui mail den quan tri
			$mail['from'] = $data['email'];
			$mail['FromName'] = $data['fullname'];
			$mail['to'] = $email;
			$mail['name'] = "Admin";
			$mail['subject'] =  $message['title'];
			$arr = array($message['description']);
			$mail['body'] = $this->loadModule('module/contact','createEmailTemplate',$arr);
			$this->mailsmtp->sendMail($mail);
			//Gui mail den khach hang
			$mail['from'] = $data['email'];
			$mail['FromName'] = $this->document->setup['Title'];
			$mail['to'] = $data['email'];
			$mail['name'] = $data['customername'];
			$mail['subject'] =  $message['title'];
			$arr = array($message['description']);
			$mail['body'] = "<p>".$this->document->setup['Title']." đã nhận được đơn hàng của bạn. Chúng tôi sẻ liên hệ với bạn trong vòng 24h</p>"; 
			$mail['body'] .= $this->loadModule('module/contact','createEmailTemplate',$arr);
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
		if($data['numcostomer'] == "")
			$err["numcostomer"] = "Bạn chưa nhập số khách";
		
		return $err;
	}
}
?>