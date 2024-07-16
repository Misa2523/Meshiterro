#全てのコントローラに対する処理を行える権限を持つコントローラファイル

class ApplicationController < ActionController::Base
  #devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  #after_sign_in_path_forはdeviseが用意してるメソッド
  #サインイン後どこに遷移するか設定
  def after_sign_in_path_for(resource)  #resource引数には、ログイン実行したモデルのデータ（ログインUserのインスタンス）が格納されてる
    post_images_path    #投稿画像の一覧画面(post_images)に遷移
  end

  #サインアウト後どこに遷移するか設定
  def after_sign_out_path_for(resource)
    about_path
  end

  protected   #呼び出された他のコントローラからも参照可能（privateは記述したコントローラ内でのみ）

  #configure_permitted_parametersメソッド
  def configure_permitted_parameters
     #devise_parameter_sanitizer.permitメソッドを使うことで、ユーザ登録(sign_up)の際にユーザ名(name)のデータ操作を許可している
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #ストロングパラメータと同様の機能

  end
end
