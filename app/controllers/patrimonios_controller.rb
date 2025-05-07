class PatrimoniosController < ApplicationController
  before_action :set_patrimonio, only: %i[ show edit update destroy ]

  # GET /patrimonios or /patrimonios.json
  def index
    @patrimonios = Patrimonio.all.includes(:departamento, :funcionario)
  
    if params[:nome].present?
      @patrimonios = @patrimonios.where("nome ILIKE ?", "%#{params[:nome]}%")
    end
  
    if params[:placa].present?
      @patrimonios = @patrimonios.where(numero_placa: params[:placa])
    end
  
    if params[:departamento_id].present?
      @patrimonios = @patrimonios.where(departamento_id: params[:departamento_id])
    end
  end

  # GET /patrimonios/1 or /patrimonios/1.json
  def show
  end

  # GET /patrimonios/new
  def new
    @patrimonio = Patrimonio.new
  end

  # GET /patrimonios/1/edit
  def edit
  end

  # POST /patrimonios or /patrimonios.json
  def create
    @patrimonio = Patrimonio.new(patrimonio_params)

    respond_to do |format|
      if @patrimonio.save
        format.html { redirect_to @patrimonio, notice: "Patrimonio was successfully created." }
        format.json { render :show, status: :created, location: @patrimonio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patrimonios/1 or /patrimonios/1.json
  def update
    respond_to do |format|
      if @patrimonio.update(patrimonio_params)
        format.html { redirect_to @patrimonio, notice: "Patrimonio was successfully updated." }
        format.json { render :show, status: :ok, location: @patrimonio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patrimonios/1 or /patrimonios/1.json
  def destroy
    @patrimonio.destroy!

    respond_to do |format|
      format.html { redirect_to patrimonios_path, status: :see_other, notice: "Patrimonio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patrimonio
      @patrimonio = Patrimonio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patrimonio_params
      params.require(:patrimonio).permit(:nome, :numero_placa, :valor, :data_compra, :descricao, :funcionario_id, :departamento_id)
    end

    
end
