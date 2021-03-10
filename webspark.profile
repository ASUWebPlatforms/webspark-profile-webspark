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
  //@TODO custom tasks
}

function webspark_install_tasks_alter(&$tasks, $install_state) {
  $academic_site = \Drupal::state()->get('academic_site', FALSE);
  $tasks['webspark_install_configure_academic_site_form'] = [
    'display_name' => t('Academic Unit'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureAcademicUnitForm',
    'run' => INSTALL_TASK_RUN_IF_NOT_COMPLETED,
  ];
  $tasks['webspark_install_configure_degree_pages_form'] = [
    'display_name' => t('Degree Pages'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureDegreePagesForm',
    'run' => ($academic_site) ? INSTALL_TASK_RUN_IF_NOT_COMPLETED : INSTALL_TASK_SKIP,
  ];
  $tasks['webspark_install_configure_logo_footer_form'] = [
    'display_name' => t('Custom Logo Footer'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureFooterLogoForm',
    'run' => ($academic_site) ? INSTALL_TASK_RUN_IF_NOT_COMPLETED : INSTALL_TASK_SKIP,
  ];
  $tasks['webspark_install_configure_news_feed_form'] = [
    'display_name' => t('News Feed'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureNewsFeedForm',
  ];
  $tasks['webspark_install_configure_events_feed_form'] = [
    'display_name' => t('Events Feed'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureEventsFeedForm',
  ];
  $tasks['webspark_install_configure_directory_form'] = [
    'display_name' => t('Department/unit/college directory'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureDirectoryForm',
  ];
  $tasks['webspark_install_configure_megafooter_form'] = [
    'display_name' => t('Megafooter'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureMegafooterForm',
  ];
  $tasks['webspark_install_configure_ga_form'] = [
    'display_name' => t('Google Analytics'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureGAForm',
  ];
  $tasks['webspark_install_configure_subtheme_form'] = [
    'display_name' => t('Subtheme'),
    'type' => 'form',
    'function' => 'Drupal\webspark_installer_forms\Form\WebsparkConfigureSubthemeForm',
  ];
}
