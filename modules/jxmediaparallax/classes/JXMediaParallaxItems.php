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

if (!defined('_PS_VERSION_')) {
    exit;
}

class JXMediaParallaxItems extends ObjectModel
{
    public $id_item;
    public $id_shop;
    public $selector;
    public $active;
    public $speed = 0;
    public $fade;
    public $inverse;
    public $offset = 0;
    public $full_width;
    public $content;

    public static $definition = array(
        'table' => 'jxmediaparallax',
        'primary' => 'id_item',
        'multilang' => true,
        'fields' => array(
            'id_shop' => array('type' => self::TYPE_INT, 'required' => true, 'validate' => 'isunsignedInt'),
            'selector' => array('type' => self::TYPE_STRING, 'validate' => 'isGenericName', 'size' => 128),
            'speed' => array('type' => self::TYPE_FLOAT, 'validate' => 'isFloat', 'size' => 128),
            'offset' => array('type' => self::TYPE_INT, 'validate' => 'isInt'),
            'inverse' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'fade' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'full_width' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'content' => array('type' => self::TYPE_HTML, 'lang' => true, 'validate' => 'isCleanHtml', 'size' => 4000)
        ),
    );

    /**
     * Get all items by shop
     * 
     * @param int $id_shop
     * @param bool $only_active
     * @return array items
     */
    public static function getItems($id_shop, $only_active = false)
    {
        $sql = 'SELECT *
                FROM ' . _DB_PREFIX_ . 'jxmediaparallax jxmp
                JOIN ' . _DB_PREFIX_ . 'jxmediaparallax_lang jxmpl
                ON jxmp.id_item = jxmpl.id_item
                AND jxmpl.id_lang = '. Context::getContext()->language->id.'
                AND jxmp.id_shop = '. $id_shop;
        if ($only_active) {
            $sql .= ' AND `active` = 1';
        }

        if (!JXMediaParallaxItems::checkTable() || !$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql)) {
            return array();
        }

        return $result;
    }

    public function delete()
    {
        if (!JXMediaParallaxLayouts::deleteByParent($this->id_item)) {
            return false;
        }
        return parent::delete();
    }

    public static function checkTable()
    {
        $sql = 'SHOW TABLES';

        $result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

        foreach ($result as $table) {
            if (in_array(_DB_PREFIX_ .'jxmediaparallax', $table)) {
                return true;
            }
        }

        return false;
    }

    public static function addLang($id_lang, $id_item)
    {
        if (!JXMediaParallaxLayouts::checkLang($id_lang, $id_item)) {
            $table = 'jxmediaparallax_lang';
            $data = array(
                'id_item' => $id_item,
                'id_lang' => $id_lang,
                'content' => ''
            );

            if (!$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->insert($table, $data)) {
                return false;
            }

            return $result;
        }
    }

    public static function checkLang($id_lang, $id_item)
    {
        $sql = 'SELECT *
                FROM ' . _DB_PREFIX_ . 'jxmediaparallax_lang 
                WHERE id_lang = '. $id_lang . '
                AND id_item ='. (int) $id_item;

        if (!$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql)) {
            return false;
        }

        return true;
    }
}
