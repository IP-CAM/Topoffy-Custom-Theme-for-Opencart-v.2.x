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
    <div id="content" class="<?php echo $class; ?> space-30">
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
      <?php echo $content_top; ?>
      <?php if ($thumb || $description) { ?>
      <div class="row" style="display: none;">
        <?php if ($thumb) { ?>
        <div class="col-sm-12"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-responsive" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="col-sm-12 text-center"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      <?php } ?>
      <br />
      <?php if ($categories) { ?>
      <div class="row">
        <?php foreach ($categories as $category) { ?>
        <div class="col-xs-6 col-sm-4 col-md-2 refine-search">
          <?php if ($category['thumb']) { ?>
          <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" class="img-responsive" width="100%" height="100%" /></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><img src="catalog/view/theme/sela/image/no-image.png" alt="<?php echo $category['name']; ?>" class="img-responsive" width="100%" height="100%" /></a>
          <?php } ?>
          <a href="<?php echo $category['href']; ?>" class="refine-search-link"><?php echo $category['name']; ?></a>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <br />
      <?php if ($products) { ?>
      <div class="row product-filter">
        <div class="col-xs-2 hidden-xs">
          <div class="btn-group">
            <button type="button" id="list-view" class="btn btn-empty" data-toggle="tooltip" data-placement="top" title="<?php echo $button_list; ?>"><i class="material-icons">view_stream</i></button>
            <button type="button" id="grid-view" class="btn btn-empty" data-toggle="tooltip" data-placement="top" title="<?php echo $button_grid; ?>"><i class="material-icons">view_module</i></button>
          </div>
        </div>
        <div class="col-xs-3 col-sm-3 text-left">
          <a href="<?php echo $compare; ?>" title="<?php echo $text_compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
        </div>
        <div class="col-xs-5 col-sm-4 text-right">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="col-xs-4 col-sm-3 text-right">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-sm-12" id="product-<?php echo $product['product_id']; ?>">
          <div class="product-thumb">
            <div class="image">
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
              <div class="btn-group animated fadeInUp">
                <button type="button" class="btn btn-empty" data-toggle="tooltip" data-placement="top" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="material-icons">favorite_border</i></button>
                <button type="button" class="btn btn-empty" data-toggle="tooltip" data-placement="top" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="material-icons">shopping_cart</i></button>
                <button type="button" class="btn btn-empty" data-toggle="tooltip" data-placement="top" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="material-icons">compare_arrows</i></button>
              </div>
            </div>
            <div class="caption">
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <div class="name">
                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              </div>
              <?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <span class="price-regular"><?php echo $product['price']; ?></span>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
              </div>
              <?php } ?>
              <div class="description">
                <p><?php echo $product['description']; ?></p>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right results"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script>
// fixed header

// remove this code to header, so it sticky for all pages
//$(window).scroll(function () {
//  if ($(this).scrollTop() > 60) {
//    $('header').addClass("sticky");
//  } else {
//    $('header').removeClass("sticky");
//  }
//});

// scrolreveal
window.sr = ScrollReveal();

var mobileConfig = {delay: 500, opacity: 0.5, duration: 200};
var desktopConfig = {delay: 0};

if (sr.tools.isMobile()) {
  sr.reveal('.product-thumb', mobileConfig);
} else {
  sr.reveal('.product-thumb', desktopConfig);
}

setTimeout(function() {
  window.scrollTo(0, 1);
}, 200);
</script>
<?php echo $footer; ?>
