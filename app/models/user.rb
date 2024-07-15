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
end
