#PostImage モデルの設定ファイル

class PostImage < ApplicationRecord
  #ActiveStorageを使って画像を持たせる
  has_one_attached :image
end
