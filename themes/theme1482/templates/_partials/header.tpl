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
{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
  <nav class="header-nav">
    <div class="container">
      <div class="row">
        <div class="hidden-sm-down col-12 nav-block">
            {hook h='displayNavFullWidth'}
        </div>
        <div class="hidden-md-up text-sm-center mobile">
          <div class="nav_top text-xs-center">
            <div class="d-flex">
              <div id="menu-icon">
                <i class="flline-icons  d-inline">&#xe042;</i>
                <i class="flline-icons d-inline close-menu">&#xe01c;</i>
              </div>
              <div class="top-logo" id="_mobile_logo"></div>
            </div>
            <div id="_mobile_cart"></div>
          </div>
          <div class="nav-block">
            <div id="_mobile_currency_selector"></div>
            <div id="_mobile_language_selector"></div>
            <div id="_mobile_user_info" class="header-login-block"></div>
          </div>

        </div>
      </div>
    </div>
  </nav>
  <div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
    <div class="displayTop_menu top-level jxmegamenu_item default-menu top-global" id="_mobile_top_menu"></div>
  </div>
{/block}

{block name='header_top'}
  <div class="header-top">
    <div class="container">
      <div class="row">

        <div class="col-md-4 col-12">
          {hook h='displayNav1'}
        </div>

        <div class="col-md-4 col-12 text-center">
          <div class="hidden-sm-down" id="_desktop_logo">
            <a href="{$urls.base_url}">
              <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
            </a>
          </div>
        </div>

        <div class="col-12 text-center hidden-md-up">
          <div id="_mobile_tmsearch"></div>
        </div>

        <div class="col-md-4 col-12  text-md-right">
          {hook h='displayNav2'}
        </div>
      </div>

      <div class="row">
        <div class="col-12 position-static mt-4 text-center">
          <div class="d-flex align-items-center justify-content-center block-menu">
            {hook h='displayTop'}
          </div>
        </div>
      </div>

    </div>
  </div>
{/block}
