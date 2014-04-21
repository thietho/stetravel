<?php
class ModelSteTour extends Model
{ 
	private $arr_col = array(
							
							'tentour',
							'loaitour',
							'thoigian',
							'giatour',
							'chuongtrinh',
							'dieukhoan',
							'thongtin',
							'banggia',
							'trangthai',
							'khuyenmai',
							'images',
							'phuongtien',
							'khoihanh'
							);
	public function getItem($id)
	{
		$query = $this->db->query("Select `ste_tour`.* 
									from `ste_tour` 
									where id ='".$id."' ");
		return $query->row;
	}
	
	
	
	public function getList($where="", $from=0, $to=0)
	{
		
		$sql = "Select `ste_tour`.* 
									from `ste_tour` 
									where 1=1 " . $where ;
		if($to > 0)
		{
			$sql .= " Limit ".$from.",".$to;
		}
		//echo $sql;
		$query = $this->db->query($sql);
		return $query->rows;
	}
	
	public function updateCol($id,$col,$val)
	{
		$id = $id;
		$col = $col;
		$val = $val;
		
		
		$field=array(
						$col
					);
		$value=array(
						$val
					);
		
		$where="id = '".$id."'";
		$this->db->updateData('ste_tour',$field,$value,$where);
	}
	
	public function save($data)
	{
		$ste_tour = $this->getItem($data['id']);
		
		$value = array();
		if(count($ste_tour))
		{
			foreach($ste_tour as $col => $val)
			{
				if(isset($data[$col]))
					$ste_tour[$col] = $data[$col];
			}
			$data = $ste_tour;
		}
		
		foreach($this->arr_col as $col)
		{
			$value[] = $this->db->escape(@$data[$col]);
		}
		

		$field=$this->arr_col;
		
		if(count($ste_tour) == 0)
		{
			$data['id'] = $this->db->insertData("ste_tour",$field,$value);
		}
		else
		{
			$where="id = '".$data['id']."'";
			$this->db->updateData("ste_tour",$field,$value,$where);
		}
		return $data['id'];
	}
	
	public function delete($id)
	{
		$where="id = '".$id."'";
		$this->db->deleteData("ste_tour",$where);
		
	}
	
}
?>