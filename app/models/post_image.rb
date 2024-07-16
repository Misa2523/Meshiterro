#PostImage モデルの設定ファイル

class PostImage < ApplicationRecord
  #ActiveStorageを使って画像を持たせる
  has_one_attached :image

  #Userモデルの関連付け（1:NのN側にあたるモデルにbelongs_toを記載）
  belongs_to :user
  #１つのUserモデルに関連付くから単数形
end
