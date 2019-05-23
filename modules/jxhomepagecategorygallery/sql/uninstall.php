<?php
/**
* 2002-2016 Jetimpex
*
* JX Homepage Category Gallery
*
* NOTICE OF LICENSE
*
* This source file is subject to the General Public License (GPL 2.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/GPL-2.0
*
*  @author    Jetimpex (Alexander Grosul)
*  @copyright 2002-2016 Jetimpex
*  @license   http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*/

$sql = array();

$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'jxhomepagecategorygallery`';

$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'jxhomepagecategorygallery_shop`';

$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'jxhomepagecategorygallery_lang`';

foreach ($sql as $query) {
    if (Db::getInstance()->execute($query) == false) {
        return false;
    }
}
