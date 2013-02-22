Ruvetia::Application.routes.draw do

  # we don't want www
  constraints(:host => /^www\./) do
    get "(*x)" => redirect { |params, request|
      URI.parse(request.url).tap {|url| url.host.sub!('www.', '') }.to_s
    }
  end

  root :to => "pages#home"
end
