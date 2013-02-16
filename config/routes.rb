Ruvetia::Application.routes.draw do
  root :to => "pages#home"

  get 'team', to: 'pages#team', as: 'team'
end
