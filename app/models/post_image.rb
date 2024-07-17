#PostImage モデルの設定ファイル

class PostImage < ApplicationRecord
  #ActiveStorageを使って画像を持たせる
  has_one_attached :image

  #Userモデルの関連付け（1:NのN側にあたるモデルにbelongs_toを記載）
  belongs_to :user
  #１つのUserモデルに関連付くから単数形

  #PostImageモデルとPostCommentモデルの関連づけ（1:Nの1側にあたるモデルにhas_manyを記載）
  has_many :post_comments, dependent: :destroy
  #dependent: :destroy → 1:Nの1側が削除されたとき、N側を全て削除する

  #PostImageモデルとFavoriteモデルの関連づけ
  has_many :favorites, dependent: :destroy

  #画像投稿に対し必須入力の設定
  #shop_nameが存在しているかを確認するバリデーション
  validates :shop_name, presence: true
  #imageが存在しているかを確認するバリデーション
  validates :image, presence: true

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

  #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
  #存在していればtrue、存在していなければfalseを返す
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
