<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
    <?php foreach ($banners as $banner) { ?>
    <div class="item slide">
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>"
                                                      alt="<?php echo $banner['title']; ?>" class="img-responsive"/></a>
        <?php } else { ?>
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive"/>
        <?php } ?>
        <div class="slider-html-thumb-cont">
            <div class="container">
                <div class="row slider-html-thumb-row">
                    <div class="col-sm-4">
                        <div class="slider-html-thumb">

                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="slider-html-thumb">

                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="slider-html-thumb">

                        </div>
                    </div>
                </div>
            </div>
        </div>
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
