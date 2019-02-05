class IndustryBranchesController < ApplicationController
  before_action :set_industry_branch, only: [:show, :edit, :update, :destroy]

  # GET /industry_branches
  # GET /industry_branches.json
  def index
    @industry_branches = IndustryBranch.all
  end

  # GET /industry_branches/1
  # GET /industry_branches/1.json
  def show
  end

  # GET /industry_branches/new
  def new
    @industry_branch = IndustryBranch.new
    @industries = Industry.all
  end

  # GET /industry_branches/1/edit
  def edit
  end

  # POST /industry_branches
  # POST /industry_branches.json
  def create
    @industry_branch = IndustryBranch.new(industry_branch_params)

    respond_to do |format|
      if @industry_branch.save
        format.html { redirect_to @industry_branch, notice: 'Industry branch was successfully created.' }
        format.json { render :show, status: :created, location: @industry_branch }
      else
        format.html { render :new }
        format.json { render json: @industry_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industry_branches/1
  # PATCH/PUT /industry_branches/1.json
  def update
    respond_to do |format|
      if @industry_branch.update(industry_branch_params)
        format.html { redirect_to @industry_branch, notice: 'Industry branch was successfully updated.' }
        format.json { render :show, status: :ok, location: @industry_branch }
      else
        format.html { render :edit }
        format.json { render json: @industry_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industry_branches/1
  # DELETE /industry_branches/1.json
  def destroy
    @industry_branch.destroy
    respond_to do |format|
      format.html { redirect_to industry_branches_url, notice: 'Industry branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry_branch
      @industry_branch = IndustryBranch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industry_branch_params
      params.require(:industry_branch).permit(:industry_id, :name)
    end
end
