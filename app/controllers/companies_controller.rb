class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy, :upload_logo, :your_solutions]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authenticate_company!, only: [:new, :create]
  before_action :authenticate_owner!, only: [:edit, :update, :destroy, :upload_logo, :your_solutions]
  before_action :has_company!, only: [:your_solutions]
  before_action :has_solutions!, only: [:show]
  before_action :authenticate_company_profile, only:[:show]
  before_action(only: [:show, :your_solutions]) {
    |c| c.set_clients(@company.solutions)
  }


  def thanks_message
  end
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @home_page = true
    @solutions = @company.solutions.order('created_at')
  end

  # GET /companies/new
  def new
    @home_page = true
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @home_page = true
    @industries = Industry.all
  end
  
  # CREATE A NEW SOLUTIONS
  def your_solutions
    @home_page = true
    @industry_branches = IndustryBranch.all
    @solutions = @company.solutions.order('created_at')
  end

  # GET /companies/1/upload_logo
  def upload_logo
    # Is for upload a logo when the first time it has created a company
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = current_user.create_company(company_params)
    industry_id = company_params[:industry_ids]
    
    if industry_id.empty? || industry_id.nil?
      @company.valid?
      render :action => "new"
      return
    else
      @company.industries << Industry.find(company_params[:industry_ids])
    end

    respond_to do |format|
      if @company.save
        format.html { redirect_to your_solutions_company_path(@company), notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to your_solutions_company_path(@company), notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def authenticate_company!
      # A user only has one Company.
      if current_user.company != nil
        redirect_to your_solutions_company_path(current_user.company), notice: "Ya tienes una compañia.", status: :unauthorized
      end
    end

    def authenticate_company_profile
      # Redirect to your solutions if the company/show is the owner
      unless current_user.nil? || current_user.company.nil?
        if current_user.company.id.to_s == params[:id].to_s
          redirect_to your_solutions_company_path(current_user.company)
        end
      end
    end

    def has_solutions!
      if not current_user.nil?
        if not current_user.company.nil? 
        	solutions_count = current_user.company.solutions.count
        	if solutions_count == 0 && current_user.company.id.to_s == params[:id].to_s
	          redirect_to your_solutions_company_path
	        end
        end
      end
    end

    def has_company!
		unless current_user.nil?
		  if current_user.company.nil?
		    redirect_to new_company_path, notice: "Debes registrar una compañia."
		  end
		end
    end

    def authenticate_owner!
      if current_user.company != nil
        if current_user.company.id.to_s != params[:id].to_s
          redirect_to your_solutions_company_path(current_user.company), notice: "No estas autorizado para entrar allí.", status: :unauthorized
        end
      else
        redirect_to new_company_path, notice: "Debes registrar una compañia.", status: :unauthorized
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      # erase the user_id because is create for the current_user
      params.require(:company).permit(:name, :description, :address, :total_validation, :logo, :status, :industry_ids)
    end
end
