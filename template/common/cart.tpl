<div id="cart" style="display: none;">
  <a href="<?php echo $cart; ?>" class="cart-icon">
    <i class="material-icons">shopping_cart</i>
  </a>
</div>

<?php if ($products) { ?>

<form action="" method="post" enctype="multipart/form-data">
  <div class="table-responsive">
    <ul class="sidebar_cart">
      <?php foreach ($products as $product) { ?>
      <li class="cart_line">
        <div class="cart_image">
          <?php if ($product['thumb']) { ?>
          <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
          <?php } ?>
        </div>
        <div class="cart_desc">
          <div class="name"><?php echo $product['name']; ?></div>
          <div class="price"><?php echo $product['price']; ?></div>
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
  <span>Ваша корзина пуста.</span><br/>
  <span>Добавляйте товар с помощью кнопки "купить"</span>
</div>

<?php }; ?>