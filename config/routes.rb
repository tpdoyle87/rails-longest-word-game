Rails.application.routes.draw do
  get 'enter', to: 'words#enter', as: :enter
  post 'score', to: 'words#score'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
