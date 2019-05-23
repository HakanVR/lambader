{*
* 2002-2017 Jetimpex
*
* JX Wishlist
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
*  @author    Jetimpex
*  @copyright 2002-2017 Jetimpex
*  @license   http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}

{extends file=$layout}
{block name="content"}
  {block name='breadcrumb'}
    <nav class="breadcrumb hidden-sm-down">
      <ol itemscope itemtype="http://schema.org/BreadcrumbList">
        <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
          <a itemprop="item" href="{$link->getPageLink('my-account', true)|escape:'htmlall':'UTF-8'}">
            <span itemprop="name">{l s='My account' mod='jxwishlist'}</span>
          </a>
        </li>
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
          <a itemprop="item" href="{$link->getModuleLink('jxwishlist', 'wishlists', array(), true)|escape:'htmlall':'UTF-8'}">
            <span itemprop="name">{l s='My wishlists' mod='jxwishlist'}</span>
          </a>
        </li>
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
          <span itemprop="name">{$current_wishlist.name|escape:'htmlall':'UTF-8'}</span>
        </li>
      </ol>
    </nav>
  {/block}
  <section id="main">
    <h2>{$current_wishlist.name|escape:'htmlall':'UTF-8'}</h2>
    {if $products}
      <section id="products">
        <div class="products row">
          {foreach from=$products item=product name=i}
            <article class="product-miniature js-product-miniature" data-id-product="{$product.info_array.id_product}" data-id-product-attribute="{$product.info_array.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
              <div class="thumbnail-container">
                {block name='product_thumbnail'}
                  <a class="thumbnail product-thumbnail" href="{$product.info_array.url}">
                    <img class="replace-2x img-responsive" src="{$product.info_array.cover.bySize.home_default.url}" alt = "{$product.info_array.cover.legend}" data-full-size-image-url = "{$product.info_array.cover.large.url}" />
                  </a>
                {/block}
                <div class="product-description">
                  {block name='product_name'}
                    <h1 class="h3 product-title" itemprop="name"><a href="{$product.info_array.url}">{$product.info_array.name|truncate:30:'...'}</a></h1>
                  {/block}
                  {block name='product_price_and_shipping'}
                    {if $product.info_array.show_price}
                      <div class="product-price-and-shipping">
                        {if $product.info_array.has_discount}
                          {hook h='displayProductPriceBlock' product=$product.info_array type="old_price"}
                          <span class="regular-price">{$product.info_array.regular_price}</span>
                          {if $product.info_array.discount_type === 'percentage'}
                            <span class="discount-percentage">{$product.info_array.discount_percentage}</span>
                          {/if}
                        {/if}
                        {hook h='displayProductPriceBlock' product=$product.info_array type="before_price"}
                        <span itemprop="price" class="price">{$product.info_array.price}</span>
                          {hook h='displayProductPriceBlock' product=$product.info_array type='unit_price'}
                          {hook h='displayProductPriceBlock' product=$product.info_array type='weight'}
                      </div>
                    {/if}
                  {/block}
                </div>
                {block name='product_flags'}
                  <ul class="product-flags">
                    {foreach from=$product.info_array.flags item=flag}
                      <li class="{$flag.type}">{$flag.label}</li>
                    {/foreach}
                  </ul>
                {/block}
                <div class="highlighted-informations{if !$product.info_array.main_variants} no-variants{/if} hidden-sm-down">
                  <a href="#" class="quick-view" data-link-action="quickview">
                    <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' mod='jxwishlist'}
                  </a>
                  {block name='product_variants'}
                    {if $product.info_array.main_variants}
                      {include file='catalog/_partials/variant-links.tpl' variants=$product.info_array.main_variants}
                    {/if}
                  {/block}
                </div>
              </div>
            </article>
          {/foreach}
        </div>
      </section>
    {else}
      <p class="alert alert-warning">{l s='No products in this wishlist.' mod='jxwishlist'}</p>
    {/if}
  </section>
{/block}