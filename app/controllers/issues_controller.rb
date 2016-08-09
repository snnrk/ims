class IssuesController < ApplicationController
  before_action :set_issue, only: [:destroy, :edit, :show, :update]
  
  def destroy
    @issue.destroy
    flash[:success] = t(:issue_delete_success)
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
  
  def show
  end

  def update
    @issue.update(issue_params)
    if @issue.save
      redirect_to @issue
    else
      render 'edit'
    end
  end

  private
  
  def issue_params
    params.require(:issue).permit(:title, :impact, :fired_time, :recovered_time, :start_time, :ending_time)
  end

  def set_issue
    @issue = Issue.find(params[:id])
  end
end
