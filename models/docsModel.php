<?php

class docsModel extends Model
{
	public function __construct() {
		parent::__construct();
		$this->TablaDocs = 'sig_docs';
	}

	public function insertarDocs($nombre_docs, $contenido_docs)
	{
		$sth = $this->_db->prepare("INSERT INTO " . $this->TablaDocs
		. " VALUES (NULL, :nombre_docs, :contenido_docs, NOW())");

		$sth->bindParam(':nombre_docs', $nombre_docs, PDO::PARAM_STR);
		$sth->bindParam(':contenido_docs', $contenido_docs, PDO::PARAM_STR);
		$sth->execute();

		return $this->_db->lastInsertId();
	}

	public function getAll()
	{
		$docs = $this->_db->query(
			"SELECT * FROM " . $this->TablaDocs
		);

		$response = $docs->fetchall();

		$data = array();
		foreach($response as $rows) {
			$data[] = array(
				"idDocs"         => $rows['id'],
				"nombre_docs"    => $rows['nombre_docs'],
				"contenido_docs" => $rows['contenido_docs'],
				"created_at"     => $rows['created_at']
			);
		}

		return $data;
	}

	public function editarDoc($idDoc, $nombre_docs, $contenido_docs)
	{
		$sth = $this->_db->prepare("UPDATE " . $this->TablaDocs
				  . " SET nombre_docs = :nombre_docs, contenido_docs = :contenido_docs"
				  . " WHERE id = :idDoc"
				  );
		$sth->bindParam(':nombre_docs', $nombre_docs, PDO::PARAM_STR);
		$sth->bindParam(':contenido_docs', $contenido_docs, PDO::PARAM_STR);
		$sth->bindParam(':idDoc', $idDoc, PDO::PARAM_INT);
		$sth->execute();
	}

	public function getEdit($idDoc)
	{
		$doc = $this->_db->query(
			"SELECT nombre_docs, contenido_docs FROM " . $this->TablaDocs .
			" WHERE id = {$idDoc}"
		);

		return $doc->Fetch();
	}
}

?>
