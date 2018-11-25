function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}

// count shopping cart products
// and count total cost in cart
function updateCartQuantity() {
    var s = $('#cart-total').text();
    var re = /\d+/;
    var qty = s.match(re);
    //alert(qty);

    $('#cart-total').text(qty);

    if (($('#cart-total').text() !== "") && $('#cart-total').text() !== "0") {
        $('#cart-total').css("display", "block");
        $('#cart_buttons').removeClass('hidden');
    } else {
        $('#cart-total').css("display", "none");
        $('#cart_buttons').addClass('hidden');
    }

    let c = $('#cart-sum').text();
    re = /[\d|\s]+.00\s\S+/;
    let tot = c.match(re);
    //alert(tot);
    $('#cart-sum').text(tot);
}

function productFly (pid) {

    let prod = $('#product-' + pid + " .image img");
    let pos = prod.offset();
    let w = prod.width();
    let h = prod.height();

    let finpos = $("#icon-cart").offset();

    let fly = $("<img>", {
        text: 'fly',
        style: 'left:' + pos.left + 'px; top:' + pos.top + "px; width:" + w + "px; height:" + h + "px;",
        class: 'anifly',
        src: prod.attr('src')
    });

    $("body").append(fly);

    fly.animate({
        opacity: 0.1,
        left: finpos.left,
        top: finpos.top,
        width: "10",
        height: "10"
    }, 500, function() {
        fly.detach();
    });
}

function productDelete (pid) {
    $('#cart-p' + pid).addClass("del");
}

function notify(text) {
    setTimeout(function () {

        // create the notification
        var notification = new NotificationFx({
            message: '<span class="ns-sign pull-left"><i class="material-icons">done</i></span>' + '<div class="ns-message">' + text + '</div>' + '<span class="ns-close pull-right"><i class="material-icons">close</i></span></div>',
            layout: 'bar',
            effect: 'slidetop',
            type: 'notice'
        });

        // show the notification
        notification.show();

    }, 100);
}

$(window).load(function () {
    $(".loader").fadeOut("slow");
});

$(document).ready(function () {



    // Scrolling mega menu
    $('.menu-right').each(function () {
        let c = $(this).siblings('.dropdown-inner');
        let s = $(c).children('ul.flex').children().size();
        //if ($(c).children('ul.flex').width() <= $(c).width()) $(this).addClass('hidden');
        if ($('header').width() > (s * 130)) $(this).addClass('hidden');
        console.log($('header').width() + " " + (s * 130));
    });


    $('.menu-left').on('click', function (e) {
        let c = $(this).siblings('.dropdown-inner');
        let s = $(c).scrollLeft();
        s -= 390;
        $(this).siblings('.menu-right').removeClass('hidden');
        $(c).animate({ scrollLeft: s }, 300, () => {
            if (s <= 0) $(this).addClass('hidden');
        });
        //$(c).children('ul.flex')
    });
    $('.menu-right').on('click', function (e) {
        let c = $(this).siblings('.dropdown-inner');
        let s = $(c).scrollLeft();
        s += 390;
        $(c).animate({ scrollLeft: s }, 300, () => {
            if (s != $(c).scrollLeft()) $(this).addClass('hidden');
            if ($(c).scrollLeft() > 0) $(this).siblings('.menu-left').removeClass('hidden');
        });
        //$(c).children('ul.flex')

    });

    // sidebar
    $('.icon-account').on('click', function (e) {
        e.preventDefault();
        let F = $('.sidebar-account');
        if (F.length > 0) {
            F.addClass('open');
            $('.site-overlay').css({'visibility': 'visible', 'opacity': '1'});
            return false;
        }
    });

    $('.icon-cart').on('click', function (e) {
        e.preventDefault();
        let F = $('.sidebar-cart');
        if (F.length > 0) {
            F.addClass('open');
            $('.site-overlay').css({'visibility': 'visible', 'opacity': '1'});
            return false;
        }
    });

    $('.icon-search').on('click', function (e) {
        e.preventDefault();
        let F = $('.sidebar-search');
        if (F.length > 0) {
            F.addClass('open');
            $('.site-overlay').css({'visibility': 'visible', 'opacity': '1'});
            return false;
        }
    });

    $('.btn-fastorder').on('click', function (e) {
        $('.close-sidebar, .site-overlay').click();
        e.preventDefault();
        let F = $('.sidebar-fastorder');
        if (F.length > 0) {
            F.addClass('open');
            $('.site-overlay').css({'visibility': 'visible', 'opacity': '1'});
            return false;
        }
    });

    $('.btn-callme').on('click', function (e) {
        $('.close-sidebar, .site-overlay').click();
        e.preventDefault();
        let F = $('.sidebar-callme');
        if (F.length > 0) {
            F.addClass('open');
            $('.site-overlay').css({'visibility': 'visible', 'opacity': '1'});
            return false;
        }
    });


    $('.close-sidebar, .site-overlay').on('click', function () {
        $('.site-overlay').css({'visibility': 'hidden', 'opacity': '0'});
        $('.sidebar').removeClass('open');
    });

    // adding the clear fix
    cols1 = $('#column-right, #column-left').length;

    if ($(window).width() > 767) {
        if (cols1 == 2) {
            $('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
        } else if (cols1 == 1) {
            $('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix"></div>');
        } else {
            $('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix"></div>');
        }
        $('.refine-search:nth-child(6n+6)').after('<div class="clearfix"></div>');
    } else {
        $('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix"></div>');
        $('.refine-search:nth-child(2n+2)').after('<div class="clearfix"></div>');
    }

    // highlight any found errors
    $('.text-danger').each(function () {
        var element = $(this).parent().parent();

        if (element.hasClass('form-group')) {
            element.addClass('has-error');
        }
    });

    // currency
    $('#form-currency .currency-select').on('click', function (e) {
        e.preventDefault();

        $('#form-currency input[name=\'code\']').attr('value', $(this).attr('href'));

        $('#form-currency').submit();
    });

    // language
    $('#form-language .language-select').on('click', function (e) {
        e.preventDefault();

        $('#form-language input[name=\'code\']').attr('value', $(this).attr('href'));

        $('#form-language').submit();
    });

    // search
    $('#search input[name=\'search\']').parent().find('button').on('click', function () {
        url = $('base').attr('href') + 'index.php?route=product/search';

        var value = $('.sidebar-search input[name=\'search\']').val();

        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }

        location = url;
    });

    $('#search input[name=\'search\']').on('keydown', function (e) {
        if (e.keyCode == 13) {
            $('.sidebar-search input[name=\'search\']').parent().find('button').trigger('click');
        }
    });

    // menu
    $('#menu .dropdown-menu, #menu .sub-dropdown-menu').each(function () {
        var menu = $('#menu').offset();
        var dropdown = $(this).parent().offset();

        var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

        if (i > 0) {
            $(this).css('margin-left', '-' + (i + 5) + 'px');
        }
    });

    // product list
    $('#list-view').click(function () {
        $('#content .product-layout > .clearfix').remove();

        $('#content .row > .product-layout').attr('class', 'product-layout product-list col-xs-12');

        localStorage.setItem('display', 'list');
    });

    // product grid
    $('#grid-view').click(function () {
        $('#content .product-layout > .clearfix').remove();

        // what a shame bootstrap does not take into account dynamically loaded columns
        cols = $('#column-right, #column-left').length;

        if (cols == 2) {
            $('#content .product-layout').attr('class', 'product-layout product-grid col-xs-6 col-sm-6');
        } else if (cols == 1) {
            $('#content .product-layout').attr('class', 'product-layout product-grid col-xs-6 col-sm-3');
        } else {
            $('#content .product-layout').attr('class', 'product-layout product-grid col-xs-6 col-sm-3');
        }

        localStorage.setItem('display', 'grid');
    });

    if (localStorage.getItem('display') == 'list') {
        $('#list-view').trigger('click');
    } else {
        $('#grid-view').trigger('click');
    }
    // Checkout
    $(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function (e) {
        if (e.keyCode == 13) {
            $('#collapse-checkout-option #button-login').trigger('click');
        }
    });

    // tooltips on hover
    $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

    // makes tooltips work on ajax generated content
    $(document).ajaxStop(function () {
        $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
    });

    // dropdown menu
    $('.dropdown-menu input').click(function (e) {
        e.stopPropagation();
    });

    $('.nav > .dropdown > .dropdown-toggle').click(function() {
        if ($(window).width() > 767) {
            window.location = this.href;
        }
    });

    // back top
    $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            $(".back-top").fadeIn();
        } else {
            $(".back-top").fadeOut();
        }
    });

    $(".back-top").click(function (e) {
        e.preventDefault();
        $("body, html").animate({
            scrollTop: 0
        }, 300);
    });

    // ripple link effect
    var ink, d, x, y;
    $(".ripplelink").click(function (e) {
        if ($(this).find(".ink").length === 0) {
            $(this).prepend("<span class='ink'></span>");
        }

        ink = $(this).find(".ink");
        ink.removeClass("animate");

        if (!ink.height() && !ink.width()) {
            d = Math.max($(this).outerWidth(), $(this).outerHeight());
            ink.css({height: d, width: d});
        }

        x = e.pageX - $(this).offset().left - ink.width() / 2;
        y = e.pageY - $(this).offset().top - ink.height() / 2;

        ink.css({top: y + 'px', left: x + 'px'}).addClass("animate");
    });

    // run update cart quantity function
    updateCartQuantity();

});

// cart add remove functions
var cart = {
    'add': function (product_id, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('loading');
            },
            complete: function () {
                $('#cart > button').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                $('#cart > button').button('reset');

                if (json.redirect) {
                    location = json.redirect;
                }

                productFly( product_id);

                if (json.success) {
                    setTimeout(function () {

                        // Update cart quantity
                        $('#cart-total').text(json.total);
                        $('#cart-sum').text(json.total);

                        // Refresh cart
                        // console.log(json);
                        $('#sidebar-cart').load('index.php?route=common/cart/info');

                        updateCartQuantity();
                        $('.icon-cart').click();

                    }, 400);

                    // Show the notification
                    // notify(json.success);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'update': function (key, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('loading');
            },
            complete: function () {
                $('#cart > button').button('reset');
            },
            success: function (json) {

                // need to set timeout otherwise it wont update the total
                setTimeout(function () {
                    $('#cart-total').text(json.total);
                    $('#cart-sum').text(json.total);

                    updateCartQuantity();

                }, 100);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function (key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('loading');
            },
            complete: function () {
                $('#cart > button').button('reset');
            },
            success: function (json) {
                // need to set timeout otherwise it wont update the total
                productDelete(key);

                setTimeout(function () {

                    // Update cart quantity
                    $('#cart-total').text(json.total);
                    $('#cart-sum').text(json.total);

                    // Refresh cart
                    // console.log(json);
                    $('#sidebar-cart').load('index.php?route=common/cart/info');

                    updateCartQuantity();
                    $('.icon-cart').click();

                }, 400);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
};

var voucher = {
    'add': function () {

    },
    'remove': function (key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('loading');
            },
            complete: function () {
                $('#cart > button').button('reset');
            },
            success: function (json) {
                // need to set timeout otherwise it wont update the total
                setTimeout(function () {
                    $('#cart-total').text(json.total);

                    updateCartQuantity();

                }, 100);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
};

var wishlist = {
    'add': function (product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();

                if (json.redirect) {
                    location = json.redirect;
                }

                if (json.success) {
                    notify(json.success);
                }

                $('#wishlist-total').text(json.total);
                $('#wishlist-total').attr('title', json.total);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function () {

    }
};

var compare = {
    'add': function (product_id) {
        $.ajax({
            url: 'index.php?route=product/compare/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();

                if (json.success) {
                    notify(json.success);

                    $('#compare-total').text(json.total);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function () {

    }
};

// agree to terms
$(document).delegate('.agree', 'click', function (e) {
    e.preventDefault();

    $('#modal-agree').remove();

    var element = this;

    $.ajax({
        url: $(element).attr('href'),
        type: 'get',
        dataType: 'html',
        success: function (data) {
            html = '<div id="modal-agree" class="modal">';
            html += '  <div class="modal-dialog">';
            html += '    <div class="modal-content">';
            html += '      <div class="modal-header">';
            html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
            html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
            html += '      </div>';
            html += '      <div class="modal-body">' + data + '</div>';
            html += '    </div>';
            html += '  </div>';
            html += '</div>';

            $('body').append(html);

            $('#modal-agree').modal('show');
        }
    });
});

// autocomplete
(function ($) {
    $.fn.autocomplete = function (option) {
        return this.each(function () {
            this.timer = null;
            this.items = [];

            $.extend(this, option);

            $(this).attr('autocomplete', 'off');

            // focus
            $(this).on('focus', function () {
                this.request();
            });

            // blur
            $(this).on('blur', function () {
                setTimeout(function (object) {
                    object.hide();
                }, 200, this);
            });

            // keydown
            $(this).on('keydown', function (event) {
                switch (event.keyCode) {
                    case 27: // escape
                        this.hide();
                        break;
                    default:
                        this.request();
                        break;
                }
            });

            // click
            this.click = function (event) {
                event.preventDefault();

                value = $(event.target).parent().attr('data-value');

                if (value && this.items[value]) {
                    this.select(this.items[value]);
                }
            };

            // show
            this.show = function () {
                var pos = $(this).position();

                $(this).siblings('ul.dropdown-menu').css({
                    top: pos.top + $(this).outerHeight(),
                    left: pos.left
                });

                $(this).siblings('ul.dropdown-menu').show();
            };

            // hide
            this.hide = function () {
                $(this).siblings('ul.dropdown-menu').hide();
            };

            // request
            this.request = function () {
                clearTimeout(this.timer);

                this.timer = setTimeout(function (object) {
                    object.source($(object).val(), $.proxy(object.response, object));
                }, 200, this);
            };

            // response
            this.response = function (json) {
                html = '';

                if (json.length) {
                    for (i = 0; i < json.length; i++) {
                        this.items[json[i].value] = json[i];
                    }

                    for (i = 0; i < json.length; i++) {
                        if (!json[i].category) {
                            html += '<li data-value="' + json[i].value + '"><a href="#">' + json[i].label + '</a></li>';
                        }
                    }

                    // get all the ones with a categories
                    var category = [];

                    for (i = 0; i < json.length; i++) {
                        if (json[i].category) {
                            if (!category[json[i].category]) {
                                category[json[i].category] = [];
                                category[json[i].category].name = json[i].category;
                                category[json[i].category].item = [];
                            }

                            category[json[i].category].item.push(json[i]);
                        }
                    }

                    for (var i in category) {
                        html += '<li class="dropdown-header">' + category[i].name + '</li>';

                        for (j = 0; j < category[i].item.length; j++) {
                            html += '<li data-value="' + category[i].item[j].value + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i].item[j].label + '</a></li>';
                        }
                    }
                }

                if (html) {
                    this.show();
                } else {
                    this.hide();
                }

                $(this).siblings('ul.dropdown-menu').html(html);
            };

            $(this).after('<ul class="dropdown-menu"></ul>');
            $(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));

        });
    };
})(window.jQuery);
