<div class="ben-section-title">
	<div class="title">Đặt tour</div>
</div>
<div class="ben-section-content">
	
    <div id="error" class="ben-error" style="display:none"></div>
	<form id="frmbooking" method="post">
    	<div class="ben-left">
        	<h3>Thông tin liên hệ</h3>
       		<table class="ben-form">
            	
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
        <div class="ben-right">
        	<table class="ben-form">
            	<tr>
                	<td>Tên tour</td>
                    <td></td>
                </tr>
                <tr>
                	<td>Tên tour</td>
                    <td></td>
                </tr>
                <tr>
                	<td>Tên tour</td>
                    <td></td>
                </tr>
            </table>
        </div>
        <div class="clearer"></div>
    </form>
</div>
<div class="clearer">&nbsp;</div>
<script language="javascript">
$("#btnRegister").click(function(){
	$.blockUI({ message: "<h1>Please wait...</h1>" }); 
	
	$.post("<?php echo HTTP_SERVER?>?route=addon/register/save", $("#frmRegister").serialize(),
		function(data){
			if(data == "true")
			{
				$('#error').html("Bạn đã đăng ký thành công! Mã kích hoạt tài khoản đã đươc gửi tới email của bạn! <a href='<?php echo $this->document->createLink('active')?>'>Kích hoạt tài khoản click vào đây</a>").show('slow');
				$("#frmRegister").hide();
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