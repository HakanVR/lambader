{if isset($htmlitems) && $htmlitems}
{assign var='hookName' value={$hook}}
<div id="jxhtmlcontent_{$hookName}">
	<ul class="jxhtmlcontent-{$hookName} clearfix row">
		{foreach name=items from=$htmlitems item=hItem}
            <li class="jxhtmlcontent-item-{$smarty.foreach.items.iteration} col-xs-12 {$hItem.specific_class}">
                {if $hItem.url}
                    <a href="{$hItem.url}" class="item-link"{if $hItem.target == 1} onclick="return !window.open(this.href);"{/if} title="{$hItem.title}">
                {/if}
                    {if $hItem.image}
                        <img src="{$link->getMediaLink("`$module_dir`img/`$hItem.image`")}" class="item-img img-responsive" title="{$hItem.title}" alt="{$hItem.title}" width="{if $hItem.image_w}{$hItem.image_w|intval}{else}100%{/if}" height="{if $hItem.image_h}{$hItem.image_h|intval}{else}100%{/if}"/>
                    {/if}
                    {if $hItem.title && $hItem.title_use == 1}
                        <h3 class="item-title">{$hItem.title}</h3>
                    {/if}
                    {if $hItem.html}
                        <div class="item-html">
                            {$hItem.html nofilter}
                        </div>
                    {/if}
                {if $hItem.url}
                    </a>
                {/if}
            </li>
		{/foreach}
	</ul>
</div>
{/if}
