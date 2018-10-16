<footer>
  <div class="<?php echo $container ?: 'container-fluid space-30'; ?>">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-2">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-2">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
      <?php if ($contact_info) { ?>
      <div class="col-sm-2">
        <h5><?php echo $text_contact_info; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($contact_info as $contact) { ?>
          <li><?php echo $contact; ?></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <?php if ($social) { ?>
      <div class="col-sm-2">
        <h5><?php echo $text_social; ?></h5>
        <ul class="list-inline">
          <?php foreach ($social as $key => $value) { ?>
          <?php if (!empty($value)) { ?>
          <li><a href="<?php echo $value; ?>"><i class="fa fa-<?php echo $key; ?>" aria-hidden="true"></i></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
    </div>
    <div class="row">
      <div class="col-sm-12">
        <div class="powered text-right">
          <p>Дизайн сайта <a href="http://themefiber.com/">themefiber</a></p>
        </div>
      </div>
    </div>
  </div>
</footer>
<?php if ($backtop) { ?>
<div class="back-top"><i class="material-icons">arrow_upward</i></div>
<?php } ?>
<script src="catalog/view/theme/sela/javascript/smoothscroll.js"></script>
<script src="catalog/view/theme/sela/javascript/modernizr.custom.js"></script>
<script src="catalog/view/theme/sela/javascript/classie.js"></script>
<script src="catalog/view/theme/sela/javascript/notifications.js"></script>
</body></html>
