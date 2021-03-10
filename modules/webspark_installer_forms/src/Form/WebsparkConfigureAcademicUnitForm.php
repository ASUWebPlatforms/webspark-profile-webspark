<?php

namespace Drupal\webspark_installer_forms\Form;

use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides the Academic Unit configuration form.
 */
class WebsparkConfigureAcademicUnitForm extends ConfigFormBase {

  /**
   * {@inheritdoc}
   */
  protected function getEditableConfigNames() {
    return [];
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'webspark_install_configure_academic_site_form';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $form['#title'] = $this->t('Webspark Config: Academic Unit');

    $form['academic_site'] = [
      '#type' => 'checkbox',
      '#title' => t('Is this an academic unit site?.'),
    ];

    $form['actions'] = ['#type' => 'actions'];
    $form['actions']['submit'] = [
      '#type' => 'submit',
      '#value' => $this->t('Save and continue'),
      '#weight' => 15,
      '#button_type' => 'primary',
    ];

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $academic_site = $form_state->getValue('academic_site');
    if ($academic_site) {
      \Drupal::state()->set('academic_site', TRUE);
    }
  }

}
