{**
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
 *}
<div id="blockcart-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span class="material-icons" aria-hidden="true">&#xe5cd;</span>
      </button>
      <div class="modal-header">
        <h4 class="modal-title h6 text-sm-center" id="myModalLabel"><i class="material-icons">&#xe5ca;</i>{l s='Product successfully added to your shopping cart' d='Shop.Theme.Checkout'}</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-12 py-3 divider">
            <div class="row">
              <div class="item_info col-12">
                <div class="col-md-3">
                  <img class="product-image" src="{$product.cover.medium.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
                </div>

                <div class="col-md-9">
                  <h6 class="h6 product-name">{$product.name}</h6>

                  <p>{l s='Quantity:' d='Shop.Theme.Checkout'}&nbsp;{$product.cart_quantity}</p>
                  <p>{$product.price}</p>
                  {hook h='displayProductPriceBlock' product=$product type="unit_price"}
                </div>
              </div>

              <div class="col-12 item_info">
                {foreach from=$product.attributes item="property_value" key="property"}
                  {if empty($property_value)}
                    {else}
                    <span><strong>{$property}</strong>: {$property_value}</span>
                  {/if}
                {/foreach}
              </div>
            </div>
          </div>
          <div class="col-12">
            <div class="cart-content">
              {if $cart.products_count > 1}
                <p class="cart-products-count">{l s='There are %products_count% items in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}</p>
              {else}
                <p class="cart-products-count">{l s='There is %product_count% item in your cart.' sprintf=['%product_count%' =>$cart.products_count] d='Shop.Theme.Checkout'}</p>
              {/if}
              <p>{l s='Total products:' d='Shop.Theme.Checkout'}&nbsp;<span>{$cart.subtotals.products.value}</span></p>

              <p>{l s='Total shipping:' d='Shop.Theme.Checkout'}&nbsp;<span>{$cart.subtotals.shipping.value}</span> {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}</p>
              {if $cart.subtotals.tax}
                <p>{$cart.subtotals.tax.label}&nbsp;{$cart.subtotals.tax.value}</p>
              {/if}
              <p>{l s='Total:' d='Shop.Theme.Checkout'}&nbsp;<span>{$cart.totals.total.value}</span> {$cart.labels.tax_short}</p>

              <div class="cart-content-btn">
                <a href="{$cart_url}" class="btn btn-primary"><i class="material-icons">&#xE876;</i>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
                <button class="btn btn-secondary" type="button"  data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
