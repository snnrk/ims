class IssuesController < ApplicationController
  before_action :logged_in_user
  before_action :set_issue, only: [:destroy, :edit, :show, :update]
  
  def create
    @issue = Issue.new(issue_params)
    @issue.author = current_user
    if @issue.save
      flash[:success] = t(:issue_create_success)
      redirect_to @issue
    else
      render 'new'
    end
  end

  def destroy
    @issue.destroy
    flash[:success] = t(:issue_destroy_success)
    redirect_to issues_path
  end

  def edit
  end

  def index
    if (params[:user_id].present?)
      @user = User.find(params[:user_id]) || current_user
      @issues = @user.written_issues
    else
      @issues = Issue.all
    end
  end
  
  def new
    @issue = Issue.new
  end
  
  def show
  end

  def update
    @issue.update(issue_params)
    if @issue.save
      flash[:success] = t(:issue_update_success)
      redirect_to @issue
    else
      render 'edit'
    end
  end

  private
  
  def issue_params
    params.require(:issue).permit(:title, :impact, :fired_time, :recovered_time, :start_time, :ending_time, :assigned_id)
  end

  def set_issue
    @issue = Issue.find(params[:id])
  end
end
