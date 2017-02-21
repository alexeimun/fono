<?php

    Class pruebas_model extends CI_Model
    {
        public function __construct()
        {
            parent::__construct();
        }

        public function getQuestios()
        {
            return $this->db->get('t_preguntas')->result_array();
        }

        public function getImages()
        {
            return $this->db->get('t_imagenes')->result_array();
        }

        public function postRespuestaEvaluador($data)
        {
            return $this->db->insert('t_respuesta_evaluador', $data);
        }

        public function getRespuestas($id_paciente,$id_encuentro)
        {
            return $this->db
                ->join('t_respuesta_pacientes', 't_respuesta_pacientes.ID_ENCUENTRO=t_encuentros.ID_ENCUENTRO', 'inner')
                ->where('t_encuentros.ID_ENCUENTRO', $id_encuentro)
                ->where('t_encuentros.ID_PACIENTE', $id_paciente)
                ->get('t_encuentros')
                ->result_array();
        }

        public function postRespuestaPaciente($data)
        {
            return $this->db->insert('t_respuesta_pacientes', $data);
        }
    }
