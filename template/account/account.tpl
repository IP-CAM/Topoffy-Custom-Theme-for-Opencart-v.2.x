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
      <ul class="breadcrumb">
        <?php $i = 1; foreach ($breadcrumbs as $breadcrumb) { ?>
          <?php if ($i == count($breadcrumbs)) { ?>
          <li><?php echo $breadcrumb['text']; ?></li>
          <?php } else { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        <?php $i++; } ?>
      </ul>
      <?php if ($success) { ?>
      <script>notify("<?php echo $success; ?>");</script>
      <?php } ?>
      <div class="row">
        <div class="col-sm-4">
          <h3><?php echo $text_my_account; ?></h3>
          <ul class="list-group">
            <li class="list-group-item"><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
            <li class="list-group-item"><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
            <li class="list-group-item"><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
            <li class="list-group-item"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          </ul>
        </div>
        <?php if ($credit_cards) { ?>
        <div class="col-sm-4">
          <h3><?php echo $text_credit_card; ?></h3>
          <ul class="list-group">
            <?php foreach ($credit_cards as $credit_card) { ?>
            <li class="list-group-item"><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
        <div class="col-sm-4">
          <h3><?php echo $text_my_orders; ?></h3>
          <ul class="list-group">
            <li class="list-group-item"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li class="list-group-item"><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <?php if ($reward) { ?>
            <li class="list-group-item"><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
            <?php } ?>
            <li class="list-group-item"><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
            <li class="list-group-item"><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li class="list-group-item"><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
          </ul>
        </div>
        <div class="col-sm-4">
          <h3><?php echo $text_my_newsletter; ?></h3>
          <ul class="list-group">
            <li class="list-group-item"><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
          </ul>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 
