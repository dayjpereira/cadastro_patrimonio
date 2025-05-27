class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: %i[ show edit update destroy ]

  # GET /funcionarios
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, notice: "Funcionário criado com sucesso." }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: "Funcionário atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  def destroy
    @funcionario.destroy

    respond_to do |format|
      format.turbo_stream do
        flash.now[:notice] = "Funcionário excluído com sucesso."
        render turbo_stream: [
          turbo_stream.remove(@funcionario),
          turbo_stream.prepend("flash", partial: "layouts/flash")
        ]
      end
      format.html { redirect_to funcionarios_path, notice: "Funcionário excluído com sucesso." }
    end
  end

  # GET /funcionarios/por_departamento/:id
  def por_departamento
    @funcionarios = Funcionario.where(departamento_id: params[:id])
    render json: @funcionarios
  end

  private

  def set_funcionario
    @funcionario = Funcionario.find(params[:id])
  end

  def funcionario_params
    params.require(:funcionario).permit(:nome, :departamento_id)
  end
end
