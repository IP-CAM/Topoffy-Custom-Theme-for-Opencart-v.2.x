
<?php if ($products) { ?>

<h2><?php echo $text_cart_caption; ?></h2>

<form method="post" enctype="multipart/form-data" onsubmit="return false;">
  <div class="table-responsive">
    <ul class="sidebar_cart">
      <?php foreach ($products as $product) { ?>
      <li id="cart-p<?php echo $product['cart_id']; ?>" class="cart_line">
        <div class="cart_image">
          <?php if ($product['thumb']) { ?>
          <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
          <?php } ?>
        </div>
        <div class="cart_desc">
            <div class="name"><?php echo $product['name']; ?></div>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>

            <div class="price-change">
                <div class="price"><?php echo $product['price']; ?></div>
                <div class="mid">*</div>
                <input
                        type="text"
                        name="quantity[<?php echo $product['cart_id']; ?>]"
                        value="<?php echo $product['quantity']; ?>"
                        size="1"
                        class="form-control cart-product-quantity"
                        onchange="cart.update('<?php echo $product['cart_id']; ?>', this.value);"
                />
                <div>шт.</div>
            </div>
        </div>
        <div class="cart_delete" onclick="cart.remove('<?php echo $product['cart_id']; ?>');">
          <i class="material-icons">close</i>
        </div>
      </li>
      <?php } ?>
    </ul>
  </div>
</form>

<?php } else { ?>

<div class="empty_cart">
  <span><?php echo $text_empty; ?></span><br/>
  <span><?php echo $text_empty_add; ?></span>
</div>

<?php }; ?>