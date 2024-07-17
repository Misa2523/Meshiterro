#PostImagesコントローラー

class PostImagesController < ApplicationController
  def top
  end

  #投稿画面を表示
  def new
    #newメソッドで空のインスタンス作成
    @post_image = PostImage.new
  end

  #投稿データを保存
  def create
    #投稿するデータをPostImageモデルに紐づくデータとして保存する準備
    #フォームに入力されたデータ(shop_name や caption,image など)を、@post_image に格納
    @post_image = PostImage.new(post_image_params)

    # user_id：画像投稿を行う際「どのユーザーが投稿したのか」を「ユーザーの ID で判断する」ためのカラム
    # [空のモデル名].[カラム名]という形で繋げると、保存するカラムの中身を操作できる
    @post_image.user_id = current_user.id   #current_user：ログイン中のユーザーの情報を取得。ヘルパーメソッドの一種。deviseをインストールすると使える。
    #↑の意味：@post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に
            #指定することで投稿データに、今ログイン中のユーザーの ID を持たせることができる。

    #PostImageモデルへ保存
    @post_image.save
    #投稿一覧画面へリダイレクト
    redirect_to post_images_path
  end

  #投稿一覧の表示
  def index
    #タイムライン上に表示する投稿データを取得
    #@post_imagesにはpost_imagesテーブル内に存在する全てのレコードのインスタンスを代入
    @post_images = PostImage.all
  end

  #詳細画面の表示
  def show
    #@post_imageには特定のidのPostImageモデルを格納
    @post_image = PostImage.find(params[:id])

    #コメントを投稿するためのインスタンス変数を定義
    @post_comment = PostComment.new
  end

  #投稿削除の機能
  def destroy
    #削除するPosImageレコードを取得
    post_image = PostImage.find(params[:id])
    #削除
    post_image.destroy
    #一覧画面へ遷移
    redirect_to '/post_images'
  end

  #投稿データのストロングパラメータ
  private

  #post_image_paramsメソッド：フォームで入力されたデータが、投稿データとして許可されているパラメータかチェック
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
