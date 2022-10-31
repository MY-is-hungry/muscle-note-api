class Api::V1::CategoriesController < Api::V1::BaseController
  def index
    categories = Category.includes(:events).where(user_id: @current_user_id)
    if params[:serialize_type] == "simple"
      return render json: categories, each_serializer: Category::SimpleSerializer
    end
    p categories
    render json: categories, each_serializer: Category::DetailSerializer
  end
end
