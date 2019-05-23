{*
* 2002-2017 Jetimpex
*
* JX Header Account
*
* NOTICE OF LICENSE
*
* This source file is subject to the General Public License (GPL 2.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/GPL-2.0

* @author     Jetimpex (Alexander Grosul)
* @copyright  2002-2017 Jetimpex
* @license    http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}
<div id="_desktop_user_info">
  <div class="header_user_info user-info current">
    <a href="#" onclick="return false;"{if $configs.JXHEADERACCOUNT_DISPLAY_TYPE == 'dropdown'} class="dropdown"{/if}>
      {if $customer.is_logged}
        {l s='Your Account' mod='jxheaderaccount'}
      {else}
        {l s='Sign in' mod='jxheaderaccount'}
      {/if}
    </a>
  </div>
  {if $configs.JXHEADERACCOUNT_DISPLAY_TYPE == 'dropdown'}
    {if "./jxheaderaccount-content.tpl"|file_exists}
      {include file="./jxheaderaccount-content.tpl"}
    {else}
      {include file="../default/jxheaderaccount-content.tpl"}
    {/if}
  {else}
    {if "./jxheaderaccount-content.tpl"|file_exists}
      {assign var="content" value="{include file="./jxheaderaccount-content.tpl"}"}
    {else}
      {assign var="content" value="{include file="../default/jxheaderaccount-content.tpl"}"}
    {/if}
  {/if}
</div>
{if isset($content)}
  <script>
    JXHEADERACCOUNT_CONTENT = "{$content|escape:'javascript' nofilter}";
  </script>
{/if}