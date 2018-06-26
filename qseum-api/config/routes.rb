Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
      resources :users, format: "json"
      resources :visits, format: "json"
      resource :logins, only: :create
  end
end

end
