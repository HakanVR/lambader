{*
* 2002-2017 Jetimpex
*
* Jetimpex Social Login
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

{if $f_status || $g_status || $vk_status}
  <div class="clearfix social-login-buttons">
    {if $f_status}
      <div class="{if $g_status && $vk_status}three-elements{elseif $g_status || $vk_status}two-elements{else}one-element{/if}">
        <a class="btn btn-md btn-login-facebook" href="{$link->getModuleLink('jxheaderaccount', 'facebooklogin', [], true)}" title="{l s='Register with Your Facebook Account' mod='jxheaderaccount'}">
          <span>{l s='Register with Your Facebook Account' mod='jxheaderaccount'}</span>
        </a>
      </div>
    {/if}
    {if $g_status}
      <div class="{if $f_status && $vk_status}three-elements{elseif $f_status || $vk_status}two-elements{else}one-element{/if}">
        <a class="btn btn-md btn-login-google" {if isset($back) && $back}href="{$link->getModuleLink('jxheaderaccount', 'googlelogin', ['back' => $back], true)}" {else}href="{$link->getModuleLink('jxheaderaccount', 'googlelogin', [], true)}"{/if} title="{l s='Register with Your Google Account' mod='jxheaderaccount'}">
          <span>{l s='Register with Your Google Account' mod='jxheaderaccount'}</span>
        </a>
      </div>
    {/if}
    {if $vk_status}
      <div class="{if $g_status && $f_status}three-elements{elseif $g_status || $f_status}two-elements{else}one-element{/if}">
        <a class="btn btn-md btn-login-vk" {if isset($back) && $back}href="{$link->getModuleLink('jxheaderaccount', 'vklogin', ['back' => $back], true)}" {else}href="{$link->getModuleLink('jxheaderaccount', 'vklogin', [], true)}"{/if} title="{l s='Register with Your VK Account' mod='jxheaderaccount'}">
          <span>{l s='Register with Your VK Account' mod='jxheaderaccount'}</span>
        </a>
      </div>
    {/if}
  </div>
{/if}
