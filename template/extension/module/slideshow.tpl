<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
    <?php foreach ($banners as $key => $banner) { ?>
    <div class="item slide c<?php echo ($key + 1) ?>">
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>"
                                                      alt="<?php echo $banner['title']; ?>" class="img-responsive"/></a>
        <?php } else { ?>
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive"/>
        <?php } ?>

        <?php echo $slidethumb; ?>

    </div>
    <?php } ?>

</div>

<script type="text/javascript"><!--
    $('#slideshow<?php echo $module; ?>').owlCarousel({
        items: 6,
        autoPlay: 6000,
        singleItem: true,
        navigation: true,
        navigationText: ['<i class="material-icons">chevron_left</i>', '<i class="material-icons">chevron_right</i>'],
        pagination: false
    });
    --></script>
