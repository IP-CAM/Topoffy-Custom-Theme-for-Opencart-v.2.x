<?php if (strpos($name, 'slide') === 0) { ?>
<!-- If this module in slider! -->
<div class="hidden-xs col-sm-4 <?php echo $name; ?>">
    <div class="slider-html-thumb">
<?php } ?>
        <?php if($heading_title) { ?>
        <h2><?php echo $heading_title; ?></h2>
        <?php } ?>
        <?php echo $html; ?>

<?php if (strpos($name, 'slide') === 0) { ?>
    </div>
</div>
<?php } ?>