<?php
/**
* 2002-2017 Jetimpex
*
* Sampledatainstall
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
*  @author    Jetimpex (Alexander Grosul)
*  @copyright 2002-2017 Jetimpex
*  @license   http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*/

$this->defaultTablesList = array(
	'admin_filter',
	'access',
	'accessory',
	'address',
	'address_format',
	'advice',
	'advice_lang',
	'alias',
	'attachment',
	'attachment_lang',
	'attribute',
	'attribute_group',
	'attribute_group_lang',
	'attribute_group_shop',
	'attribute_impact',
	'attribute_lang',
	'attribute_shop',
	'authorization_role',
	'badge',
	'badge_lang',
	'blocklink',
	'blocklink_lang',
	'blocklink_shop',
	'carrier',
	'carrier_group',
	'carrier_lang',
	'carrier_shop',
	'carrier_tax_rules_group_shop',
	'carrier_zone',
	'cart',
	'cart_cart_rule',
	'cart_product',
	'cart_rule',
	'cart_rule_carrier',
	'cart_rule_combination',
	'cart_rule_country',
	'cart_rule_group',
	'cart_rule_lang',
	'cart_rule_product_rule',
	'cart_rule_product_rule_group',
	'cart_rule_product_rule_value',
	'cart_rule_shop',
	'category',
	'category_group',
	'category_lang',
	'category_product',
	'category_shop',
	'cms',
	'cms_block',
	'cms_block_lang',
	'cms_block_page',
	'cms_block_shop',
	'cms_category',
	'cms_category_lang',
	'cms_category_shop',
	'cms_lang',
	'cms_shop',
	'cms_role',
	'cms_role_lang',
	'compare',
	'compare_product',
	'condition',
	'condition_advice',
	'condition_badge',
	'configuration',
	'configuration_kpi',
	'configuration_kpi_lang',
	'configuration_lang',
	'connections',
	'connections_page',
	'connections_source',
	'contact',
	'contact_lang',
	'contact_shop',
	'country',
	'country_lang',
	'country_shop',
	'cronjobs',
	'currency',
	'currency_shop',
	'customer',
	'customer_group',
	'customer_message',
	'customer_message_sync_imap',
	'customer_thread',
	'customization',
	'customization_field',
	'customization_field_lang',
	'customized_data',
	'date_range',
	'delivery',
	'editorial',
	'editorial_lang',
	'emailsubscription',
	'employee',
	'employee_shop',
	'favorite_product',
	'feature',
	'feature_lang',
	'feature_product',
	'feature_shop',
	'feature_value',
	'feature_value_lang',
	'gender',
	'gender_lang',
	'group',
	'group_lang',
	'group_reduction',
	'group_shop',
	'guest',
	'help_access',
	'homeslider',
	'homeslider_slides',
	'homeslider_slides_lang',
	'hook',
	'hook_alias',
	'hook_module',
	'hook_module_exceptions',
	'image',
	'image_lang',
	'image_shop',
	'image_type',
	'import_match',
	'info',
	'info_lang',
	'lang',
	'lang_shop',
	'layered_category',
	'layered_filter',
	'layered_filter_shop',
	'layered_friendly_url',
	'layered_indexable_attribute_group',
	'layered_indexable_attribute_group_lang_value',
	'layered_indexable_attribute_lang_value',
	'layered_indexable_feature',
	'layered_indexable_feature_lang_value',
	'layered_indexable_feature_value_lang_value',
	'layered_price_index',
	'layered_product_attribute',
	'linksmenutop',
	'linksmenutop_lang',
	'log',
	'loyalty',
	'loyalty_history',
	'loyalty_state',
	'loyalty_state_lang',
	'mail',
	'manufacturer',
	'manufacturer_lang',
	'manufacturer_shop',
	'memcached_servers',
	'message',
	'message_readed',
	'meta',
	'meta_lang',
	'module',
	'module_access',
	'module_carrier',
	'module_country',
	'module_currency',
	'module_group',
	'module_history',
	'module_preference',
	'modules_perfs',
	'module_shop',
	'newsletter',
	'operating_system',
	'orders',
	'order_carrier',
	'order_cart_rule',
	'order_detail',
	'order_detail_tax',
	'order_history',
	'order_invoice',
	'order_invoice_payment',
	'order_invoice_tax',
	'order_message',
	'order_message_lang',
	'order_payment',
	'order_return',
	'order_return_detail',
	'order_return_state',
	'order_return_state_lang',
	'order_slip',
	'order_slip_detail',
	'order_slip_detail_tax',
	'order_state',
	'order_state_lang',
	'pack',
	'page',
	'pagenotfound',
	'page_type',
	'page_viewed',
	'product',
	'product_attachment',
	'product_attribute',
	'product_attribute_combination',
	'product_attribute_image',
	'product_attribute_shop',
	'product_carrier',
	'product_comment',
	'product_comment_criterion',
	'product_comment_criterion_category',
	'product_comment_criterion_lang',
	'product_comment_criterion_product',
	'product_comment_grade',
	'product_comment_report',
	'product_comment_usefulness',
	'product_country_tax',
	'product_download',
	'product_group_reduction_cache',
	'product_lang',
	'product_sale',
	'product_shop',
	'product_supplier',
	'product_tag',
	'profile',
	'profile_lang',
	'quick_access',
	'quick_access_lang',
	'range_price',
	'range_weight',
	'reassurance',
	'reassurance_lang',
	'referralprogram',
	'referrer',
	'referrer_cache',
	'referrer_shop',
	'reinsurance',
	'reinsurance_lang',
	'request_sql',
	'required_field',
	'risk',
	'risk_lang',
	'scene',
	'scene_category',
	'scene_lang',
	'scene_products',
	'scene_shop',
	'search_engine',
	'search_index',
	'search_word',
	'sekeyword',
	'shop',
	'shop_group',
	'shop_url',
	'smarty_cache',
	'specific_price',
	'specific_price_priority',
	'specific_price_rule',
	'specific_price_rule_condition',
	'specific_price_rule_condition_group',
	'state',
	'statssearch',
	'stock',
	'stock_available',
	'stock_mvt',
	'stock_mvt_reason',
	'stock_mvt_reason_lang',
	'store',
	'store_shop',
	'supplier',
	'supplier_lang',
	'supplier_shop',
	'supply_order',
	'supply_order_detail',
	'supply_order_history',
	'supply_order_receipt_history',
	'supply_order_state',
	'supply_order_state_lang',
	'smarty_last_flush',
	'smarty_lazy_cache',
	'tag_count',
	'tab',
	'tab_advice',
	'tab_lang',
	'tab_module_preference',
	'tag',
	'tax',
	'tax_lang',
	'tax_rule',
	'tax_rules_group',
	'tax_rules_group_shop',
	'theme',
	'theme_meta',
	'theme_specific',
	'timezone',
	'jxmegalayout',
	'jxmegalayout_items',
	'translation',
	'warehouse',
	'warehouse_carrier',
	'warehouse_product_location',
	'warehouse_shop',
	'webservice_account',
	'webservice_account_shop',
	'webservice_permission',
	'web_browser',
	'wishlist',
	'wishlist_email',
	'wishlist_product',
	'wishlist_product_cart',
	'zone',
	'zone_shop'
);