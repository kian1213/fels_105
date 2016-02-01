class Admin::CategoriesController < AdminController
  
  def index
    @categories = Category.all
  end
  
  def new
    @categories = Category.new
  end
  
  def create
  end
  
  def edit
  end
  
  def show
    @categories = Category.find params[:id]
  end
  
end
