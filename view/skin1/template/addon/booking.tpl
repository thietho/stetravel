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
                	<td>Tên tour</td>
                    <td><?php echo $tour['tentour']?></td>
                </tr>
                <tr>
                	<td>Số khách</td>
                    <td><input type="text" id="numcostomer" name="numcostomer" class="ben-textbox" size="40"></td>
                </tr>
                <tr>
                	<td colspan="2">
                        Yêu cầu riêng<br>
                        <textarea></textarea>
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
				$('#error').html("Bạn đã đăng ký thành công!").show('slow');
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
</script>