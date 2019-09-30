Rails.application.routes.draw do
  # patch '/blogs', to: 'blogs#confirm'
  resources :users do
    collection do
      post :confirm
    end
  end
end
