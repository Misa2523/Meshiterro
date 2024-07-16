#Userモデルの設定ファイル

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #作成したUserモデルにdeviseで使用する機能を記述
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #database_authenticatable（パスワードの正確性を検証）
  #:registerable（ユーザ登録や編集、削除）
  #:recoverable（パスワードをリセット）
  #:rememberable（ログイン情報を保存）
  #:validatable（email のフォーマットなどのバリデーション

  #PostImageモデルの関連付け（1:Nの1側にあたるモデルにhas_manyを記載）
  has_many :post_images, dependent: :destroy
  #dependent: :destroy → 1:Nの1側が削除されたとき、N側を全て削除する

  #profile_imageという名前で、ActiveStorageでプロフィール画像を保存できるよう設定
  has_one_attached :profile_image

  #画像が投稿されない場合のエラー回避
  #アクションと違い、特定の処理を名前で呼び出す
  def get_profile_image(width, height)
    unless profile_image.attached?
      #画像が設定されない場合はapp/assets/imagesに格納されているsample-author1.jpgを
          #デフォルト画像としてActiveStorageに格納し、格納した画像を表示する
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    #画像サイズ変更（引数width, heightを設定）：画像をwidth×heightのサイズに変換する
    profile_image.variant(resize_to_limit: [width, height]).processed
    # ↑このメソッドを実行する際get_profile_image(100, 100)のように引数を設定すると100x100の画像にリサイズされる
  end

end
