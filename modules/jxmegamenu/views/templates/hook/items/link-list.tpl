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


{if isset($list)}
  <li class="{$list.class}">
    <a href="{$list.url}" title="{$list.title}">{$list.title}</a>
    {if isset($list.items)}
      <ul>
        {foreach from=$list.items item='item'}
          <li {if $selected}{$item.selected}{/if}>
            <a href="{$item.url}" title="{$item.name}">{$item.name}</a>
          </li>
        {/foreach}
      </ul>
    {/if}
  </li>
{/if}
