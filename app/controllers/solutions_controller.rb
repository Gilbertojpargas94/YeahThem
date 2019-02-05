class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy, :validate]
  before_action :authenticate_user!, except: [:show, :index, :validate, :validate_benefits]
  before_action :authenticate_company!, only: [:new] 
  before_action :authenticate_owner_solution!, only: [:edit, :update, :destroy]
  before_action :has_company!, only: [:show]
  before_action :set_random_solutions, only: [:validate, :show, :edit]
  before_action(only: [:show, :edit]) {
    |c| c.set_clients(@solution.company.solutions)
  }

  # GET /solutions
  # GET /solutions.json
  def index
    @solutions = Solution.all
  end

  def share
    # This is for generate the solution link to share with the clients and can validated
  end

  def validate
    # This view is for validate the benefits of a solution
    @solutions = Solution.company_solutions(@solution.company_id)
    @clients = @solution.clients
    @benefits = @solution.benefits
  end

  def thanks
  end

  def happyclients
  end

  def validate_benefits
    decode_client_id = Base64.decode64(params[:client_id]).to_i
    if params[:id].nil? || decode_client_id.nil?
      redirect_to root_path, notice: "Ha ocurrido un error al tratar de validar la solución"
    else
      @solution = Solution.find(params[:id])
      @client = Client.find(decode_client_id)
      @benefits = @solution.benefits
      # Updating values
      @benefits.where(id: params[:benefits_id]).update_all(validated: 1)
      
      if @solution.clients.where("id = ?", @client.id).exists?
        @solution.update_validation(false)
      else
        @solution.clients << @client
        @solution.update_validation
      end
      
      if @solution.save
        redirect_to @solution, notice:"Solución validada satisfactoriamente"
      end
    end
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
    @home_page = true
    @solutions = Solution.company_solutions(@solution.company_id)
    @clients = @solution.clients
  end
  # GET /solutions/new
  def new
    @home_page = true
    @solution = Solution.new
    @user = current_user
    @company = current_user.company
    @industry_branches = @company.industries.first.industry_branches
    @industry_branch = IndustryBranch.new
    @random_solutions = Solution.company_solutions(@company.id).order(Arel.sql('random()')).where.not(id: @solution.id).limit(2)
    @solutions = current_user.company.solutions.all
    @clients_all = set_clients(@solutions)
  end

  # GET /solutions/1/edit
  def edit
    @industry_branches = @solution.company.industries.first.industry_branches
    @user = current_user
    @solutions = current_user.company.solutions.all
    @index = @solutions.pluck(:id).index(@solution.id)
    @benefits = @solution.benefits.all
    @company = current_user.company
    @clients = @solution.clients
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = current_user.company.solutions.new(solution_params)
    
    # If the user whans to create a branch, the parameters send industry_branch_ids nil or empty
    # If not, it meens that the user select a branch from the collection select.
    if solution_params[:industry_branch_ids] != nil
      if not solution_params[:industry_branch_ids].empty?
        @solution.industry_branches << IndustryBranch.find(solution_params[:industry_branch_ids])
      else
        unless solution_params[:industry_branches_attributes] != nil
          begin
            IndustryBranch.find(solution_params[:industry_branch_ids])
          rescue e
          end
        end
      end
    end
    
    respond_to do |format|
      if @solution.save
        format.html { redirect_to new_benefit_path(:solution_id => @solution.id), notice: 'Solution was successfully created.' }
        format.json { render :show, status: :created, location: @solution }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update
    respond_to do |format|
      if @solution.update(solution_params)
        format.html { redirect_to @solution, notice: 'Solution was successfully updated.' }
        format.json { render :show, status: :ok, location: @solution }
        format.js 
      else
        format.html { render :edit }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to solutions_url, notice: 'Solution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def preview_new
  end

  def afterview_new
    @home_page = true
  end

  private
    # For create a new solution the user it has to be register a company first.
    def authenticate_company!
      if current_user.company == nil
        redirect_to new_company_path, notice: "Tienes que registrar una compañia", status: :unauthorized
      end
    end

    def authenticate_owner_solution!
      if current_user.company != nil
        solution = current_user.company.solutions.find_by(id: params[:id])
        if solution == nil
          redirect_to your_solutions_company_path(current_user.company), notice: "No estas autorizado para entrar allí.", status: :unauthorized
        end
      else
        redirect_to new_company_path, notice: "Debes registrar una compañía.", status: :unauthorized
      end
    end

    def has_company!
      if @solution.company.nil?
        redirect_to new_company_path, notice: "Debes registrar una compañia."
      end
    end

    def my_solution!
      # If the solution/show is my, redirect to the solution/edit path 
      unless current_user.nil? || current_user.company.nil?
        user_solution = current_user.company.solutions.find_by(id: params[:id])
        unless user_solution.nil?
          if @solution.id.to_s == user_solution.id.to_s
            redirect_to edit_solution_path(@solution)
          end
        end
      end
    end

    def set_random_solutions
      @random_solutions = Solution.company_solutions(@solution.company_id).order(Arel.sql('random()')).where.not(id: @solution.id).limit(2)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      params.require(:solution).permit(:title, :description, :picture, :num_validation, :validated, 
      :status, :industry_branch_ids, industry_branches_attributes: [:id, :industry_id, :name])
    end
end
