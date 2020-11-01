Rails.application.routes.draw do
  get 'tops/index'
  root to: "tops#index"
end
