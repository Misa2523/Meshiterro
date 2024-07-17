#PostCommentsコントローラー

class PostCommentsController < ApplicationController

  #コメントを作成し、データベースに保存する
  def create
    post_image = PostImage.find(params[:post_image_id])

    #comment = PostComment.new(post_comment_params)
    #comment.user_id = current_user.id
    # ↓このコードは、↑この2行分を省略して記述したコード
    comment = current_user.post_comments.new(post_comment_params)

    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  #コメント削除機能
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  #ストロングパラメータ
  private

  def post_comment_params
    #フォームで入力されたデータが、投稿データとして許可されているパラメータかチェック
    params.require(:post_comment).permit(:comment)
  end
end
