<h3><?php echo $heading_title; ?></h3>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout product-grid col-xs-6 col-sm-3">
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
