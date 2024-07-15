Rails.application.routes.draw do
  devise_for :users   #devise を使用する際に URL として users を含む
  get 'homes/top'
  root to: "homes#top"    #ルートパスで設定
  
  get 'homes/about', to: 'homes#about', as: 'about'
end
