{**
* 2002-2016 Jetimpex
*
* JX Category Products
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
*  @copyright 2002-2016 Jetimpex
*  @license   http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}

{if isset($blocks) && $blocks}
  {foreach from=$blocks item='block' name='block' key=k}
    {assign var="block_identificator" value="_{$k + 1}"}
    <section id="{$hook_class}-block-category-{$block_identificator}" class="featured-products category-block category-block-{$hook_class}{$block_identificator}">
      <h1 class="h1 products-section-title text-uppercase">
        <a href="{$link->getCategoryLink($block.id)|escape:'html':'UTF-8'}">{$block.name}</a>
      </h1>
      {if isset($block.products) && $block.products}
        <div class="products">
          {assign var='products' value=$block.products}
          {foreach from=$products item='product'}
            {include file="catalog/_partials/miniatures/product.tpl" product=$product}
          {/foreach}
        </div>
      {else}
        <p class="alert alert-warning">{l s='No products in this category.' mod='jxcategoryproducts'}</p>
      {/if}
    </section>
  {/foreach}
{/if}