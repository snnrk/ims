class StaticPagesController < ApplicationController
  def home
    @issues = current_user.written_issues
  end
  
  def top
  end
end
