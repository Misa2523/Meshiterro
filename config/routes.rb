Rails.application.routes.draw do

  devise_for :users   #devise を使用する際に URL として users を含む
  #get 'homes/top'
  root to: "homes#top"    #ルートパスで設定

  #resourcesメソッド：ルーティングを一括して自動生成
  resources :post_images, only: [:new, :create, :index, :show]
  #onlyオプションを使うと生成するルーティングを限定できる

  get 'homes/about', to: 'homes#about', as: 'about'
end
