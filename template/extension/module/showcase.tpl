<div id="showcase<?php echo $module; ?>">
  <?php if ($heading_title) { ?>
  <h2><?php echo $heading_title; ?></h2>
  <?php } ?>
  <div class="row">
    <?php foreach ($banners as $banner) { ?>
    <div class="col-sm-4 showcase-block">
      <div class="showcase-animation"></div>
      <?php if ($banner['link']) { ?>
      <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
      <?php } else { ?>
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
      <?php } ?>
    </div>
    <?php } ?>
  </div>
</div>
