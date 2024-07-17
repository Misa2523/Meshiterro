Rails.application.routes.draw do

  devise_for :users   #devise を使用する際に URL として users を含む
  #get 'homes/top'
  root to: "homes#top"    #ルートパスで設定

  #resourcesメソッド：ルーティングを一括して自動生成（onlyオプションで生成するルーティングを限定）
  #post_imagesモデルのルーティング
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    #いいね、コメントは投稿画像に対しされるため、favoritesとpost_commentsは、それぞれpost_imagesに結びつき親子関係になる（ネストする）
    resource :favorite, only: [:create, :destroy] #resource：単数形にすると、/:idがURLに含まれなくなる
    resources :post_comments, only: [:create, :destroy]
  end
  #単数形resourceは「それ自身のidが分からなくても、関連する他のモデルのidから特定できる」場合に用いる

  #usersモデルのルーティング
  resources :users, only: [:show, :edit, :update]

  #get 'homes/about', to: 'homes#about', as: 'about'

end
