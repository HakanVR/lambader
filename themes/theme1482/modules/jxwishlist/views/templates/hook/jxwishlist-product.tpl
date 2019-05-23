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

<p class="buttons_bottom_block no-print">
  {if $wishlists|count == 1 || $wishlists|count == 0}
    <a href="#" id="wishlist_button_nopop" class="AddToWishlist" onclick="AddProductToWishlist('action_add', '{$id_product|intval}', $('#idCombination').val(), document.getElementById('quantity_wanted').value); return false;" rel="nofollow"  title="{l s='Add to my wishlist' mod='jxwishlist'}">
      <i class="material-icons">&#xe87e;</i>
      <span>  {l s='Add to wishlist' mod='jxwishlist'} </span>
    </a>
  {else}
	<a id="wishlist_button" class="AddToWishlist" tabindex="0" data-toggle="popover" data-trigger="focus" title="{l s='Wishlist' mod='jxwishlist'}" data-placement="right">
    <i class="material-icons">&#xe87e;</i>
	</a>
	<div hidden id="popover-content-wishlist">
	  {foreach from=$wishlists item=wishlist  name=cl}
	    <div class="popover-item-wishlist" title="{$wishlist.name|escape:'html':'UTF-8'}" value="{$wishlist.id_wishlist|escape:'htmlall':'UTF-8'}" onclick="AddProductToWishlist('action_add', '{$id_product|intval}', $('#idCombination').val(), document.getElementById('quantity_wanted').value, '{$wishlist.id_wishlist|intval}');">
		  {l s='Add to %s' sprintf=[$wishlist.name] mod='jxwishlist'}
	    </div>
	  {/foreach}
	</div>
  {/if}
</p>

{if isset($smarty.post.action)}
  <script>
    $("#wishlist_button").popover({
      html: true,
      content: function(){
        return $("#popover-content-wishlist").html();
      }
    });
  </script>
{/if}
