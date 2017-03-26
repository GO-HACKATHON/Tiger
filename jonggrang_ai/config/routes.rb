Rails.application.routes.draw do
  post 'slack_action' => 'slack_incoming#action'
  post 'openshift_alert' => 'openshift_incoming#alert'
end
