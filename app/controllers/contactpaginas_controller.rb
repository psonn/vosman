class ContactpaginasController < ApplicationController
  before_action :set_contactpagina, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @contactpaginas = Contactpagina.all
  end

  def show
  end

  def new
    @contactpagina = Contactpagina.new
  end

  def edit
  end

  def create
    @contactpagina = Contactpagina.new(contactpagina_params)
      if @contactpagina.save
        redirect_to @contactpagina, notice: 'Contactpagina was successfully created.' 
      else
        render action: 'new' 
      end
  end

  def update
      if @contactpagina.update(contactpagina_params)
        redirect_to @contactpagina, notice: 'Contactpagina was successfully updated.'
      else
        render action: 'edit' 
      end
  end

  def destroy
    @contactpagina.destroy
    redirect_to contactpaginas_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contactpagina
      @contactpagina = Contactpagina.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contactpagina_params
      params.require(:contactpagina).permit(:title, :body)
    end
end
