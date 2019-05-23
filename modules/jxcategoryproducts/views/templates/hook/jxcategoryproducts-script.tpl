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
  {foreach from=$blocks item='block' name='block'}
    {assign var="block_identificator" value="_{$block.id}"}
    {if $block.use_carousel}
    {literal}
      <script type="text/javascript">
        $(document).ready(function() {
          setNbCatItems{/literal}{$block.hook_name}{$block_identificator}{literal}();
          jxCategoryCarousel{/literal}{$block.hook_name}{$block_identificator}{literal} = $('#{/literal}{$block.hook_name}{literal}-block-category-{/literal}{$block_identificator}{literal} > .products').bxSlider({
            responsive       : true,
            useCSS           : false,
            minSlides        : carousel_nb_new{/literal}{$block.hook_name}{$block_identificator}{literal},
            maxSlides        : carousel_nb_new{/literal}{$block.hook_name}{$block_identificator}{literal},
            slideWidth       : {/literal}{$block.carousel_settings.carousel_slide_width}{literal},
            slideMargin      : {/literal}{$block.carousel_settings.carousel_slide_margin}{literal},
            infiniteLoop     : {/literal}{$block.carousel_settings.carousel_loop}{literal},
            hideControlOnEnd : {/literal}{$block.carousel_settings.carousel_hide_control}{literal},
            randomStart      : {/literal}{$block.carousel_settings.carousel_random}{literal},
            moveSlides       : {/literal}{$block.carousel_settings.carousel_item_scroll}{literal},
            pager            : {/literal}{$block.carousel_settings.carousel_pager}{literal},
            autoHover        : {/literal}{$block.carousel_settings.carousel_auto_hover}{literal},
            auto             : {/literal}{$block.carousel_settings.carousel_auto}{literal},
            speed            : {/literal}{$block.carousel_settings.carousel_speed}{literal},
            pause            : {/literal}{$block.carousel_settings.carousel_auto_pause}{literal},
            controls         : {/literal}{$block.carousel_settings.carousel_control}{literal},
            autoControls     : {/literal}{$block.carousel_settings.carousel_auto_control}{literal},
            startText        : '',
            stopText         : '',
          });
          var jx_cps_doit;
          $(window).resize(function() {
            clearTimeout(jx_cps_doit);
            jx_cps_doit = setTimeout(function() {
              resizedwjx_cps{/literal}{$block.hook_name}{$block_identificator}{literal}();
            }, 201);
          });
        });
        function resizedwjx_cps{/literal}{$block.hook_name}{$block_identificator}{literal}() {
          setNbCatItems{/literal}{$block.hook_name}{$block_identificator}{literal}();
          jxCategoryCarousel{/literal}{$block.hook_name}{$block_identificator}{literal}.reloadSlider({
            responsive       : true,
            useCSS           : false,
            minSlides        : carousel_nb_new{/literal}{$block.hook_name}{$block_identificator}{literal},
            maxSlides        : carousel_nb_new{/literal}{$block.hook_name}{$block_identificator}{literal},
            slideWidth       : {/literal}{$block.carousel_settings.carousel_slide_width}{literal},
            slideMargin      : {/literal}{$block.carousel_settings.carousel_slide_margin}{literal},
            infiniteLoop     : {/literal}{$block.carousel_settings.carousel_loop}{literal},
            hideControlOnEnd : {/literal}{$block.carousel_settings.carousel_hide_control}{literal},
            randomStart      : {/literal}{$block.carousel_settings.carousel_random}{literal},
            moveSlides       : {/literal}{$block.carousel_settings.carousel_item_scroll}{literal},
            pager            : {/literal}{$block.carousel_settings.carousel_pager}{literal},
            autoHover        : {/literal}{$block.carousel_settings.carousel_auto_hover}{literal},
            auto             : {/literal}{$block.carousel_settings.carousel_auto}{literal},
            speed            : {/literal}{$block.carousel_settings.carousel_speed}{literal},
            pause            : {/literal}{$block.carousel_settings.carousel_auto_pause}{literal},
            controls         : {/literal}{$block.carousel_settings.carousel_control}{literal},
            autoControls     : {/literal}{$block.carousel_settings.carousel_auto_control}{literal},
            startText        : '',
            stopText         : '',
          });
        }
        function setNbCatItems{/literal}{$block.hook_name}{$block_identificator}{literal}() {
          if ($('.category-block-{/literal}{$block.hook_name}{$block_identificator}{literal}').width() < 400) {
            carousel_nb_new{/literal}{$block.hook_name}{$block_identificator}{literal} = 1;
          }
          if ($('.category-block-{/literal}{$block.hook_name}{$block_identificator}{literal}').width() >= 400) {
            carousel_nb_new{/literal}{$block.hook_name}{$block_identificator}{literal} = 2;
          }
          if ($('.category-block-{/literal}{$block.hook_name}{$block_identificator}{literal}').width() >= 560) {
            carousel_nb_new{/literal}{$block.hook_name}{$block_identificator}{literal} = 3;
          }
          if ($('.category-block-{/literal}{$block.hook_name}{$block_identificator}{literal}').width() > 840)
            carousel_nb_new{/literal}{$block.hook_name}{$block_identificator}{literal} = {/literal}{$block.carousel_settings.carousel_nb}{literal};
        }
      </script>
    {/literal}
    {/if}
  {/foreach}
{/if}