Milk::Application.routes.draw do
  resources :items
  resources :users
  match "/delayed_job" => DelayedJobWeb, :anchor => false
end
