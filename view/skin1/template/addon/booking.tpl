<div class="ben-section-title">
	<div class="title"><?php echo $this->document->breadcrumb?></div>
</div>
<div class="ben-section-content">
	
    <div id="error" class="ben-error" style="display:none"></div>
	<form id="frmbooking" method="post">
    	<div class="ben-left" style="width:50%">
        	<h3>Thông tin liên hệ</h3>
       		<table class="ben-form" style="width:100%">
            	
                <tr>
                    <td><label>Họ và tên</label></td>
                    <td><input type="text" id="fullname" name="fullname" class="ben-textbox" size="40"></td>
                </tr>
                <tr>
                    <td><label>Email</label></td>
                    <td><input type="text" id="email" name="email" class="ben-textbox" size="40"></td>
                </tr>
                <tr>
                    <td><label>Địa chỉ</label></td>
                    <td><input type="text" id="address" name="address" class="ben-textbox" size="40"></td>
                </tr>
                <tr>
                    <td><label>Điện thoại</label></td>
                    <td><input type="text" id="phone" name="phone" class="ben-textbox" size="40"></td>
                </tr>
            </table>

        </div>
        <div class="ben-right" style="width:50%">
        	<h3>Thông tin tour</h3>
        	<table class="ben-form" style="width:100%">
            	<tr>
                	<td>
                    	Tên tour: <?php echo $tour['tentour']?>
                        <input type="hidden" name="tentour" value="<?php echo $tour['tentour']?>"/>
                    </td>
                   
                </tr>
                <tr>
                	<td>Tổng số khách: <span id="numcostomerview"></span> <input type="hidden" id="numcostomer" name="numcostomer" class="ben-textbox" size="40"></td>
                    <td></td>
                </tr>
                <tr>
                	<td>
                    	Người lớn(Từ 12 tuổi trở lên): <input type="text" id="nguoilon" name="nguoilon" class="ben-textbox number sokhach" size="3"><br />
                        Trẻ em (Từ 2 tuổi đến dưới 12 tuổi): <input type="text" id="treem" name="treem" class="ben-textbox number sokhach" size="3"><br />
                        Trẻ nhỏ(Dưới 2 tuổi): <input type="text" id="trenho" name="trenho" class="ben-textbox number sokhach" size="3">
                    </td>
                </tr>
                <tr>
                	<td>
                        Yêu cầu riêng<br>
                        <textarea id="requirements" name="requirements"></textarea>
                    </td>
                    
                </tr>
            </table>
        </div>
        <div class="clearer"></div>
        <center>
        	<input type="button" id="btnBooking" class="ben-button" value="Đặt tour">
        </center>
    </form>
</div>
<div class="clearer">&nbsp;</div>
<script language="javascript">
$("#btnBooking").click(function(){
	$.blockUI({ message: "<h1>Please wait...</h1>" }); 
	
	$.post("<?php echo HTTP_SERVER?>?route=addon/booking/order", $("#frmbooking").serialize(),
		function(data){
			if(data == "true")
			{
				$('#error').html("Bạn đã đặt tour thành công!").show('slow');
				$("#frmbooking").hide();
			}
			else
			{
				
				$('#error').html(data).show('slow');
				
				
			}
			$.unblockUI();
		}
	);					   
});
$('.sokhach').keyup(function(e) {
	var total = 0;
    $('.sokhach').each(function(index, element) {
        total += Number(stringtoNumber(this.value));
    });
	$('#numcostomerview').html(numberView(total));
	$('#numcostomer').val(numberView(total));
});
</script>