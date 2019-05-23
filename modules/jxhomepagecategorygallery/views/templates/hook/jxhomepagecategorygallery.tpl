{*
* 2002-2016 Jetimpex
*
* JX Homepage Category Gallery
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
* @copyright  2002-2016 Jetimpex
* @license    http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}
{if isset($items) && $items}
	<div class="jxhomepagecategorygallery-block">
        <ul id="jxhomepagecategorygallery" class="jxhomepagecategorygallery">
            {foreach from=$items item=item name=slide}
                <li id="jxhomepagecategorygallery-item-{$smarty.foreach.slide.iteration}" class="item-{$item.id_item} item{if isset($item.specific_class) && $item.specific_class} {$item.specific_class}{/if}">
                    <a href="{$link->getCategoryLink($item.category.id)}" title="{$item.category.name}">
                        {if $item.image}
                            <img class="img-responsive" src="{$item.image.bySize.category_default.url}" alt="{$item.category.name}" />
                        {/if}
                        {if $item.display_name || $item.display_description || $item.button}
                            <div class="jxhomepagecategorygallery-content">
                                {if $item.content}
                                    <div class="jxhomepagecategorygallery-html">
                                        {$item.content nofilter}
                                    </div>
                                {/if}
                                {if $item.display_name}
                                    <h3 class="jxhomepagecategorygallery-name">
                                        {if $item.name_length > 0}
                                            {$item.category.name|truncate:$item.name_length:'..'}
                                        {else}
                                            {$item.category.name}
                                        {/if}
                                    </h3>
                                {/if}
                                {if $item.display_description}
                                    <div class="jxhomepagecategorygallery-description">
                                        {if $item.description_length > 0}
                                            {$item.category.description|strip_tags|truncate:$item.description_length:'..' nofilter}
                                        {else}
                                            {$item.category.description nofilter}
                                        {/if}
                                    </div>
                                {/if}
                                {if $item.button}
                                    <span class="jxhomepagecategorygallery-button">{l s='Shop now' mod='jxhomepagecategorygallery'}</span>
                                {/if}
                            </div>
                        {/if}
                    </a>
                </li>
            {/foreach}
        </ul>
        {if isset($display_gallery) && $display_gallery}
            {if count($items) > 1}
                <ul id="jxhomepagecategorygallery-nav" class="jxhomepagecategorygallery-nav">
                    {foreach from=$items item=item name=slide}
                        <li class="jxhomepagecategorygallery-nav-item-{$smarty.foreach.slide.iteration}"><a href="#jxhomepagecategorygallery-item-{$smarty.foreach.slide.iteration}">{$smarty.foreach.slide.iteration}</a></li>
                    {/foreach}
                </ul>
            {/if}
        {/if}
    </div>
{/if}