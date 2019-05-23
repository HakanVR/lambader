{*
* 2002-2017 Jetimpex
*
* JX Search
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

<div  class="col-sm-6 col-lg-7 clearfix">
	<div id="jxsearchblock">
		<form id="jxsearchbox" method="get" action="{Jxsearch::getJXSearchLink('jxsearch')|escape:'htmlall':'UTF-8'}" >
			{if !Configuration::get('PS_REWRITING_SETTINGS')}
				<input type="hidden" name="fc" value="module" />
				<input type="hidden" name="controller" value="jxsearch" />
				<input type="hidden" name="module" value="jxsearch" />
			{/if}
			<select name="search_categories" class="form-control">
				{foreach from=$search_categories item=category}
					<option {if isset($active_category) && $active_category == $category.id}selected="selected"{/if} value="{$category.id|escape:'htmlall':'UTF-8'}">{if $category.id == 2}{l s='All Categories' mod='jxsearch'}{else}{$category.name|escape:'htmlall':'UTF-8'}{/if}</option>
				{/foreach}
			</select>
			<input class="jx_search_query form-control" type="text" id="jx_search_query" name="search_query" placeholder="{l s='Search' mod='jxsearch'}" value="{if isset($search_query)}{$search_query|escape:'htmlall':'UTF-8'|stripslashes}{/if}" />
			<button type="submit" name="jx_submit_search" class="btn btn-default button-search">
				<span>{l s='Search' mod='jxsearch'}</span>
			</button>
		</form>
	</div>
</div>