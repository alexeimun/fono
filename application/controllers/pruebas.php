<?php

    defined('BASEPATH') OR exit('No direct script access allowed');

    require APPPATH . '/libraries/REST_Controller.php';

    class Pruebas extends REST_Controller
    {
        function __construct()
        {
            // Construct the parent class
            parent::__construct();
            $this->load->model(['pruebas_model', 'encuentros_model']);
        }

        public function images_get()
        {
            $images = $this->pruebas_model->getImages();
            if($images)
            {
                // Set the response and exit
                $this->response($images, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
            }
            else
            {
                // Set the response and exit
                $this->response([
                    'status' => false,
                    'message' => 'No questions were found',
                ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
            }
        }

        public function responses_get($id_paciente,$id_encuentro)
        {
            $responses = $this->pruebas_model->getRespuestas($id_paciente,$id_encuentro);
            if($responses)
            {
                $this->response($responses, REST_Controller::HTTP_OK);
            }
            else
            {
                $this->response([
                    'status' => false,
                    'message' => 'No responses were found',
                ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
            }
        }

        public function questions_get()
        {
            $questions = $this->pruebas_model->getQuestios();

            if($questions)
            {
                // Set the response and exit
                $this->response($questions, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
            }
            else
            {
                // Set the response and exit
                $this->response([
                    'status' => false,
                    'message' => 'No questions were found',
                ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
            }
        }

        public function index_post()
        {
            $data = $this->post(null, true);
            if(!empty($data) || !is_null($data))
            {
                if($this->pacientes_model->postPaciente($data))
                {
                    // CREATED (201) being the HTTP response code
                    $this->set_response(['status' => true, 'data' => $data, 'message' => 'successfully source added'], REST_Controller::HTTP_CREATED);
                }
                else
                {
                    $this->response(['status' => false, 'message' => 'The username or email already exist'], REST_Controller::HTTP_OK);
                }
            }
            else
            {
                $this->response(null, REST_Controller::HTTP_BAD_REQUEST);
            }
        }

        public function respuestaevaluador_post()
        {
            $data = $this->post(null, true);
            if(!empty($data) || !is_null($data))
            {
                if($this->pruebas_model->postRespuestaEvaluador(array_merge($data, $this->encuentros_model->getLastEncuentro())))
                {
                    // CREATED (201) being the HTTP response code
                    $this->set_response(['status' => true, 'data' => $data, 'message' => 'successfully source added'], REST_Controller::HTTP_CREATED);
                }
                else
                {
                    $this->response(['status' => false, 'message' => 'The username or email already exist'], REST_Controller::HTTP_OK);
                }
            }
            else
            {
                $this->response(null, REST_Controller::HTTP_BAD_REQUEST);
            }
        }

        public function encuentrotiempo_post()
        {
            $data = $this->post(null, true);
            if(!empty($data) || !is_null($data))
            {
                if($this->encuentros_model->postEncuentroTiempo(array_merge($data, $this->encuentros_model->getLastEncuentro())))
                {
                    // CREATED (201) being the HTTP response code
                    $this->set_response(['status' => true, 'data' => $data, 'message' => 'successfully source added'], REST_Controller::HTTP_CREATED);
                }
                else
                {
                    $this->response(['status' => false, 'message' => 'The username or email already exist'], REST_Controller::HTTP_OK);
                }
            }
            else
            {
                $this->response(null, REST_Controller::HTTP_BAD_REQUEST);
            }
        }

        public function respuestapaciente_post()
        {
            $data = $this->post(null, true);
            if(!empty($data) || !is_null($data))
            {
                if($this->pruebas_model->postRespuestaPaciente(array_merge($data, $this->encuentros_model->getLastEncuentro())))
                {
                    // CREATED (201) being the HTTP response code
                    $this->set_response(['status' => true, 'data' => $data, 'message' => 'successfully source added'], REST_Controller::HTTP_CREATED);
                }
                else
                {
                    $this->response(['status' => false, 'message' => 'The username or email already exist'], REST_Controller::HTTP_OK);
                }
            }
            else
            {
                $this->response(null, REST_Controller::HTTP_BAD_REQUEST);
            }
        }

        public function index_put()
        {
            //$this->some_model->update_user(...);
            $message = [
                'id' => 100, // Automatically generated by the model
                'name' => $this->post('name'),
                'email' => $this->post('email'),
                'message' => 'Added a resource',
            ];

            $this->set_response($message, REST_Controller::HTTP_CREATED); // CREATED (201) being the HTTP response code
        }

        public function index_delete()
        {
            $id = (int)$_GET['id'];

            // Validate the id.
            if($id <= 0)
            {
                // Set the response and exit
                $this->response(null, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
            }

            $this->pacientes_model->deletePaciente($id);
            $message = [
                'id' => $id,
                'message' => 'Deleted the resource',
            ];

            $this->set_response($message, REST_Controller::HTTP_NO_CONTENT); // NO_CONTENT (204) being the HTTP response code
        }
    }
