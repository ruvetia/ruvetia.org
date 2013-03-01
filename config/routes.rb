Ruvetia::Application.routes.draw do

  # we don't want www
  constraints(:host => /^www\./) do
    get "(*x)" => redirect { |params, request|
      URI.parse(request.url).tap {|url| url.host.sub!('www.', '') }.to_s
    }
  end

  root :to => "pages#home"

  get '/auth/github/new', to: "auth/github#new", as: :attend_with_github
  get '/auth/github/create', to: "auth/github#create"
end
