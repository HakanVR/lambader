/*
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
*/

$(document).ready(function(e) {
  jxwl_row_4 = '';
  jxwl_row_4 += '<li class="jxwl_popup_item col-12 jxwl_row_4">';
    jxwl_row_4 += '<div class="popup_store_logo"><img class="logo img-responsive" src="'+logo_url+'" /></div>';
    jxwl_row_4 += '<h5></h5>';
    jxwl_row_4 += '<ul id="jxwl_row_4" class="clearfix jxwl_row_4 items">';
      jxwl_row_4 += '<li><div class="content"></div></li>';
      jxwl_row_4 += '<li><div class="content"></div></li>';
      jxwl_row_4 += '<li><div class="content"></div></li>';
      jxwl_row_4 += '<li><div class="content"></div></li>';
	  jxwl_row_4 += '<li><div class="content"></div></li>';
    jxwl_row_4 += '</ul>';
  jxwl_row_4 += '</li>';
  jxwl_row_4 += '<input type="hidden" name="id_layout" value="4" />';
  jxwl_layouts.push({name : 'jxwl_row_4', value : jxwl_row_4});
});