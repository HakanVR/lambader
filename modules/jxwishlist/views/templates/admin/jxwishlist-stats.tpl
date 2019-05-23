{*
* 2002-2017 Jetimpex
*
* JX Wishlist
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
*  @copyright 2002-2017 Jetimpex
*  @license   http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}

<div class="panel-heading">
  {$display_name|escape:'htmlall':'UTF-8'}
</div>
{$engine_params|escape:'quotes':'UTF-8'}
<a class="btn btn-default export-csv" href="{$export_url|escape:'quotes':'UTF-8'}">
  <i class="icon-cloud-upload"></i>
  {l s='CSV Export' mod='jxwishlist'}
</a>