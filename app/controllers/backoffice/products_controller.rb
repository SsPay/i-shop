class Backoffice::ProductsController < Backoffice::BackofficeController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 8)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
    if @product.save
        format.html { redirect_to @product, url: admin_products_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @product }
    else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :category_id)
  end
end
