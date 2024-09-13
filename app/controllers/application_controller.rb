#全てのコントローラに対する処理を行える権限を持つコントローラファイル

class ApplicationController < ActionController::Base

  #before_actionメソッド：このコントローラが動作する前に実行される
      # → application_controller.rbファイルに記述したら、全てのコントローラで、最初にこのメソッドが実行される
  #ログイン認証が済んでいない状態でトップページ以外の画面にアクセスしてもログイン画面へリダイレクトする
  before_action :authenticate_user!, except: [:top]
  #authenticate_userメソッド：device側が用意してるメソッド
      # :authenticate_user! 「ログイン認証されてなければ、ログイン画面へリダイレクト」

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

  protected #呼び出された他のコントローラからも参照可能（privateは記述したコントローラ内でのみ）

  #configure_permitted_parametersメソッド
  def configure_permitted_parameters
    #サインアップ（新規登録）時にemailを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #ストロングパラメータと同様の機能
  end
end
