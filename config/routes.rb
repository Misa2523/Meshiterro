Rails.application.routes.draw do

  devise_for :users   #devise を使用する際に URL として users を含む
  #get 'homes/top'
  root to: "homes#top"    #ルートパスで設定

  #resourcesメソッド：ルーティングを一括して自動生成（onlyオプションで生成するルーティングを限定）
  #post_imagesモデルのルーティング
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    #コメントは投稿画像に対しされるため、post_commentsは、post_imagesに結びつき親子関係になる（ネストする）
    resources :post_comments, only: [:create, :destroy]
  end

  #usersモデルのルーティング
  resources :users, only: [:show, :edit, :update]

  #get 'homes/about', to: 'homes#about', as: 'about'

end
