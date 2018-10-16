<?php echo $header; ?>
<div class="<?php echo $container ?: 'container-fluid'; ?>">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> space-30 bg-filled"><?php echo $content_top; ?>
      <?php if ($error_warning) { ?>
      <script>notify("<?php echo $error_warning; ?>");</script>
      <?php } ?>
      <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
          <h1 class="text-center"><?php echo $heading_title; ?></h1>
          <p class="text-center"><?php echo $text_email; ?></p>
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <legend><?php echo $text_your_email; ?></legend>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                </div>
              </div>
            </fieldset>
            <div class="buttons clearfix">
              <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
              <div class="pull-right">
                <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
              </div>
            </div>
          </form>
        </div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>
