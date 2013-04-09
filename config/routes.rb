Ruvetia::Application.routes.draw do

  # we don't want www
  constraints(:host => /^www\./) do
    get "(*x)" => redirect { |params, request|
      URI.parse(request.url).tap {|url| url.host.sub!('www.', '') }.to_s
    }
  end

  root :to => "pages#home"

  get '/events', to: "pages#events"

  get '/auth/github/new', to: "auth/github#new", as: :auth_github
  get '/auth/github/create', to: "auth/github#create"

  put '/attend/:meetup', to: "participations#create", as: :attend
  delete '/cancel/:meetup', to: "participations#destroy", as: :cancel
end
