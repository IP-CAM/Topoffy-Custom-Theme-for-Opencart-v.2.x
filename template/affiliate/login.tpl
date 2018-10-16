<?php echo $header; ?>
<div class="<?php echo $container ?: 'container-fluid space-30'; ?>">
  <?php if ($success) { ?>
  <script>notify("<?php echo $success; ?>");</script>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <script>notify("<?php echo $error_warning; ?>");</script>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <ul class="breadcrumb">
        <?php $i = 1; foreach ($breadcrumbs as $breadcrumb) { ?>
          <?php if ($i == count($breadcrumbs)) { ?>
          <li><?php echo $breadcrumb['text']; ?></li>
          <?php } else { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        <?php $i++; } ?>
      </ul>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_description; ?>
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
            <h2><?php echo $text_new_affiliate; ?></h2>
            <p><?php echo $text_register_account; ?></p>
            <a class="btn btn-primary" href="<?php echo $register; ?>"><?php echo $button_continue; ?></a></div>
        </div>
        <div class="col-sm-6">
          <div class="well">
            <h2><?php echo $text_returning_affiliate; ?></h2>
            <p><strong><?php echo $text_i_am_returning_affiliate; ?></strong></p>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a> </div>
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
