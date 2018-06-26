Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
      resources :users, format: "json" do
        resources :visits, format: "json"
      end
      resource :logins, only: :create
  end
end

end
