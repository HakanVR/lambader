<?php
/**
 * 2002-2017 Jetimpex
 *
 * JX Media Parallax
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

$sql = array();

$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'jxmediaparallax`';

$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'jxmediaparallax_lang`';

$sql[] = 'DROP TABLE IF EXISTS`'._DB_PREFIX_.'jxmediaparallax_layouts`';

$sql[] = 'DROP TABLE IF EXISTS`'._DB_PREFIX_.'jxmediaparallax_layouts_lang`';

foreach ($sql as $query) {
    if (Db::getInstance()->execute($query) == false) {
        return false;
    }
}
