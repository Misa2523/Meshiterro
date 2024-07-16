class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      #t.データ型 :カラム名

      #t.integer :id   #投稿画像を識別するID
      t.string :shop_name   #お店の名前
      t.text :caption       #画像の説明
      t.integer :user_id    #投稿したユーザを識別するID（usersテーブルのidを保存）

      #作られたタイミングと更新されたタイミングを管理
      t.timestamps
    end
  end
end
