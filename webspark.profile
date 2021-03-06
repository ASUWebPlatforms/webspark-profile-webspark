<?php

/**
 * @file
 * Enables modules and site configuration for a webspark site installation.
 */

use Drupal\contact\Entity\ContactForm;
use Drupal\Core\Form\FormStateInterface;

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function webspark_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  $form['admin_account']['openasu_admin_asurite'] = [
    '#title' => 'ASURITE User ID',
    '#description' => t('Associate admin account with ASURITE User'),
    '#type' => 'textfield',
    '#required' => FALSE,
    '#weight' => 20,
  ];
  $form['#submit'][] = 'webspark_form_install_configure_submit';

}

/**
 * Submission handler to sync the contact.form.feedback recipient.
 */
function webspark_form_install_configure_submit($form, FormStateInterface $form_state) {
  //Set header block title.
  $config_factory = \Drupal::configFactory();
  $block = $config_factory->getEditable('block.block.asubrandheader');
  $block->set('settings.asu_brand_header_block_title', $form_state->getValue('site_name'));
  $block->save(TRUE);
}

function webspark_install_tasks_alter(&$tasks, $install_state) {
  $academic_site = \Drupal::state()->get('academic_site', FALSE);
  $tasks['webspark_install_configure_header_form'] = [
    'display_name' => t('Header'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureHeaderForm',
    'run' => INSTALL_TASK_RUN_IF_NOT_COMPLETED,
  ];
  $tasks['webspark_install_configure_ga_form'] = [
    'display_name' => t('Google Analytics'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureGAForm',
  ];
}
