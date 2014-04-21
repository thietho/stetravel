<?php
class ControllerModuleTour extends Controller
{
	public function listTour($title,$data_tour,$template)
	{
		$this->load->model("core/file");
		$this->load->helper('image');
		foreach($data_tour as $key => $tour)
		{
			$arr_fileid = $this->string->referSiteMapToArray($data_tour[$key]['images']);
			$arr_imagethumbnail =array();
			foreach($arr_fileid as $fileid)
			{
				$file = $this->model_core_file->getFile($fileid);
				$arr_imagethumbnail[] = HelperImage::resizePNG($file['filepath'], $template['width'], $template['height']);
			}
			$data_tour[$key]['arrthumbnail'] = $arr_imagethumbnail;
		}
		$this->data['title'] = $title;
		$this->data['data_tour'] = $data_tour;
		
		$this->id="content";
		$this->template = $template['template'];
		$this->render();
	}
	
}
?>