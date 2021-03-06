<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right">
        <button type="submit" form="form-weight" class="btn btn-primary "><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger "><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a></div>
      <h1 class="panel-title"><i class="fa fa-edit"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-weight" class="form-horizontal">
        <div class="row">
          <div class="col-xs-2">
            <ul class="nav nav-pills nav-stacked">
              <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <li><a href="#tab-geo-zone<?php echo $geo_zone['geo_zone_id']; ?>" data-toggle="tab"><?php echo $geo_zone['name']; ?></a></li>
              <?php } ?>
            </ul>
          </div>
          <div class="col-xs-10">
            <div class="tab-content">
              <div class="tab-pane active" id="tab-general">
                <div class="form-group">
                  <label class="col-xs-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
                  <div class="col-xs-10">
                    <select name="weight_tax_class_id" id="input-tax-class" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($tax_classes as $tax_class) { ?>
                      <?php if ($tax_class['tax_class_id'] == $weight_tax_class_id) { ?>
                      <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                  <div class="col-xs-10">
                <div class="btn-group" data-toggle="buttons">
  			<label class="btn btn-primary<?php if ($weight_status == 1) { ?> active<?php } ?>">
    				<i class="fa fa-check"></i> <input type="radio" name="weight_status" id="input-status" <?php if ($weight_status == 1) { ?>checked<?php } ?>> <?php echo $text_enabled; ?>
  			</label>
  			<label class="btn btn-primary<?php if ($weight_status == 0) { ?> active<?php } ?>">
    				<i class="fa fa-times"></i> <input type="radio" name="weight_status" id="input-status" <?php if ($weight_status == 0) { ?>checked<?php } ?>> <?php echo $text_disabled; ?>
  			</label>
		</div>

                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                  <div class="col-xs-10">
                    <input type="text" name="weight_sort_order" value="<?php echo $weight_sort_order; ?>" id="input-sort-order" class="form-control" />
                  </div>
                </div>
              </div>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <div class="tab-pane" id="tab-geo-zone<?php echo $geo_zone['geo_zone_id']; ?>">
                <div class="form-group">
                  <label class="col-xs-2 control-label" for="input-rate<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $entry_rate; ?></label>
                  <div class="col-xs-10">
                    <textarea name="weight_<?php echo $geo_zone['geo_zone_id']; ?>_rate" rows="5" id="input-rate<?php echo $geo_zone['geo_zone_id']; ?>" class="form-control"><?php echo ${'weight_' . $geo_zone['geo_zone_id'] . '_rate'}; ?></textarea>
		 </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-2 control-label" for="input-status<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $entry_status; ?></label>
                  <div class="col-xs-10">
                <div class="btn-group" data-toggle="buttons">
  			<label class="btn btn-primary<?php if (${'weight_' . $geo_zone['geo_zone_id'] . '_status'} == 1) { ?> active<?php } ?>">
    				<i class="fa fa-check"></i> <input type="radio" name="weight_<?php echo $geo_zone['geo_zone_id']; ?>_status" id="input-status" <?php if (${'weight_' . $geo_zone['geo_zone_id'] . '_status'} == 1) { ?>checked<?php } ?>> <?php echo $text_enabled; ?>
  			</label>
  			<label class="btn btn-primary<?php if (${'weight_' . $geo_zone['geo_zone_id'] . '_status'} == 0) { ?> active<?php } ?>">
    				<i class="fa fa-times"></i> <input type="radio" name="weight_<?php echo $geo_zone['geo_zone_id']; ?>_status" id="input-status" <?php if (${'weight_' . $geo_zone['geo_zone_id'] . '_status'} == 0) { ?>checked<?php } ?>> <?php echo $text_disabled; ?>
  			</label>
		</div>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 