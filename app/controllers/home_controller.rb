class HomeController < ApplicationController
  def index
    #@solutions = Solution.all.paginate(:page => params[:page], :per_page => 16).order('created_at DESC')
    # This select another layout for homepage, in that layout the navbar is not rendering
    #respond_to do |format|
      #format.html { render :layout => 'home_layout' }
    #end
  end

  def jobs
    # Show a view with information about jobs for joining to the team.
    #respond_to do |format|
      #format.html { render :layout => 'home_layout' }
    #end
  end

  def info
    # Show a view with information about the site and motivate the people for sign_up
  end

  def contact
    # Show a view with contact the user
  end
end
