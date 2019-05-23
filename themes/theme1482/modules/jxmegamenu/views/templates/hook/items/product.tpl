{*
* 2002-2017 Jetimpex
*
* JX Mega Menu
*
* NOTICE OF LICENSE
*
* This source file is subject to the General Public License (GPL 2.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/GPL-2.0
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade the module to newer
* versions in the future.
*
* @author     Jetimpex (Alexander Grosul)
* @copyright  2002-2017 Jetimpex
* @license    http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}

{if isset($product) && $product}
  <div class="product pr-4 d-flex flex-column justify-content-between product-{$product.id_product}">
    <div class="product-image">
      <a href="{$product.url}" title="{$product.name}">
        <img class="img-responsive" src="{$product.cover.bySize.home_default.url}" alt="{$product.cover.legend}"/>
      </a>
    </div>

    <div>
      <div class="product-price">
        {if $product.has_discount}
          <span class="regular-price">{$product.regular_price}</span>
          {if $product.discount_type === 'percentage'}
            <span class="discount-percentage">{$product.discount_percentage}</span>
          {/if}
        {/if}
        <span class="price">{$product.price}</span>
      </div>
      <h5 class="product-name">
        <a href="{$product.url}" title="{$product.name}">
          {$product.name}
        </a>
      </h5>
    </div>
  </div>
{/if}
