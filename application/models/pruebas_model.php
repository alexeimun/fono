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

        public function postRespuestaPaciente($data)
        {
            return $this->db->insert('t_respuesta_pacientes', $data);
        }
    }