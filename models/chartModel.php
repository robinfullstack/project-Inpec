<?php

class chartModel extends Model
{
	public function __construct() {
		parent::__construct();
		$this->TablaNotas = 'cdl_notas';

		$this->id_empresa = Session::get('id_empresa');
	}

	public function desactivarNota($id_notas)
	{
		$this->_db->prepare("UPDATE " . $this->TablaNotas .
			" SET estado = 0 " .
			" WHERE id_notas = :id_notas" .
			" AND id_empresa = :id_empresa"
			)
		->execute(
			array(
			':id_notas' => $id_notas,
			':id_empresa' => $this->id_empresa
			)
		);
	}

	public function tiempoTranscurrido($fechaInicio, $fechaFin)
	{
		$fecha1 = new DateTime($fechaInicio);
		$fecha2 = new DateTime($fechaFin);
		$fecha = $fecha1->diff($fecha2);
		$tiempo = "";

		//años
		if($fecha->y > 0)
		{
			$tiempo .= $fecha->y;
				 
			if($fecha->y == 1)
				$tiempo .= " año ";
			else
				$tiempo .= " años ";
		}

		//meses
		if($fecha->m > 0 and $fecha->y <= 0)
		{
			$tiempo .= $fecha->m;
				 
			if($fecha->m == 1)
				$tiempo .= " mes ";
			else
				$tiempo .= " meses ";
		}
			 
		//dias
		if($fecha->d > 0 and $fecha->y <= 0 and $fecha->m <= 0)
		{
			$tiempo .= $fecha->d;
				 
			if($fecha->d == 1)
				$tiempo .= " día ";
			else
				$tiempo .= " días ";
		}
			 
		//horas
		if($fecha->h > 0  and $fecha->d <= 0)
		{
			$tiempo .= $fecha->h;
				 
			if($fecha->h == 1)
				$tiempo .= " hora ";
			else
				$tiempo .= " horas ";
		}

		//minutos
		if($fecha->i > 0 and $fecha->h <= 0)
		{
			$tiempo .= $fecha->i;
				 
			if($fecha->i == 1)
				$tiempo .= " minuto";
			else
				$tiempo .= " minutos";
		}
		else if($fecha->i == 0) //segundos
			$tiempo .= $fecha->s." segundos";

		return $tiempo;
	}

	public function registroNota($titulo, $descripcion, $prioridad)
	{
		$sth = $this->_db->prepare("INSERT INTO " . $this->TablaNotas
		. " VALUES (NULL, :id_empresa, :titulo, :descripcion, :prioridad, 1, NULL)");
		$sth->bindParam(':id_empresa', $this->id_empresa, PDO::PARAM_INT);
		$sth->bindParam(':titulo', $titulo, PDO::PARAM_STR);
		$sth->bindParam(':descripcion', $descripcion, PDO::PARAM_STR);
		$sth->bindParam(':prioridad', $prioridad, PDO::PARAM_STR);
		$sth->execute();
	}

	public function reporteNotas()
	{
		date_default_timezone_set('America/Bogota');

		$detalle_notas = $this->_db->query(
						"SELECT * FROM " . $this->TablaNotas
						. " WHERE estado = 1 "
						. " AND id_empresa = " . $this->id_empresa
						);

		$response = $detalle_notas->FetchAll();

		$now = date("Y-m-d H:i:s");
		$data = array();
		foreach($response as $rows){
			$data[] = array("id_notas" => $rows['id_notas'],
							"titulo" => $rows['titulo'],
						  "descripcion" => $rows['descripcion'],
						  "prioridad" => $rows['prioridad'],
						  "fecha_registro" => $this->tiempoTranscurrido($rows['fecha_registro'], $now)
						  );
		}

		return $data;
	}
}

?>