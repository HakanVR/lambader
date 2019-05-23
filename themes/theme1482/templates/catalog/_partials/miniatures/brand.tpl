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
{block name='brand_miniature_item'}
  <li class="brand row align-items-center align-self-stretch mb-5">
    <div class="brand-img bg_lighter text-center col-12 col-lg-3 mt-2 mb-2"><a href="{$brand.url}"><img src="{$brand.image}" alt="{$brand.name}"></a></div>
    <div class="brand-info col-12 col-lg-5 mt-2 mb-2">
      <h2><a href="{$brand.url}">{$brand.name}</a></h2>
      {$brand.text nofilter}
    </div>
    <div class="brand-products col-12 col-lg-4 mt-2 mb-2 ">
      <a class="btn btn-primary mb-1" href="{$brand.url}">{$brand.nb_products}</a>
      <a class="btn btn-secondary mb-1" href="{$brand.url}">{l s='View products' d='Shop.Theme.Actions'}</a>
    </div>
  </li>
{/block}
