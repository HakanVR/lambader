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

if (!defined('_PS_VERSION_')) {
    exit;
}

class Sampledatainstall extends Module
{
    protected $config_form = false;
    protected $send_path = false;
    public $module_path;

    public function __construct()
    {
        $this->name = 'sampledatainstall';
        $this->tab = 'export';
        $this->version = '1.0.0';
        $this->author = 'Jetimpex';
        $this->need_instance = 0;

        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->trans('Sample Data Install');
        $this->description = $this->l('Module for creating and installation of a sample data');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
        $this->module_path = $this->local_path;
    }

    public function install()
    {
        return parent::install() &&
            $this->registerHook('displayBackOfficeHeader') &&
            $this->addTab();
    }

    protected function addTab()
    {
        $tab = new Tab();
        $tab->class_name = 'AdminSampleDataInstall';
        $tab->id_parent = 0;
        $tab->module = $this->name;
        $tab->position = 100;
        $languages = Language::getLanguages(false);
        foreach ($languages as $lang)
            $tab->name[$lang['id_lang']] = 'Sample Data Install';

        if (!$tab->save())
            return false;

        $tab_id = $tab->id;

        require_once(dirname(__FILE__).'/install/install_tab.php');

        foreach ($tabvalue as $tab)
        {
            $newtab = new Tab();
            $newtab->class_name = $tab['class_name'];
            $newtab->id_parent = $tab_id;
            $newtab->module = $tab['module'];

            foreach ($languages as $l)
                $newtab->name[$l['id_lang']] = $this->l($tab['name']);

            if (!$newtab->save())
                return false;
        }

        return true;
    }

    protected function removeTab()
    {
        $tab_id = TabCore::getIdFromClassName('AdminSampleDataInstall');
        $tab = new Tab($tab_id);
        if (!$tab->delete())
            return false;

        require_once(dirname(__FILE__).'/install/uninstall_tab.php');

        foreach ($idtabs as $id)
        {
            if ($id)
            {
                $t = new Tab($id);
                if (!$t->delete())
                    return false;
            }
        }
        return true;
    }

    public function uninstall()
    {
        return parent::uninstall();
    }

    public function getContent()
    {}
    public function sendPath()
    {
        return $this->local_path;
    }
    public function getWebPath()
    {
        return $this->_path;
    }

    public static function cmp($a, $b)
    {
        return strcmp($a['id_attribute_group'], $b['id_attribute_group']);
    }

    public function hookBackOfficeHeader()
    {
        if (Tools::getValue('module_name') == $this->name) {
            $this->context->controller->addJS($this->_path.'views/js/back.js');
            $this->context->controller->addCSS($this->_path.'views/css/back.css');
        }
    }
}
