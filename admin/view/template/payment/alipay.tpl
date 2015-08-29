<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form_alipay" data-toggle="tooltip" title="保存" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="取消" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if (isset($error['error_warning'])) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> 编辑支付宝信息</h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form_alipay" class="form-horizontal" role="form">
          <div class="form-group required">
		    <label for="radio_inline" class="col-sm-2 control-label"><?php echo $entry_trade_type; ?><br>(请根据对应的接口填入正确的参数)</label>
		    <div class="col-sm-10">
		    	<?php if ($alipay_trade_type=='trade_create_by_buyer') { ?>
					<label class="radio-inline">
						<input type="radio" name="alipay_trade_type" value="trade_create_by_buyer" checked="true"> 双接口
					</label>
					<label class="radio-inline">
						<input type="radio" name="alipay_trade_type" value="create_direct_pay_by_user"> 直接到帐
					</label>
					<label class="radio-inline">
						<input type="radio" name="alipay_trade_type" value="create_partner_trade_by_buyer"> 担保接口
					</label>
				<?php } else if($alipay_trade_type=='create_direct_pay_by_user') {  ?>
					<label class="radio-inline">
						<input type="radio" name="alipay_trade_type" value="trade_create_by_buyer"> 双接口
					</label>
					<label class="radio-inline">
						<input type="radio" name="alipay_trade_type" value="create_direct_pay_by_user" checked="true"> 直接到帐
					</label>
					<label class="radio-inline">
						<input type="radio" name="alipay_trade_type" value="create_partner_trade_by_buyer"> 担保接口
					</label>
				<?php } else {  ?>
					<label class="radio-inline">
						<input type="radio" name="alipay_trade_type" value="trade_create_by_buyer"> 双接口
					</label>
					<label class="radio-inline">
						<input type="radio" name="alipay_trade_type" value="create_direct_pay_by_user"> 直接到帐
					</label>
					<label class="radio-inline">
						<input type="radio" name="alipay_trade_type" value="create_partner_trade_by_buyer" checked="true"> 担保接口
					</label>
				<?php } ?>
		    </div>
		  </div>
		  <div class="form-group required">
		    <label for="alipay_partner" class="col-sm-2 control-label"><?php echo $entry_partner; ?></label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="alipay_partner" value="<?php echo $alipay_partner; ?>" placeholder="Alipay Partner ID" id="alipay_partner">
              <?php if ($error_partner) { ?>
            	<div class="text-danger"><?php echo $error_partner; ?></div>
              <?php } ?>
		    </div>
		  </div>
		  <div class="form-group required">
		    <label for="alipay_security_code" class="col-sm-2 control-label"><?php echo $entry_security_code; ?></label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="alipay_security_code" value="<?php echo $alipay_security_code; ?>" placeholder="Alipay Security Code" id="alipay_security_code">
              <?php if ($error_secrity_code) { ?>
            	<div class="text-danger"><?php echo $error_secrity_code; ?></div>
              <?php } ?>
		    </div>
		  </div>
		  <div class="form-group required">
		    <label for="alipay_seller_email" class="col-sm-2 control-label"><?php echo $entry_seller_email; ?></label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="alipay_seller_email" value="<?php echo $alipay_seller_email; ?>" placeholder="Alipay Seller Email" id="alipay_seller_email">
              <?php if ($error_email) { ?>
            	<div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="alipay_order_status_id" class="col-sm-2 control-label"><?php echo $entry_order_status; ?></label>
		    <div class="col-sm-10">
		      <select name="alipay_order_status_id" class="form-control" id="alipay_order_status_id">
	              <?php foreach ($order_statuses as $order_status) { ?>
	              <?php if ($order_status['order_status_id'] == $alipay_order_status_id) { ?>
	              <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
	              <?php } else { ?>
	              <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
	              <?php } ?>
	              <?php } ?>
	          </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="alipay_status" class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
		    <div class="col-sm-10">
		      <select name="alipay_status" class="form-control" id="alipay_status">
	              <?php if ($alipay_status) { ?>
	              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	              <option value="0"><?php echo $text_disabled; ?></option>
	              <?php } else { ?>
	              <option value="1"><?php echo $text_enabled; ?></option>
	              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	              <?php } ?>
	          </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="alipay_sort_order" class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="alipay_sort_order" value="<?php echo $alipay_sort_order; ?>" placeholder="1" id="alipay_sort_order">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="alipay_notice" class="col-sm-2 control-label"></label>
		    <div class="col-sm-10">
		    	<div id="alipay_notice">注意：使用已经存在CNY的人民币汇率设置，Code为CNY</div>
		    </div>
		  </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 