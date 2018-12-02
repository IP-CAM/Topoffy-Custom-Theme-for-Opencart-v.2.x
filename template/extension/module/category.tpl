<div class="list-group category">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item active ripplelink"><?php echo $category['name']; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item sub-list-group-item active ripplelink"><?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item sub-list-group-item ripplelink"><?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item ripplelink"><?php echo $category['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>
<script>
$(document).ready(function() {
  $('.category a').each(function() {
    var qty = $(this).text().match(/\(([^)]+)\)/);
    var name = $(this).text().replace(/\(\d+\)/g, "");

    if (qty) {
        if (qty[1] === "0") {
            qty[1] = "";
        }
    } else {
        qty = ["", ""];
    }

    badge = name + '<span class="badge">' + qty[1] + '</span>';
    $(this).html(badge);
  });
});
</script>
