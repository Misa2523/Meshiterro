class UsersController < ApplicationController

  #ユーザーの詳細ページ表示（個人が投稿したもの全てを表示）
  def show
    #URLに記載されたIDを参考に必要なUserモデルを取得する
    @user = User.find(params[:id])
    #特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し@post_imagesに渡す
    @post_images = @user.post_images  #アソシエーションを持っているモデル同士の記述方法
  end

  def edit
  end
end
