<?php

class configuracionModel extends Model
{
	public function __construct() {
		parent::__construct();
		$this->TablaConfig = 'cdl_config_img';
		$this->TablaCempresa = 'cdl_config_empresa';

		$this->id_empresa = Session::get('id_empresa');
	}

	public function insertarConfig($nombre_negocio, $nit_rut, $nombre_contacto, $direccion, $regimen, $telefono
									, $email, $codigo_pais, $moneda, $zona_horaria)
	{
		$estado = 1;
		$sth = $this->_db->prepare("INSERT INTO " . $this->TablaCempresa
		. " VALUES (NULL, :nombre_negocio, :telefono, :nit_rut, :email, :nombre_contacto, "
		. " :codigo_pais, :direccion, :moneda, :regimen, :zona_horaria, :estado, NULL)");
		$sth->bindParam(':nombre_negocio', $nombre_negocio, PDO::PARAM_STR);
		$sth->bindParam(':nit_rut', $nit_rut, PDO::PARAM_STR);
		$sth->bindParam(':nombre_contacto', $nombre_contacto, PDO::PARAM_STR);
		$sth->bindParam(':direccion', $direccion, PDO::PARAM_STR);
		$sth->bindParam(':regimen', $regimen, PDO::PARAM_STR);
		$sth->bindParam(':telefono', $telefono, PDO::PARAM_STR);
		$sth->bindParam(':email', $email, PDO::PARAM_STR);
		$sth->bindParam(':codigo_pais', $codigo_pais, PDO::PARAM_STR);
		$sth->bindParam(':moneda', $moneda, PDO::PARAM_STR);
		$sth->bindParam(':zona_horaria', $zona_horaria, PDO::PARAM_STR);
		$sth->bindParam(':estado', $estado, PDO::PARAM_INT);
		$sth->execute();

		//print_r($sth->errorInfo());
	}

	public function getImagen()
	{
		$consulta = $this->_db->query(
			"SELECT file_name FROM " . $this->TablaConfig
			. " WHERE id_empresa = " . $this->id_empresa
			. " ORDER BY id DESC LIMIT 1"
		);

		$response = $consulta->Fetch();

		if($response["file_name"]){
			$consulta = $response["file_name"];
		}else{
			$consulta = 0;
		}

		return $consulta;
	}

	public function insertarImagen($imagen)
	{
		$sth = $this->_db->prepare("INSERT INTO " . $this->TablaConfig
		. " VALUES (NULL, :nombre_imagen, :id_empresa, NULL)");
		$sth->bindParam(':nombre_imagen', $imagen, PDO::PARAM_STR);
		$sth->bindParam(':id_empresa', $this->id_empresa, PDO::PARAM_INT);
		$sth->execute();

		//print_r($sth->errorInfo());
	}
}

?>
