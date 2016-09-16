<?php

    Class evaluadores_model extends CI_Model
    {
        public function __construct()
        {
            parent::__construct();
        }

        public function getEvaluadores()
        {
            return $this->db->get('t_evaluadores')->result_array();
        }

        public function getEvaluador($evaluador)
        {
            return $this->db->where('CORREO', $evaluador)->get('t_evaluadores')->result_array()[0];
        }

        public function deleteEvaluador($id)
        {
            $this->db->delete('t_evaluadores', ['ID_EVALUADOR' => $id]);
        }

        public function postEvaluador(&$data)
        {
            if(!$this->VerifyEmail($data['CORREO']))
            {
                $data['TOKEN_ID'] = md5($data['CORREO'] . time());
                $data['FECHA_CREACION'] = date('Y-m-d H:i:s');
                $this->db->insert('t_evaluadores', $data);
                return true;
            }
            else
            {
                return false;
            }
        }

        public function evaluadorLogin(&$evaluador)
        {
            if($this->VerifyUser($evaluador))
            {
                $this->db->update('t_evaluadores', ['TOKEN_ID' => md5($evaluador['CORREO'] . time())], ['CORREO' => $evaluador['CORREO']]);
                return true;
            }
            else
            {
                return false;
            }
        }

        public function VerifyEmail($CORREO)
        {
            return $this->db->query("SELECT ID_EVALUADOR FROM t_evaluadores WHERE CORREO = '$CORREO'")->num_rows() > 0;
        }

        public function VerifyUser($evaluador)
        {
            $passwd = $evaluador['CLAVE'];
            $email = $evaluador['CORREO'];
            return $this->db->query("SELECT ID_EVALUADOR FROM t_evaluadores 
                WHERE CORREO = '$email' AND t_evaluadores.CLAVE = '$passwd'")->num_rows() > 0;
        }
    }