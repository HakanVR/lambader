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

<ul class="header-login-content toogle_content{if $customer.is_logged} is-logged{/if}">
  {if $customer.is_logged}
    <li {if $hook == 'displayNav2'}class="{$configs.JXHEADERACCOUNT_DISPLAY_STYLE|escape:'quotes':'UTF-8'}"{/if}>
      <ul>
        <li class="user-data">
          {if $configs.JXHEADERACCOUNT_USE_AVATAR}
            <img src="{$avatar}" alt=""{if $hook == 'displayNav'} width="{if $configs.JXHEADERACCOUNT_DISPLAY_STYLE == "twocolumns"}150{else}90{/if}"{/if}>
          {/if}
          <p><span>{$firstname}</span> <span>{$lastname}</span></p>
        </li>
        <li>
          <a href="{$link->getPageLink('history', true)|escape:'htmlall':'UTF-8'}" title="{l s='My orders' mod='jxheaderaccount'}" rel="nofollow">
            {l s='My orders' mod='jxheaderaccount'}
          </a>
        </li>
        {if $returnAllowed}
          <li>
            <a href="{$link->getPageLink('order-follow', true)|escape:'htmlall':'UTF-8'}" title="{l s='My returns' mod='jxheaderaccount'}" rel="nofollow">
              {l s='My merchandise returns' mod='jxheaderaccount'}
            </a>
          </li>
        {/if}
        <li>
          <a href="{$link->getPageLink('order-slip', true)|escape:'htmlall':'UTF-8'}" title="{l s='My credit slips' mod='jxheaderaccount'}" rel="nofollow">
            {l s='My credit slips' mod='jxheaderaccount'}
          </a>
        </li>
        <li>
          <a href="{$link->getPageLink('addresses', true)|escape:'htmlall':'UTF-8'}" title="{l s='My addresses' mod='jxheaderaccount'}" rel="nofollow">
            {l s='My addresses' mod='jxheaderaccount'}
          </a>
        </li>
        <li>
          <a href="{$link->getPageLink('identity', true)|escape:'htmlall':'UTF-8'}" title="{l s='Manage my personal information' mod='jxheaderaccount'}" rel="nofollow">
            {l s='My personal info' mod='jxheaderaccount'}
          </a>
        </li>
        {if $voucherAllowed}
          <li>
            <a href="{$link->getPageLink('discount', true)|escape:'htmlall':'UTF-8'}" title="{l s='My vouchers' mod='jxheaderaccount'}" rel="nofollow">
              {l s='My vouchers' mod='jxheaderaccount'}
            </a>
          </li>
        {/if}
        {if $f_status}
          <li>
            <a href="{$link->getModuleLink('jxheaderaccount', 'facebooklink', [], true)}" title="{l s='Facebook Login Manager' mod='jxheaderaccount'}">
        <span class="link-item">
          <i class="material-icons"></i>
          {if !$facebook_id}{l s='Connect With Facebook' mod='jxheaderaccount'}{else}{l s='Facebook Login Manager' mod='jxheaderaccount'}{/if}
        </span>
            </a>
          </li>
        {/if}
        {if $g_status}
          <li>
            <a {if isset($back) && $back}href="{$link->getModuleLink('jxheaderaccount', 'googlelogin', ['back' => $back], true)}" {else}href="{$link->getModuleLink('tmheaderaccount', 'googlelogin', [], true)}"{/if} title="{l s='Google Login Manager' mod='tmheaderaccount'}">
        <span class="link-item">
          <i class="material-icons"></i>
          {if !$google_id}{l s='Connect With Google' mod='jxheaderaccount'}{else}{l s='Google Login Manager' mod='jxheaderaccount'}{/if}
        </span>
            </a>
          </li>
        {/if}
        {if $vk_status}
          <li>
            <a {if isset($back) && $back}href="{$link->getModuleLink('jxheaderaccount', 'vklogin', ['back' => $back], true)}" {else}href="{$link->getModuleLink('tmheaderaccount', 'vklogin', [], true)}"{/if} title="{l s='VK Login Manager' mod='tmheaderaccount'}">
        <span class="link-item">
          <i class="material-icons"></i>
          {if !$vkcom_id}{l s='Connect With VK' mod='jxheaderaccount'}{else}{l s='VK Login Manager' mod='jxheaderaccount'}{/if}
        </span>
            </a>
          </li>
        {/if}
      </ul>
      <p class="logout">
        <a class="btn btn-default btn-md" href="{$link->getPageLink('index')|escape:'html':'UTF-8'}?mylogout" title="{l s='Sign out' mod='jxheaderaccount'}" rel="nofollow">
          <i class="fa fa-unlock left"></i>
          {l s='Sign out' mod='jxheaderaccount'}
        </a>
      </p>
    </li>
  {else}
    <li class="login-content">
      <form action="{$link->getPageLink('authentication', true)|escape:'html':'UTF-8'}" method="post">
        <div class="form_content clearfix">
          {assign value=$login_form.formFields var="formFields"}
          {include file="./_partials/form.tpl"}
          <p class="submit">
            <button type="submit" name="HeaderSubmitLogin" class="btn btn-default btn-md">
              <i class="fa fa-lock left"></i>
              {l s='Sign in' mod='jxheaderaccount'}
            </button>
          </p>
          <p>
            <a href="{$link->getPageLink('my-account', true)|escape:'htmlall':'UTF-8'}" class="create btn btn-primary btn-md">
              {l s='Create an account' mod='jxheaderaccount'}
            </a>
          </p>
          <p>
            <a href="{$link->getPageLink('password', 'true')|escape:'html':'UTF-8'}" class="forgot-password">
              {l s='Forgot your password?' mod='jxheaderaccount'}
            </a>
          </p>
          {hook h="displayHeaderLoginButtons"}
        </div>
      </form>
    </li>
    <li class="create-account-content hidden">
      <div class="alert alert-danger" style="display:none;"></div>
      <form action="{$link->getPageLink('authentication', true)|escape:'html':'UTF-8'}" method="post" class="std">
        {hook h='HOOK_CREATE_ACCOUNT_TOP'}
        <div class="account_creation">
          <div class="clearfix">
            {assign value=$register_form.formFields var="formFields"}
            {include file="./_partials/form.tpl"}
          </div>
        </div>
        {$HOOK_CREATE_ACCOUNT_FORM}
        <div class="submit clearfix">
          <input type="hidden" name="email_create" value="1"/>
          <input type="hidden" name="is_new_customer" value="1"/>
          <input type="hidden" class="hidden" name="back" value="my-account"/>
          <p class="submit">
            <button type="submit" name="submitAccount" class="btn btn-default btn-md">
            <span>
              {l s='Register' mod='jxheaderaccount'}
            </span>
            </button>
          </p>
          <p>
            <a href="#" class="btn btn-primary btn-md signin"><span>{l s='Sign in' mod='jxheaderaccount'}</span></a>
          </p>
        </div>
      </form>
    </li>
    <li class="forgot-password-content hidden">
      <p>{l s='Please enter the email address you used to register. We will then send you a new password. ' mod='jxheaderaccount'}</p>
      <form action="{$request_uri|escape:'html':'UTF-8'}" method="post" class="std">
        <fieldset>
          <div class="form-group">
            <div class="alert alert-success" style="display:none;"></div>
            <div class="alert alert-danger" style="display:none;"></div>
            <label for="email-forgot">{l s='Email address' mod='jxheaderaccount'}</label>
            <input class="form-control" type="email" name="email" id="email-forgot" value="{if isset($smarty.post.email)}{$smarty.post.email|escape:'html':'UTF-8'|stripslashes}{/if}"/>
          </div>
          <p class="submit">
            <button type="submit" class="btn btn-default btn-md">
            <span>
              {l s='Retrieve Password' mod='jxheaderaccount'}
            </span>
            </button>
          </p>
          <p>
            <a href="#" class="btn btn-primary btn-md signin"><span>{l s='Sign in' mod='jxheaderaccount'}</span></a>
          </p>
        </fieldset>
      </form>
    </li>
  {/if}
</ul>