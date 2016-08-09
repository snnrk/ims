class IssuesController < ApplicationController
  def index
    @user = User.find(params[:user_id]) || current_user
    @issues = @user.written_issues
  end
end
