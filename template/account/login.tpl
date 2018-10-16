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
    <div id="content" class="<?php echo $class; ?> bg-filled space-30"><?php echo $content_top; ?>
      <?php if ($success) { ?>
      <script>notify("<?php echo $success; ?>");</script>
      <?php } ?>
      <?php if ($error_warning) { ?>
      <script>notify("<?php echo $error_warning; ?>");</script>
      <?php } ?>
      <div class="row">
        <div class="col-sm-6 col-sm-offset-3 login">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#login" data-toggle="tab"><?php echo $text_returning_customer; ?></a></li>
            <li><a href="#register" data-toggle="tab"><?php echo $text_new_customer; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="login">
              <p class="text-center"><strong><?php echo $text_i_am_returning_customer; ?></strong></p>
              <br />
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <br />
                <div class="form-group">
                  <!-- <label class="control&#45;label" for="input&#45;email"><?php echo $entry_email; ?></label> -->
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control input-lg" />
                </div>
                <br />
                <div class="form-group">
                  <!-- <label class="control&#45;label" for="input&#45;password"><?php echo $entry_password; ?></label> -->
                  <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control input-lg" />
                </div>
                <br />
                <br />
                <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary btn-block" />
                <br />
                <p class="text-center">
                <a href="<?php echo $forgotten; ?>" class="forgotten"><?php echo $text_forgotten; ?></a>
                </p>
                <?php if ($redirect) { ?>
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                <?php } ?>
              </form>
            </div>
            <div class="tab-pane" id="register">
              <p class="text-center"><strong><?php echo $text_register; ?></strong></p>
              <br />
              <p><?php echo $text_register_account; ?></p>
              <br />
              <br />
              <a href="<?php echo $register; ?>" class="btn btn-primary btn-block"><?php echo $button_continue; ?></a>
            </div>
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
