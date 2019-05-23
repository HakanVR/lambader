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
{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">

      <div class="d-flex aline-items-center mb-2 justify-content-between description-grid">

        {block name='product_name'}
          <h1 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h1>
        {/block}

        <div class="functional-buttons">
          {hook h = 'displayProductListFunctionalButtons'  product=$product}
        </div>

      </div>

      <div class="product-text-description-grid">
        {if $product.description_short}{$product.description_short|truncate:150:'...' nofilter}{/if}
      </div>

      <div class="product-text-description-list">
        <div class="d-flex">
          <div class="d-flex align-items-center mb-2 justify-content-between">
            {block name='product_name'}
              <h1 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h1>
            {/block}

            <div class="functional-buttons">
              {hook h = 'displayProductListFunctionalButtons'  product=$product}
            </div>
          </div>

          {$product.description|truncate:350:'...' nofilter }
        </div>
        <div class="product-description  d-flex aline-items-center justify-content-between">
          <div>
            {block name='product_reviews'}
              {hook h='displayProductListReviews' product=$product}
            {/block}

            {block name='product_price_and_shipping'}
              {if $product.show_price}
                <div class="product-price-and-shipping">
                  {hook h='displayProductPriceBlock' product=$product type="before_price"}
                  <span itemprop="price" class="price">{$product.price}</span>
                  <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
                  {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                  {hook h='displayProductPriceBlock' product=$product type='weight'}

                  {if $product.has_discount}
                    {hook h='displayProductPriceBlock' product=$product type="old_price"}
                    <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                    <span class="regular-price">{$product.regular_price}</span>
                  {/if}
                </div>
              {/if}
            {/block}
          </div>

          <div class="button-container">
            {if !$configuration.is_catalog}
              <form action="{$urls.pages.cart}" method="post">
                <div class="product-quantity" style="display:none;">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id_product}">
                  <input type="hidden" name="id_customization" value="0">
                  <input type="hidden" name="qty" value="1" class="input-group" min="1"/>
                </div>
                {if $product.customizable == 0 && ({$product.minimal_quantity} < {$product.quantity})}
                  <a href="javascript:void(0);" class="ajax_add_to_cart_button add-to-cart btn btn-md btn-primary" data-button-action="add-to-cart">
                    <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                  </a>
                {else}
                  <a href="{$product.url}" class="btn btn-md btn-primary customized">
                    <span>{l s='Customize' d='Shop.Theme.Actions'}</span>
                  </a>
                {/if}
              </form>
            {/if}
          </div>

        </div>

      </div>


      <div class="product_img_container">

        {block name='product_thumbnail'}
          <a href="{$product.url}" class="thumbnail product-thumbnail">
            <img
              src="{$product.cover.bySize.home_default.url}"
              alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
              data-full-size-image-url="{$product.cover.large.url}"
              >
          </a>
        {/block}

        <div class="top_info">
          {block name='product_flags'}
            <ul class="product-flags">
              {foreach from=$product.flags item=flag}
                <li class="{$flag.type}">
                  <span>{$flag.label}</span>
                </li>
              {/foreach}
              {if $product.show_price && $product.has_discount}
                <li>
                  {if $product.discount_type === 'percentage'}
                    <span class="discount-percentage">{$product.discount_percentage}</span>
                  {/if}
                </li>
              {/if}
            </ul>
          {/block}

        </div>

        <div class="bottom_info">
          {if $product.show_price && $product.has_discount}
            {hook h='displayProductPriceBlock' product=$product type="old_price"}
          {/if}
          {block name='product_variants'}
            {if $product.main_variants}
              {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
            {/if}
          {/block}
        </div>

        <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
          {block name='quick_view'}
            <a class="quick-view" href="#" data-link-action="quickview">
              <i class="material-icons search">&#xe8ff;</i>
            </a>
          {/block}
        </div>

      </div>

      <div class="product-description product-description-grid d-flex aline-items-center justify-content-between">
        <div>
          {block name='product_reviews'}
            {hook h='displayProductListReviews' product=$product}
          {/block}

          {block name='product_price_and_shipping'}
            {if $product.show_price}
              <div class="product-price-and-shipping">
                {hook h='displayProductPriceBlock' product=$product type="before_price"}
                <span itemprop="price" class="price">{$product.price}</span>
                <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
                {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                {hook h='displayProductPriceBlock' product=$product type='weight'}

                {if $product.has_discount}
                  {hook h='displayProductPriceBlock' product=$product type="old_price"}
                  <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                  <span class="regular-price">{$product.regular_price}</span>
                {/if}
              </div>
            {/if}
          {/block}
        </div>

        <div class="button-container">
          {if !$configuration.is_catalog}
            <form action="{$urls.pages.cart}" method="post">
              <div class="product-quantity" style="display:none;">
                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="id_product" value="{$product.id_product}">
                <input type="hidden" name="id_customization" value="0">
                <input type="hidden" name="qty" value="1" class="input-group" min="1"/>
              </div>
              {if $product.customizable == 0 && ({$product.minimal_quantity} < {$product.quantity})}
                <a href="javascript:void(0);" class="ajax_add_to_cart_button add-to-cart btn btn-md btn-primary" data-button-action="add-to-cart">
                  <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                </a>
              {else}
                <a href="{$product.url}" class="btn btn-md btn-primary customized">
                  <span>{l s='Customize' d='Shop.Theme.Actions'}</span>
                </a>
              {/if}
            </form>
          {/if}
        </div>

      </div>


    </div>
  </article>
{/block}
