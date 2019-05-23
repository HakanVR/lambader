/*
 * Custom code goes here.
 */

let responsiveflag = false;
$(document).ready(() => {
  let classView = localStorage.getItem('classView');
  let cols = $('#left-column, #right-column').length;
  !!classView && $('#js-product-list .products').removeClass().addClass('products').addClass('row').addClass(classView);


  $('body').on('click', '#grid', function() {
    let cols = $('#left-column, #right-column').length;
    if (cols == 2) {
      $('#js-product-list .products article').attr('class', 'product-miniature js-product-miniature  col-xl-6 col-sm-12 col-6');
    } else if (cols == 1) {
      $('#js-product-list .products article').attr('class', 'product-miniature js-product-miniature  col-xl-4 col-sm-6 col-6');
    } else {
      $('#js-product-list .products article').attr('class', 'product-miniature js-product-miniature  col-xl-3 col-sm-6 col-6');
    }
    $('#js-product-list .products').removeClass('list').addClass('grid');
    $('#grid').addClass('active');
    $('#list').removeClass('active');
    localStorage.setItem('classView', 'grid');
  });

  $('body').on('click', '#list', function() {
    $('#js-product-list .products').removeClass('grid').addClass('list');
    $('#js-product-list .products article').attr('class', 'product-miniature js-product-miniature  col-12');
    $('#list').addClass('active');
    $('#grid').removeClass('active');
    localStorage.setItem('classView', 'list');
  });

  if (localStorage.getItem('classView') == 'grid') {
    $('#grid').trigger('click');
    $('#grid').addClass('active');
    $('#list').removeClass('active');
  } else {
    $('#list').trigger('click');
    $('#list').addClass('active');
    $('#grid').removeClass('active');
  }


  prestashop.on('updateProductList', function(event) {
    if (localStorage.getItem('classView') == 'grid') {
      $('#grid').trigger('click');
      $('#grid').addClass('active');
      $('#list').removeClass('active');
      $('#js-product-list .products').removeClass('list').addClass('grid');

      var cols = $('#left-column, #right-column').length;
      if (cols == 2) {
        $('#js-product-list .products article').attr('class', 'product-miniature js-product-miniature  col-xl-6 col-sm-6 col-6');
      } else if (cols == 1) {
        $('#js-product-list .products article').attr('class', 'product-miniature js-product-miniature  col-xl-4 col-sm-6 col-6');
      } else {
        $('#js-product-list .products article').attr('class', 'product-miniature js-product-miniature col-xl-3 col-sm-6 col-6');
      }

    } else {
      $('#js-product-list .products').removeClass('grid').addClass('list');
      $('#js-product-list .products article').attr('class', 'product-miniature js-product-miniature  col-12');
      $('#list').trigger('click');
      $('#list').addClass('active');
      $('#grid').removeClass('active');
    }
  });


  if (('.products').length){
    if (cols == 2) {
      $('article.product-miniature').removeAttr('class', '').attr('class', 'product-miniature js-product-miniature col-xl-6 col-sm-6 col-12');
    } else if (cols == 1) {
      $('article.product-miniature').removeAttr('class', '').attr('class', 'product-miniature js-product-miniature col-xl-4 col-sm-6 col-12');
    } else {
      $('article.product-miniature').removeAttr('class', '').attr('class', 'product-miniature js-product-miniature col-xl-3 col-md-4 col-sm-6 col-6');
    }
  }

  if (('.products.list').length){
    $('.products.list article.product-miniature').removeAttr('class', '').attr('class', 'product-miniature js-product-miniature');
  }

  if (('.featured-products.category-block').length) {
    $('.featured-products.category-block .products article.product-miniature').removeAttr('class', '').attr('class', 'product-miniature js-product-miniature');
  }

  $('.count').each(function() {
    $(this).prop('Counter', 0).animate({
      Counter : $(this).text()
    }, {
      duration : 4000,
      easing   : 'swing',
      step     : function(now) {
        $(this).text(Math.ceil(now));
      }
    });
  });

  /*-------------- Slick Init Product carousel --------------*/

  if ($('.product-carousel .products').length) {
    $('.product-carousel .products').each(function() {
      $(this).slick({
        slidesToShow   : 4,
        infinite       : true,
        accessibility: false,
        slidesToScroll : 1,
        prevArrow      : '<i class="material-icons arrow-left">&#xe5cb;</i>',
        nextArrow      : '<i class="material-icons arrow-right">&#xe5cc;</i>',
        responsive     : [
          {
            breakpoint : 1200,
            settings   : {
              slidesToShow : 3
            }
          },
          {
            breakpoint : 992,
            settings   : {
              slidesToShow : 2
            }
          },
          {
            breakpoint : 400,
            settings   : {
              slidesToShow : 1
            }
          }
        ]
      });
    });
  }


  /*-------------- Slick Init Product carousel --------------*/

  if ($('.product-pack .product-carousel-pack').length) {
    $('.product-pack .product-carousel-pack').each(function() {
      $(this).slick({
        slidesToShow   : 5,
        infinite       : false,
        accessibility: false,
        slidesToScroll : 1,
        prevArrow      : '<i class="material-icons arrow-left">&#xe5cb;</i>',
        nextArrow      : '<i class="material-icons arrow-right">&#xe5cc;</i>',
        responsive     : [
          {
            breakpoint : 1848,
            settings   : {
              slidesToShow : 4
            }
          },

          {
            breakpoint : 1600,
            settings   : {
              slidesToShow : 3
            }
          },
          {
            breakpoint : 992,
            settings   : {
              slidesToShow : 2
            }
          }
        ]
      });
    });
  }


  if (($('.block-menu').length > 0)) {
    var docWidth  = $('body').find('.container').width();
    if (docWidth > 780) {
      $('.block-menu').tmStickUp();
    }
  }

  testimonialsSlider();
  sitemapAccordion();
});


/*-------------- To Top --------------*/
$(window).scroll(function() {
  let $this = $(this),
      top   = $('.up'),
      st    = $this.scrollTop();
  if (st < 500) {
    top.fadeOut().removeClass('animated_toTop');
    top.removeClass('aminmate_click');
  } else {
    top.stop(true, true).fadeIn().addClass('animated_toTop');
  }
});

function sitemapAccordion() {
 let accordionItem  = $('.list-accordion .accordion_current');
  if (accordionItem.length) {
    accordionItem.on('click', function() {
      $(this)
        .toggleClass('active')
        .parent()
        .find('.accordion_content')
        .stop()
        .slideToggle('medium');
    });
    $('.list-accordion')
      .addClass('accordionBox')
      .find('.accordion_content')
      .slideUp('fast');
  }
}



function testimonialsSlider() {
  let testimonials_slider = $('#testimonials');
  if (testimonials_slider.length) {
    testimonials_slider.bxSlider({
      responsive   : true,
      useCSS       : false,
      minSlides    : 1,
      maxSlides    : 1,
      slideWidth   : 1200,
      slideMargin  : 0,
      moveSlides   : 1,
      pager        : true,
      autoHover    : false,
      speed        : 500,
      pause        : 3000,
      controls     : false,
      autoControls : true,
      startText    : '',
      stopText     : '',
      prevText     : '',
      nextText     : ''
    });
  }
}

