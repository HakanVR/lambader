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
* @author     Jetimpex
* @copyright  2002-2017 Jetimpex
* @license    http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}

{assign var=back_page value = $link->getPageLink('index')|escape:'html':'UTF-8'}
{if $f_status || $g_status || $vk_status}
  <div class="clearfix social-login-buttons">
    {if $f_status}
      <div class="{if $g_status && $vk_status}three-elements{elseif $g_status || $vk_status}two-elements{else}one-element{/if}">
        <a class="btn btn-md btn-login-facebook" {if isset($back) && $back}href="{$link->getModuleLink('jxheaderaccount', 'facebooklogin', [], true)}" {else}href="{$link->getModuleLink('jxheaderaccount', 'facebooklogin', ['back' => $back_page], true)}"{/if} title="{l s='Login with Your Facebook Account' mod='jxheaderaccount'}">
          <span>{l s='Facebook Login' mod='jxheaderaccount'}</span>
        </a>
      </div>
    {/if}
    {if $g_status}
      <div class="{if $f_status && $vk_status}three-elements{elseif $f_status || $vk_status}two-elements{else}one-element{/if}">
        <a class="btn btn-md btn-login-google" {if isset($back) && $back}href="{$link->getModuleLink('jxheaderaccount', 'googlelogin', ['back' => $back], true)}" {else}href="{$link->getModuleLink('jxheaderaccount', 'googlelogin', ['back' => $back_page], true)}"{/if} title="{l s='Login with Your Google Account' mod='jxheaderaccount'}">
          <span>{l s='Google Login' mod='jxheaderaccount'}</span>
        </a>
      </div>
    {/if}
    {if $vk_status}
      <div class="{if $g_status && $f_status}three-elements{elseif $g_status || $f_status}two-elements{else}one-element{/if}">
        <a class="btn btn-md btn-login-vk" {if isset($back) && $back}href="{$link->getModuleLink('jxheaderaccount', 'vklogin', ['back' => $back], true)}" {else}href="{$link->getModuleLink('jxheaderaccount', 'vklogin', ['back' => $back_page], true)}"{/if} title="{l s='Login with Your VK Account' mod='jxheaderaccount'}">
          <span>{l s='VK Login' mod='jxheaderaccount'}</span>
        </a>
      </div>
    {/if}
  </div>
{/if}