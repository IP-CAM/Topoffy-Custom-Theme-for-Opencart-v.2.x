<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="<?php echo $og_url; ?>"/>
    <?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>"/>
    <?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>"/>
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>"/>
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="catalog/view/theme/sela/stylesheet/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900|Open+Sans:300,400,600,700,800&amp;subset=cyrillic"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="catalog/view/theme/sela/stylesheet/stylesheet.css" rel="stylesheet">
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
    <script src="catalog/view/theme/sela/javascript/common.js"></script>
    <?php if ($image_protection) { ?>
    <script>
        $(document).ready(function () {
            // prevent images right click context menu
            $('img').bind('contextmenu', function () {
                return false;
            });
        });

        // fixed header
        $(window).scroll(function () {
            if ($(this).scrollTop() > 60) {
                $('header').addClass("sticky");
            } else {
                $('header').removeClass("sticky");
            }
        });


    </script>
    <?php } ?>
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
    <?php if ($custom) { ?>
    <?php include("catalog/view/theme/sela/stylesheet/custom.tpl"); ?>
    <?php } ?>
</head>
<body class="<?php echo $class; ?>">
<div class="loader"></div>
<div class="site-overlay"></div>
<header class="always-sticky">
    <nav class="navbar navbar-default navbar-static-top">
        <div class="<?php echo $container ?: 'container-fluid'; ?>">
            <div class="navbar-header">
                <?php if ($logo) { ?>
                <?php if ($home == $og_url) { ?>
                <div class="navbar-brand"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
                                               alt="<?php echo $name; ?>" class="img-responsive"/></div>
                <?php } else { ?>
                <a href="<?php echo $home; ?>" class="navbar-brand"><img src="<?php echo $logo; ?>"
                                                                         title="<?php echo $name; ?>"
                                                                         alt="<?php echo $name; ?>"
                                                                         class="img-responsive"/></a>
                <?php } ?>
                <?php } else { ?>
                <span class="h1-logo"><a href="<?php echo $home; ?>"><?php echo $name; ?></a></span>
                <?php } ?>
            </div>

            <div class="navbar-tail">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <ul class="list-inline text-right header-right-menu">
                    <li><p class="header-phone"><?php echo $contact_info['phone_1'] ?></p></li>
                    <li><a href="#" class="icon-search"><i class="material-icons">search</i></a></li>
                    <li>
                        <a href="#" class="icon-cart" id="icon-cart">
                            <i class="material-icons">shopping_cart</i>
                            <span id="cart-total"><?php echo $text_items; ?></span>
                        </a>
                    </li>
                    <li><a href="#" class="icon-account"><i class="material-icons">person</i></a></li>
                </ul>
            </div>

            <div class="navbar-collapse collapse">
                <?php if ($categories) { ?>
                <ul class="nav navbar-nav">
                    <?php foreach ($categories as $category) { ?>
                    <?php if ($category['children']) { ?>
                    <li class="dropdown fullwidth">
                        <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
                            <?php echo $category['name']; ?>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <span class="dropdown-triangle"></span>
                        <div class="dropdown-menu animated fadeInUp">

                            <div class="dropdown-inner">
                                <!-- Output in 1 column always -->
                                <?php $category['column'] = 1; ?>
                                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                <ul class="list-unstyled flex">
                                    <?php foreach ($children as $child) { ?>
                                    <?php if (isset($child['sub_children']) && $child['sub_children']) { ?>
                                    <li>
                                        <a href="<?php echo $child['href']; ?>">
                                            <span><?php echo $child['name']; ?></span>
                                            <i class="fa fa-angle-right pull-right"></i>
                                        </a>
                                        <div class="sub-dropdown-menu animated fadeInUp">
                                            <div class="sub-dropdown-inner">
                                                <?php foreach (array_chunk($child['sub_children'], ceil(count($child['sub_children']) / $child['column'])) as $sub_children) { ?>
                                                <ul class="list-unstyled">
                                                    <?php foreach ($sub_children as $sub_child) { ?>
                                                    <li>
                                                        <a href="<?php echo $sub_child['href']; ?>"><?php echo $sub_child['name']; ?></a>
                                                    </li>
                                                    <?php } ?>
                                                </ul>
                                                <?php } ?>
                                            </div>
                                            <a href="<?php echo $child['href']; ?>"
                                               class="see-all"><?php echo $text_all; ?> <?php echo $child['name']; ?></a>
                                        </div>
                                    </li>
                                    <?php } else { ?>
                                    <li>
                                        <a href="<?php echo $child['href']; ?>" style="background-image: url('image/<?php echo $child['image']; ?>')">
                                            <span><?php echo $child['name']; ?></span>
                                        </a>
                                    </li>
                                    <?php } ?>
                                    <?php } ?>

                                    <li class="fillend">
                                        <a href="<?php echo $category['href']; ?>" class="see-all">
                                            <span><?php echo $text_all; ?> <?php echo $category['name']; ?></span>
                                        </a>
                                    </li>

                                </ul>
                                <?php } ?>

                            </div>

                            <div class="menu-left hidden"><i class="material-icons">chevron_left</i></div>
                            <div class="menu-right"><i class="material-icons">chevron_right</i></div>

                        </div>

                    </li>
                    <?php } else { ?>
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                    <?php } ?>
                    <?php } ?>
                </ul>
                <?php } ?>
            </div>
        </div>
    </nav>
</header>

<div class="dumb"></div>

<div class="sidebar sidebar-account">
    <span class="close-sidebar"><i class="material-icons">close</i></span>
    <div class="inner">
        <div class="account">
            <h3><?php echo $text_account; ?></h3>
            <p class="bold"><?php echo $text_account_desc; ?></p>
            <ul class="list-unstyled">
                <?php if ($logged) { ?>
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
                <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                <?php } else { ?>
                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                <?php } ?>
            </ul>
        </div>
        <div class="currency">
            <?php echo $currency; ?>
        </div>
        <div class="language">
            <?php echo $language; ?>
        </div>
        <div class="telephone">
            <h3><?php echo $text_contact; ?></h3>
            <p><a href="<?php echo $contact; ?>"><?php echo $contact_info['phone_1'] ?></a></p>
            <p><a href="mailto: <?php echo $contact_info['email'] ?>"><?php echo $contact_info['email'] ?></a></p>
            <p class="bold"><?php echo $contact_info['address'] ?></p>
        </div>
    </div>
</div>

<div class="sidebar sidebar-search">
    <span class="close-sidebar"><i class="material-icons">close</i></span>
    <div class="inner">
        <?php echo $search; ?>
    </div>
</div>

<div class="sidebar sidebar-cart">
    <span class="close-sidebar"><i class="material-icons">close</i></span>
    <div class="inner" id="sidebar-cart">

        <?php echo $cart; ?>

    </div>
    <div class="inner cart-footer">
        <div id="cart_buttons" class="cart-buttons">
            <a class="btn btn-block btn-primary btn-xs-block" href="index.php?route=checkout/cart">Оформить заказ</a>
            <button class="btn btn-block btn-info btn-fastorder" type="button">Купить в один клик</button>
        </div>
        <div class="cart-info">
            Итого:<br/>
            <span id="cart-sum"><?php echo $text_totals." ".$this->session->data['currency']; ?></span>
        </div>
    </div>
</div>

<div class="sidebar sidebar-callme">
    <span class="close-sidebar"><i class="material-icons">close</i></span>
    <div class="inner" id="sidebar-cart">

    </div>
    <button class="btn btn-block btn-primary btn-callme" type="button">Отправить</button>
</div>

<div class="sidebar sidebar-fastorder">
    <span class="close-sidebar"><i class="material-icons">close</i></span>
    <div class="inner" id="sidebar-fastorder">

        <div class="fields-group">
            <?php if($c_logged) { ?>
            <label for="firstname-ch"> <?=$text_full_name?> :</label><br>
            <input type="text" class="form-control large-field" id="firstname-ch" name="firstname"
                   value="<?php echo $c_name; ?>" readonly="true"/>
            <?php } else { ?>
            <label for="firstname-ch"><span class="required">*</span>   <?=$text_full_name?> :</label><br>
            <input type="text" id="firstname-ch" name="firstname" value="" class="form-control large-field">
            <span class="error"></span>
            <?php } ?>
        </div>

        <div class="fields-group">
            <label for="telephone-ch"><span class="required">*</span>   <?=$text_phone?>:</label><br>
            <input type="tel" id="telephone-ch" name="telephone"
                   value="<?php echo $telephone; ?>" class="form-control large-field">
            <span class="error"></span>
        </div>

        <div class="fields-group">
            <label for="email-ch">   <?=$text_email?>:</label><br>
            <input type="text" id="email-ch" name="email" value="<?php echo $email; ?>"
                   class="form-control large-field">
            <span class="error"></span>
        </div>

        <div class="fields-group">
            <label for="comment_field">  <?=$text_comment?>:</label><br>
            <input type="text" id="comment_field" class="form-control large-field"
                   name="comment"
                   value="<?php echo $comment ?>">
        </div>

        <div class="fields-group hidden">
            <label for="city-ch"><span class="required">*</span> Town
                :</label><br>
            <input type="text" id="city-ch" name="city" value="eeee"
                   class="form-control large-field">
            <span class="error"></span>

            <label for='address_1'> Addr:</label><br/>
            <input type="text" name="address_1" id="address_1"
                   value="qqqqqqqqq"
                   class="form-control large-field"
                   placeholder="ph">
            <span class="error"></span>

        </div>

        <button id="btn-fastcheckout" class="btn btn-block btn-info" type="button">Подтвердить</button>

    </div>

    <script>
        $('#btn-fastcheckout').on('click', function () {

            $.ajax({
                url: 'index.php?route=checkout/onepagecheckout',
                type: 'post',
                data: $('#sidebar-fastorder input[type=\'text\'], #sidebar-fastorder input[type=\'tel\']'),
                dataType: 'json',
                beforeSend: function () {
                    $('#ajax-button-confirm').addClass('preloader');

                },
                complete: function () {
                    $('#ajax-button-confirm').removeClass('preloader');

                },
                success: function (json) {
                    console.log(json);

                    if (json.error) {
                        if (json['error']['firstname']) {
                            $('#firstname-ch+.error').html(json['error']['firstname']);
                        }


                        if (json['error']['email']) {
                            $('#email-ch+.error').html(json['error']['email']);
                        }

                        if (json['error']['telephone']) {
                            $('#telephone-ch+.error').html(json['error']['telephone']);
                        }

                        if (json['error']['address_1']) {
                            $('#address_1+.error').html(json['error']['address_1']);
                        }

                        if (json['error']['city']) {
                            $('#city-ch+.error').html(json['error']['city']);
                        }
                    }

                    else if (json['cod']) {
                        $.ajax({
                            type: 'get',
                            url: 'index.php?route=extension/payment/cod/confirm',
                            cache: false,
                            beforeSend: function () {
                                $('#ajax-button-confirm').button('loading');
                            },
                            complete: function () {
                                $('#ajax-button-confirm').button('reset');
                            },
                            success: function () {
                                location = 'index.php?route=checkout/success';
                            }
                        });
                    }

                    else if (json['payment']) {
                        //$('.hiden_payment_info').html(json['payment']);
                        //console.log($('.hiden_payment_info a').attr('href'));
                        //location = $('.hiden_payment_info a').attr('href');

                        // There is a problem with link to payment page!!!
                        location = 'index.php?route=checkout/success';
                    }
                    else {
                        if (json.credit)
                            credit_confirm('/index.php?route=checkout/part_payment_cart/getResult&from_privat24=true');
                        /* else
                             location = 'index.php?route=checkout/success'*/

                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });


        });

    </script>

</div>


<div class="console hidden">
    <?php print_r(get_defined_vars()); ?>
</div>
