#PostImage モデルの設定ファイル

class PostImage < ApplicationRecord
  #ActiveStorageを使って画像を持たせる
  has_one_attached :image

  #Userモデルの関連付け（1:NのN側にあたるモデルにbelongs_toを記載）
  belongs_to :user
  #１つのUserモデルに関連付くから単数形

  #画像が投稿されない場合のエラー回避
  #アクションと違い、特定の処理を名前で呼び出す
  def get_image
    unless image.attached?
      #画像が設定されない場合はapp/assets/imagesに格納されているno_image.jpgを
          #デフォルト画像としてActiveStorageに格納し、格納した画像を表示する
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
