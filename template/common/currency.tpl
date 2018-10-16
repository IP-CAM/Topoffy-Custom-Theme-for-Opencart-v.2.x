<?php if (count($currencies) > 1) { ?>
<h3><?php echo $text_currency; ?></h3>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
  <ul class="list-unstyled">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['symbol_left']) { ?>
    <li><a href="<?php echo $currency['code']; ?>" class="currency-select"><?php echo $currency['code']; ?></a></li>
    <?php } else { ?>
    <li><a href="<?php echo $currency['code']; ?>" class="currency-select"><?php echo $currency['code']; ?></a></li>
    <?php } ?>
    <?php } ?>
  </ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
