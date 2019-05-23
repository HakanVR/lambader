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
import 'velocity-animate';

export default class ProductSelect {
  init() {
    $('body').on('click', '.js-modal-thumb', (event) => {
      if ($('.js-modal-thumb').hasClass('selected')) {
        $('.js-modal-thumb').removeClass('selected');
      }
      $(event.currentTarget).addClass('selected');
      $('.js-modal-product-cover').attr('src', $(event.target).data('image-large-src'));
      $('.js-modal-product-cover').attr('title', $(event.target).attr('title'));
      $('.js-modal-product-cover').attr('alt', $(event.target).attr('alt'));
    })
      .on('click', 'aside#thumbnails', (event) => {
        if (event.target.id == 'thumbnails') {
          $('#product-modal').modal('hide');
        }
      });
    $(document).on('shown.bs.modal', '#product-modal', function(e) {
      setTimeout(function() {
        $('#product').find('.modal-dialog .js-modal-product-images').slick({
          infinite: true,
          vertical: true,
          slidesToShow: 3,
          verticalSwiping: true,
          slidesToScroll: 1,
          swipeToSlide: true,
          draggable: false,
          prevArrow: '<i class="material-icons-expand_less arrow-up js-arrow-up"></i>',
          nextArrow: '<i class="material-icons-expand_more arrow-down js-arrow-down"></i>'
        });
      }, 400);
    });
    $(document).on('hidden.bs.modal', '#product-modal', function(e) {
      $('#product').find('#main .js-modal-product-images.slick-slider').slick('unslick');
    });
  }
}
