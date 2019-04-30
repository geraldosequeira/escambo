class Site::CommentsController < ApplicationController

  before_action :authenticate_member!

  def create
    @comment = Comment.new(comment_params)
    @comment.member = current_member

    if @comment.save
      redirect_to site_ad_detail_path(@comment.ad), notice: "Comentário cadastrado"
    else
      redirect_to site_ad_detail_path(@comment.ad), notice: "Erro ao cadastrar"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :ad_id)
  end

end
