<?php

require_once ROOT . 'libs' . DS . 'smarty' . DS . 'libs' . DS . 'Smarty.class.php';

class View extends Smarty
{
    private $_request;
    private $_js;
    private $_acl;
    private $_rutas;
    private $_jsPlugin;
    private $_template;
    private static $_item;
    private $_widget;
    
    public function __construct(Request $peticion, ACL $_acl) 
    {
        parent::__construct();
        $this->_request = $peticion;
        $this->_js = array();
        $this->_acl = $_acl;
        $this->_rutas = array();
        $this->_jsPlugin = array();
        $this->_template = DEFAULT_LAYOUT;
        self::$_item = null;
        
        $modulo = $this->_request->getModulo();
        $controlador = $this->_request->getControlador();
        
        if($modulo){
            $this->_rutas['view'] = ROOT . 'modules' . DS . $modulo . DS . 'views' . DS . $controlador . DS;
            $this->_rutas['js'] = BASE_URL . 'modules/' . $modulo . '/views/' . $controlador . '/js/';
        }
        else{
            $this->_rutas['view'] = ROOT . 'views' . DS . $controlador . DS;
            $this->_rutas['js'] = BASE_URL . 'views/' . $controlador . '/js/';
        }
    }
    
    public static function getViewId()
    {
        return self::$_item;
    }


    public function renderizar($vista, $item = false, $noLayout = false)
    {
        if($item){
            self::$_item = $item;
        }
        
        $this->template_dir = ROOT . 'views' . DS . 'layout'. DS . $this->_template . DS;
        $this->config_dir = ROOT . 'views' . DS . 'layout' . DS . $this->_template . DS . 'configs' . DS;
        $this->cache_dir = ROOT . 'tmp' . DS .'cache' . DS;
        $this->compile_dir = ROOT . 'tmp' . DS .'template' . DS;
        
        $_params = array(
            'ruta_css' => BASE_URL . 'views/layout/' . $this->_template . '/css/',
			'ruta_principal' => BASE_URL . 'views/layout/' . $this->_template . '/',
			'ruta_controlador' => BASE_URL . '',
            'ruta_img' => BASE_URL . 'views/layout/' . $this->_template . '/img/',
            'ruta_js' => BASE_URL . 'views/layout/' . $this->_template . '/js/',
            'js' => $this->_js,
            'js_plugin' => $this->_jsPlugin,
            'root' => BASE_URL,
            'configs' => array(
                'app_name' => APP_NAME,
                'app_slogan' => APP_SLOGAN,
                'url_web' => URL_WEB
            )
        );
                
        if(is_readable($this->_rutas['view'] . $vista . '.tpl')){
            if($noLayout){
                $this->template_dir = $this->_rutas['view'];
                $this->display($this->_rutas['view'] . $vista . '.tpl');
                exit;
            }

            $this->assign('_contenido', $this->_rutas['view'] . $vista . '.tpl');
			$this->assign('_vmodal', ROOT . 'views' . DS . 'modal' . DS . 'index' . '.tpl');
			$this->assign('_vmensajes', ROOT . 'views' . DS . 'mensajes' . DS . 'index' . '.tpl');
			$this->assign('_vsidebar', ROOT . 'views' . DS . 'sidebar' . DS . 'index' . '.tpl');
        } 
        else {
            throw new Exception('Error de vista');
        }
        
        $this->assign('widgets', $this->getWidgets());
        $this->assign('_acl', $this->_acl);
        $this->assign('_layoutParams', $_params);

		$validateView = explode("/", $_GET['url']);
		if($validateView[0] == 'docs' 
		&& $validateView[1] == 'ver')
			$this->display('codef.tpl');
		else
			$this->display('template.tpl');
    }
    
    public function setJs(array $js)
    {
        if(is_array($js) && count($js)){
            for($i=0; $i < count($js); $i++){
                $this->_js[] = $this->_rutas['js'] . $js[$i] . '.js';
            }
        } 
        else {
            throw new Exception('Error de js');
        }
    }
    
    public function setJsPlugin(array $js)
    {
        if(is_array($js) && count($js)){
            for($i=0; $i < count($js); $i++){
                $this->_jsPlugin[] = BASE_URL . 'public/js/' .  $js[$i] . '.js';
            }
        } 
        else {
            throw new Exception('Error de js plugin');
        }
    }
    
    public function setTemplate($template)
    {
        $this->_template = (string) $template;
    }
    
    public function widget($widget, $method, $options = array())
    {
        if(!is_array($options)){
            $options = array($options);
        }
        
        if(is_readable(ROOT . 'widgets' . DS . $widget . '.php')){
            include_once ROOT . 'widgets' . DS . $widget . '.php';
            
            $widgetClass = $widget . 'Widget';
            
            if(!class_exists($widgetClass)){
                throw new Exception('Error clase widget');
            }
            
            if(is_callable($widgetClass, $method)){
                if(count($options)){
                    return call_user_func_array(array(new $widgetClass, $method), $options);
                }
                else{
                    return call_user_func(array(new $widgetClass, $method));
                }
            }
            
            throw new Exception('Error metodo widget');
        }
        
        throw new Exception('Error de widget');
    }
    
    public function getLayoutPositions()
    {
        if(is_readable(ROOT . 'views' . DS . 'layout' . DS . $this->_template . DS . 'configs.php')){
            include_once ROOT . 'views' . DS . 'layout' . DS . $this->_template . DS . 'configs.php';
            
            return get_layout_positions();
        }
        
        throw new Exception('Error configuracion layout');
    }
    
    private function getWidgets()
    {
        $widgets = array(
            'menu-sidebar' => array(
                'config' => $this->widget('menu', 'getConfig', array('sidebar')),
                'content' => array('menu', 'getMenu', array('sidebar', 'sidebar'))
            ),
            'menu-top' => array(
                'config' => $this->widget('menu', 'getConfig', array('top')),
                'content' => array('menu', 'getMenu', array('top', 'top'))
            )
        );
        
        $positions = $this->getLayoutPositions();
        $keys = array_keys($widgets);
        
        foreach($keys as $k){
            /* verificar si la posicion del widget esta presente */
            if(isset($positions[$widgets[$k]['config']['position']])){
                /* verificar si esta deshabilitado para la vista */ 
                if(!isset($widgets[$k]['config']['hide']) || !in_array(self::$_item, $widgets[$k]['config']['hide'])){
                    /* verificar si esta habilitado para la vista */
                    if($widgets[$k]['config']['show'] === 'all' || in_array(self::$_item, $widgets[$k]['config']['show'])){
                        if(isset($this->_widget[$k]))
                        {
                            $widgets[$k]['content'][2] = $this->_widget[$k];
                        }
                        
                        /* llenar la posicion del layout */
                        $positions[$widgets[$k]['config']['position']][] = $this->getWidgetContent($widgets[$k]['content']);
                    }
                }
            }
        }
        
        return $positions;
    }
    
    public function getWidgetContent(array $content)
    {
        if(!isset($content[0]) || !isset($content[1])){
            throw new Exception('Error contenido widget');
            return;
        }
        
        if(!isset($content[2])){
            $content[2] = array();
        }
        
        return $this->widget($content[0],$content[1],$content[2]);
    }
    
    public function setWidgetOptions($key, $options)
    {
        $this->_widget[$key] = $options;
    }
}

?>
