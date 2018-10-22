<div id="cart">
  <a href="<?php echo $cart; ?>" class="cart-icon">
    <i class="material-icons">shopping_cart</i>
  </a>
</div>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <div class="table-responsive">
    <table class="table">
      <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="text-left"><?php if ($product['thumb']) { ?>
          <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
          <?php } ?></td>
        <td class="text-left">
          <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        </td>
        <td class="text-right"><?php echo $product['price']; ?></td>
      </tr>
      <?php } ?>
      </tbody>
    </table>
  </div>
</form>
