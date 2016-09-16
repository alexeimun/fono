<?php

    Class encuentros_model extends CI_Model
    {
        public function __construct()
        {
            parent::__construct();
        }

        public function postEncuentro($data)
        {
            return $this->db->insert('t_encuentros', $data);
        }

        public function postEncuentroTiempo($data)
        {
            return $this->db->update('t_encuentros', $data, ['ID_ENCUENTRO' => $this->getLastEncuentro()['ID_ENCUENTRO']]);
        }

        public function getLastEncuentro()
        {
            return $this->db->select_max('ID_ENCUENTRO')->get('t_encuentros')->result_array()[0];
        }
    }