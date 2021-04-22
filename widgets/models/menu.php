<?php

class menuModelWidget extends Model
{
    public function __construct(){
        parent::__construct();
    }
    
    public function getMenu($menu)
    {
        $menus['sidebar'] = array(
            array(
                'id' => 'usuarios',
                'titulo' => 'Usuarios',
                'enlace' => BASE_URL . 'usuarios',
                'imagen' => 'icon-user'
                ),
            
            array(
                'id' => 'acl',
                'titulo' => 'Listas de control de acceso',
                'enlace' => BASE_URL . 'acl',
                'imagen' => 'icon-list-alt'
                ),
            
            array(
                'id' => 'ajax',
                'titulo' => 'Ejemplo uso de AJAX',
                'enlace' => BASE_URL . 'ajax',
                'imagen' => 'icon-refresh'
                ),
            
            array(
                'id' => 'prueba',
                'titulo' => 'Prueba paginaci&oacute;n',
                'enlace' => BASE_URL . 'post/prueba',
                'imagen' => 'icon-random'
                ),
            
            array(
                'id' => 'pdf',
                'titulo' => 'Documento PDF 1',
                'enlace' => BASE_URL . 'pdf/pdf1/param1/param2',
                'imagen' => 'icon-file'
                ),
            
            array(
                'id' => 'pdf',
                'titulo' => 'Documento PDF 2',
                'enlace' => BASE_URL . 'pdf/pdf2/param1/param2',
                'imagen' => 'icon-file'
                )
        );
        
        
        $menus['top'] = array(
            array(
                'id' => 'inicio',
                'titulo' => 'Inicio',
                'enlace' => BASE_URL,
                'imagen' => 'icon-home'
                ),
            
            array(
                'id' => 'post',
                'titulo' => 'Posts',
                'enlace' => BASE_URL . 'post',
                'imagen' => 'icon-flag'
                )
        );
        
        if(!Session::get('autenticado')){
            $menus['top'][] = array(
                'id' => 'registro',
                'titulo' => 'Registro',
                'enlace' => BASE_URL . 'usuarios/registro',
                'imagen' => 'icon-book'
                );
        }
        
        return $menus[$menu];
    }
}

?>