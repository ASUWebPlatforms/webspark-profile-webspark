<?php

namespace Drupal\webspark_installer_forms\Form;

use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides the Header configuration form.
 */
class WebsparkConfigureHeaderForm extends ConfigFormBase {

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
    return 'webspark_install_configure_header_form';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $form['#title'] = $this->t('Webspark Config: Header');

    $form['parent_unit_name'] = [
      '#maxlength' => 20,
      '#size' => 60,
      '#title' => $this->t('Parent unit name'),
      '#type' => 'textfield',
      '#default_value' => '',
    ];
    $form['parent_department_url'] = [
      '#maxlength' => 20,
      '#size' => 100,
      '#title' => $this->t('Parent Department URL'),
      '#type' => 'textfield',
      '#default_value' => '',
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
    $config_factory = \Drupal::configFactory();
    $block = $config_factory->getEditable('block.block.asubrandheader');
    $block->set('settings.asu_brand_header_block_parent_org', $form_state->getValue('parent_unit_name'));
    $block->set('settings.asu_brand_header_block_parent_org_url', $form_state->getValue('parent_department_url'));
    $block->save(TRUE);
  }

}
