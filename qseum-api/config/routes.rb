Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    resources :memberships, format: "json" do
      resources :users, format: "json"
    end
  end
end

end
