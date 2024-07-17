class UsersController < ApplicationController

  #ユーザーの詳細ページ表示（個人が投稿したもの全てを表示）
  def show
    #URLに記載されたIDを参考に必要なUserモデルを取得する
    @user = User.find(params[:id])

    #特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し@post_imagesに渡す
    #@post_images = @user.post_images  #アソシエーションを持っているモデル同士の記述方法
    # ↑このコードをページネーションを行うため↓書き換える

    #1ページ分の決められた数のデータだけを、新しい順に取得
    @post_images = @user.post_images.page(params[:page])
    #pageメソッド：kaminariをインストールしたことで使用可能になったメソッド
  end

  #ユーザー情報の編集機能
  def edit
    #URLを参考に特定のidを持ったレコードを取得
    @user = User.find(params[:id])
  end

  #更新機能
  def update
    #ユーザーの取得
    @user = User.find(params[:id])
    #ユーザーのアップデート
    @user.update(user_params)
    #ユーザーの詳細ページへ遷移
    redirect_to user_path(@user.id)
  end

  #ストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
