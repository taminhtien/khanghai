class Admin::ContractsController < Admin::BaseController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @contracts = Contract.all.paginate(page: params[:page], per_page: 15)
  end

  def show
  end

  def new
    @contract = Contract.new
  end

  def edit
  end

  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to [:admin, @contract], notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @contract] }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to [:admin, @contract], notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contract.destroy
    
    respond_to do |format|
      format.html { redirect_to admin_contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:code, :type, :customer_id, :assignee, :assigned_date, :estimate_completed_date, :summary, :requirement, :development, :propose_assignee)
  end
end
