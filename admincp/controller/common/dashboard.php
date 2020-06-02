<?php
class ControllerCommonDashboard extends Controller
{
	function __construct() 
	{
		
		$this->load->helper('image');
	}
	function index()
	{	
		$this->getForm();
		$this->id='content';
		$this->template='common/dashboard.tpl';
		$this->layout="layout/center";
		$this->render();
	}
	
	private function getForm()
	{
		
		$this->load->model("core/media");
		$this->load->model("core/category");
		$this->load->model("ste/tour");
		
		$this->data['item']['mediaid'] = "setting";
		$this->data['item']['Title'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Title');
		$this->data['item']['Slogan'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Slogan');
		$this->data['item']['Currency'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Currency');
		$this->data['item']['EmailContact'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'EmailContact');
		$this->data['item']['Keyword'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Keyword');
		$this->data['item']['Description'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'Description');
		
		
		$this->data['item']['brochure'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'brochure');
		$this->data['item']['background'] = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'background');
		
		$listtournoibat = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'listtournoibat');
		if($listtournoibat)
		{
			
			$arr_tourid = split(',',$listtournoibat);
			$this->data['listtournoibat'] = array();
			foreach($arr_tourid as $tourid)
			{
				$tour = $this->model_ste_tour->getItem($tourid);
				$arr = $this->string->referSiteMapToArray($tour['images']);
				$file = $this->model_core_file->getFile($arr[0]);
				$tour['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
				$this->data['listtournoibat'][] = $tour;
			}
		}
		//listtourhangngay
		$listtourhangngay = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'listtourhangngay');
		if($listtourhangngay)
		{
			$arr_tourid = split(',',$listtourhangngay);
			$this->data['listtourhangngay'] = array();
			foreach($arr_tourid as $tourid)
			{
				$tour = $this->model_ste_tour->getItem($tourid);
				$arr = $this->string->referSiteMapToArray($tour['images']);
				$file = $this->model_core_file->getFile($arr[0]);
				$tour['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 100, 0);
				$this->data['listtourhangngay'][] = $tour;
			}
		}
		
		
		/*for($i=1;$i<=4;$i++)
		{	
			$fileid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'qc'.$i);	
			$this->data['qc'][$i] = $this->model_core_file->getFile($fileid);
			$this->data['qc'][$i]['imagethumbnail'] = HelperImage::resizePNG($this->data['qc'][$i]['filepath'], 100, 0);
			$fileid = $this->model_core_media->getInformation($this->data['item']['mediaid'], 'qcbanner'.$i);	
			$this->data['qcbanner'][$i] = $this->model_core_file->getFile($fileid);
			$this->data['qcbanner'][$i]['imagethumbnail'] = HelperImage::resizePNG($this->data['qcbanner'][$i]['filepath'], 100, 0);
			
		}*/
	}
	
	public function save()
	{
		$data = $this->request->post;
		
		$this->load->model("core/media");
		//Save setting
		$this->model_core_media->saveInformation($data['mediaid'],"Title",$data['Title']);
		$this->model_core_media->saveInformation($data['mediaid'],"Slogan",$data['Slogan']);
		$this->model_core_media->saveInformation($data['mediaid'],"Currency",$data['Currency']);
		$this->model_core_media->saveInformation($data['mediaid'],"EmailContact",$data['EmailContact']);
		$this->model_core_media->saveInformation($data['mediaid'],"Keyword",$data['Keyword']);
		$this->model_core_media->saveInformation($data['mediaid'],"Description",$data['Description']);
		
		$this->model_core_media->saveInformation($data['mediaid'],"brochure",$data['brochure']);
		$this->model_core_media->saveInformation($data['mediaid'],"background",$data['background']);
		
		/*for($i=1;$i<=4;$i++)
		{
			$this->model_core_media->saveInformation($data['mediaid'],"qc".$i,$data['qc'.$i.'_fileid']);
			$this->model_core_media->saveInformation($data['mediaid'],"qcbanner".$i,$data['qcbanner'.$i.'_fileid']);
		}*/
		if(count($data['listtournoibat']))
		{
			$listtour = implode(',',$data['listtournoibat']);
			$this->model_core_media->saveInformation($data['mediaid'],"listtournoibat",$listtour);
		}
		else
			$this->model_core_media->saveInformation($data['mediaid'],"listtournoibat","");
		
		if(count($data['listtourhangngay']))
		{
			$listtour = implode(',',$data['listtourhangngay']);
			$this->model_core_media->saveInformation($data['mediaid'],"listtourhangngay",$listtour);
		}
		else
			$this->model_core_media->saveInformation($data['mediaid'],"listtourhangngay","");
		$this->data['output'] = "true";
		
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
}
?>