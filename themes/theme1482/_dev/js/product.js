/**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */



import $ from 'jquery';

$(document).ready(function () {
  createProductSpin();
  createInputFile();
  coverImage();
  product_thumbs_refresh();
  quickview_thumbs_refresh();

  prestashop.on('updatedProduct', function (event) {
    createInputFile();
    coverImage();
    if (event && event.product_minimal_quantity) {
      const minimalProductQuantity = parseInt(event.product_minimal_quantity, 10);
      const quantityInputSelector = '#quantity_wanted';
      let quantityInput = $(quantityInputSelector);

      // @see http://www.virtuosoft.eu/code/bootstrap-touchspin/ about Bootstrap TouchSpin
      quantityInput.trigger('touchspin.updatesettings', {min: minimalProductQuantity});
    }
    $('.js-product-images-modal').replaceWith(event.product_images_modal);
    product_thumbs_refresh();
    quickview_thumbs_refresh();
  });

  function coverImage() {
    $(document).on(
      'click',
      '.js-thumb',
      (event) => {
        $('.js-modal-product-cover').attr('src', $(event.target).data('image-large-src'));
        $('.selected').removeClass('selected');
        $(event.target).addClass('selected');
        $('.js-qv-product-cover').prop('src', $(event.currentTarget).data('image-large-src'));
      }
    );
  }

  function createInputFile() {

    $('.js-file-input').on('change', (event) => {
      let target, file;

      if ((target = $(event.currentTarget)[0]) && (file = target.files[0])) {
        $(target).prev().text(file.name);
      }
    });
  }


  function createProductSpin()
  {
    let quantityInput = $('#quantity_wanted');
    quantityInput.TouchSpin({
      buttonup_class: 'btn btn-touchspin js-touchspin',
      buttondown_class: 'btn btn-touchspin js-touchspin',
      min: parseInt(quantityInput.attr('min'), 10),
      max: 1000000
    });

    var quantity = quantityInput.val();
    quantityInput.on('keyup change', function (event) {
      const newQuantity = $(this).val();
      if (newQuantity !== quantity) {
        quantity = newQuantity;
        let $productRefresh = $('.product-refresh');
        $(event.currentTarget).trigger('touchspin.stopspin');
        $productRefresh.trigger('click', {eventType: 'updatedProductQuantity'});
      }
      event.preventDefault();

      return false;
    });
  }


  function product_thumbs_refresh() {
    let thumbs_list = $('#product .mask .js-qv-product-images');
    thumbs_list.slick({
      slidesToShow: 5,
      infinite: false,
      slidesToScroll: 1,
      accessibility : false,
      dots: false,
      prevArrow      : '<i class="material-icons arrow-left">&#xe5cb;</i>',
      nextArrow      : '<i class="material-icons arrow-right">&#xe5cc;</i>',
      responsive     : [
        {
          breakpoint : 1848,
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
          breakpoint : 768,
          settings   : {
            slidesToShow : 4
          }
        },
        {
          breakpoint : 576,
          settings   : {
            slidesToShow : 3
          }
        },
        {
          breakpoint : 410,
          settings   : {
            slidesToShow : 2
          }
        },
      ]
    });
  }


  function quickview_thumbs_refresh() {

    let $quickview_thumbs = $('.quickview .js-qv-product-images');
    if($quickview_thumbs.length) {
      $quickview_thumbs.slick({
        slidesToShow   : 3,
        accessibility : false,
        infinite: false,
        slidesToScroll : 1,
        dots           : false,
        prevArrow      : '<i class="material-icons arrow-left">&#xe5cb;</i>',
        nextArrow      : '<i class="material-icons arrow-right">&#xe5cc;</i>'
      });
    }
  }


});
