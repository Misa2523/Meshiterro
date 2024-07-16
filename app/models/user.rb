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
end
