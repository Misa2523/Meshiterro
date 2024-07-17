#Favoriteモデルの設定ファイル

class Favorite < ApplicationRecord

  #Userモデルの関連付け
  belongs_to :user
  #PostImageモデルの関連付け
  belongs_to :post_image

  #バリデーションを使い、1人のユーザーが１つの投稿に対していいねを重複しないよう制限
  validates :user_id, uniqueness: {scope: :post_image_id}
  #uniquenessを指定すると、validatesメソッドの引数であるuser_idカラムの値がすでにテーブルに保存されてる値と重複していないかチェックする
  #scopeを上記のように指定すると、user_idとpost_image_idのペアに対して、すでに同じ値のペアがテーブルに保存されていないかを判定する

end
