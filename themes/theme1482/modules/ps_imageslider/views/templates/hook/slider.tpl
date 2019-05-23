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

{if $homeslider.slides}
  <div id="carousel" data-ride="carousel" class="carousel slide" data-interval="{$homeslider.speed}" data-wrap="{(string)$homeslider.wrap}" data-pause="{$homeslider.pause}">
    <ul class="carousel-inner" role="listbox">
      {foreach from=$homeslider.slides item=slide name='homeslider'}
        <li class="carousel-item  slide-{$smarty.foreach.homeslider.iteration} {if $smarty.foreach.homeslider.first}active{/if}" role="option" aria-hidden="{if $smarty.foreach.homeslider.first}false{else}true{/if}">
          <a href="{$slide.url}">
            <div>
              <img src="{$slide.image_url}" alt="{$slide.legend|escape}">
              {if $slide.title || $slide.description}
                <div class="caption">
                  <div class="container">
                    <div class="caption-description">{$slide.description nofilter}</div>
                  </div>
                </div>
              {/if}
            </div>
          </a>
        </li>
      {/foreach}
    </ul>
    <ol class="carousel-indicators">
      <li data-target="#carousel" data-slide-to="0" class="pager active"></li>
      <li data-target="#carousel" data-slide-to="1" class="pager"></li>
      <li data-target="#carousel" data-slide-to="2" class="pager"></li>
    </ol>
  </div>
{/if}
