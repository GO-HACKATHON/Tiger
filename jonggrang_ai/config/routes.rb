Rails.application.routes.draw do
  get 'slack_action' => 'slack_incoming#action'
  get 'openshift_alert' => 'openshift_incoming#alert'
end
