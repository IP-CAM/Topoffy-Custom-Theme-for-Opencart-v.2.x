<?php if (count($languages) > 1) { ?>
<h3><?php echo $text_language; ?></h3>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
  <ul class="list-unstyled">
    <?php foreach ($languages as $language) { ?>
    <li><a href="<?php echo $language['code']; ?>" class="language-select"><?php echo $language['name']; ?></a></li>
    <?php } ?>
  </ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
