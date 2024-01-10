class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    @comments = @prototype.comments.includes(:user)
    # ログインユーザーのみコメントを作成する
      if @comment.save
        redirect_to @prototype, notice: 'コメントが投稿されました。'
      else
        # コメントが保存できなかった場合も詳細ページを表示する
        render 'prototypes/show', status: :unprocessable_entity
      end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.prototype, notice: 'コメントが削除されました。'
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    #mergeメソッドを使用してユーザーIDを追加する
    #paramsに入っているprototype_IDを使用する
  end
end
