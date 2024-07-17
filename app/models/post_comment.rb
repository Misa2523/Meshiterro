#PostCommentモデルの設定ファイル

class PostComment < ApplicationRecord

  #下2行、それぞれ１つのUserモデル、PoatImageモデルに関連付くから単数形
  #Userモデルの関連付け（1:NのN側にあたるモデルにbelongs_toを記載）
  belongs_to :user
   #PostImageモデルの関連付け
  belongs_to :post_image

end
