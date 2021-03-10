<?php

namespace Drupal\webspark_installer_forms\Form;

use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 *  Provides the News Feed configuration form.
 */
class WebsparkConfigureNewsFeedForm extends ConfigFormBase {

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
    return 'webspark_install_configure_news_feed_form';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $form['#title'] = $this->t('Webspark Config: News Feed');

    $form['include_news'] = [
      '#type' => 'checkbox',
      '#title' => t('Include news articles from news.asu.edu?'),
    ];
    $form['news_category'] = [
      '#title' => t('News'),
      '#type' => 'select',
      '#description' => 'Select one category.',
      //@TODO configure available options
      '#options' => ['option 1', 'option 2', 'option 2'],
      '#states' => [
        'visible' => [
          ':input[name="include_news"]' =>['checked' => TRUE],
        ],
      ],
    ];
    $form['update_frequency'] = [
      '#title' => t('How often do you want this updated?'),
      '#type' => 'select',
      '#description' => 'Select one option.',
      //@TODO configure available options
      '#options' => ['option 1', 'option 2', 'option 2'],
      '#states' => [
        'visible' => [
          ':input[name="include_news"]' =>['checked' => TRUE],
        ],
      ],
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

  }

}
