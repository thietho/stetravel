<?php
class ControllerSitebarFacebook extends Controller
{
	public function index()
	{
		$this->load->model("core/media");
		$this->load->model("core/sitemap");
		$sitemapid = "facebook";
		$siteid = $this->member->getSiteId();
		$this->data['sitemap'] = $this->model_core_sitemap->getItem($sitemapid, $siteid);
		$this->data['media'] = $this->model_core_media->getItem($siteid.$sitemapid);
		
		$this->data['media']['description'] = html_entity_decode($this->data['media']['description']);
		
		$this->id="content";
		$this->template="sitebar/facebook.tpl";
		$this->render();
	}
}
?>