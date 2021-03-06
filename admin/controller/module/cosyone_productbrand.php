<?php
class ControllerModuleCosyoneProductbrand extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('module/cosyone_productbrand');

		$this->load->model('setting/setting');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cosyone_productbrand', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_height'] = $this->language->get('entry_height');
		
		$data['entry_width'] = $this->language->get('entry_width');
		
		$data['entry_status'] = $this->language->get('entry_status');
		

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/cosyone_productbrand', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/cosyone_productbrand', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		

		
		if (isset($this->request->post['cosyone_productbrand_width'])) {
			$data['cosyone_productbrand_width'] = $this->request->post['cosyone_productbrand_width'];
		} elseif ($this->config->get('cosyone_productbrand_width')) {
			$data['cosyone_productbrand_width'] = $this->config->get('cosyone_productbrand_width');
		} else {
			$data['cosyone_productbrand_width'] = '240';
		}
		
		if (isset($this->request->post['cosyone_productbrand_height'])) {
			$data['cosyone_productbrand_height'] = $this->request->post['cosyone_productbrand_height'];
		} elseif ($this->config->get('cosyone_productbrand_height')) {
			$data['cosyone_productbrand_height'] = $this->config->get('cosyone_productbrand_height');
		} else {
			$data['cosyone_productbrand_height'] = '115';
		}

		

		if (isset($this->request->post['cosyone_productbrand_status'])) {
			$data['cosyone_productbrand_status'] = $this->request->post['cosyone_productbrand_status'];
		} else {
			$data['cosyone_productbrand_status'] = $this->config->get('cosyone_productbrand_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/cosyone_productbrand.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/cosyone_productbrand')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}