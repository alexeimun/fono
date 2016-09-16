<?php

    Class pacientes_model extends CI_Model
    {
        public function __construct()
        {
            parent::__construct();
        }

        public function getPacientes()
        {
            return $this->db->get('t_pacientes')->result_array();
        }

        public function getPaciente($evaluador)
        {
            return $this->db->where('CORREO', $evaluador)->get('t_pacientes')->result_array()[0];
        }

        public function deletePaciente($id)
        {
            $this->db->delete('t_pacientes', ['ID_PACIENTE' => $id]);
        }

        public function postPaciente(&$data)
        {
            $data['FECHA_CREACION'] = date('Y-m-d H:i:s');
            $this->db->insert('t_pacientes', $data);
            return true;
        }
    }