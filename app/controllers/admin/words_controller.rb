class Admin::WordsController < AdminController
  def index
    @words = Word.paginate page: params[:page], per_page: 10
  end
end