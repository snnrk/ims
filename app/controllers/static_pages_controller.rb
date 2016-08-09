class StaticPagesController < ApplicationController
  def home
    @issues = current_user.written_issues + current_user.assigned_issues
    @issues.uniq.sort{|a, b| a.id <=> b.id}
  end
  
  def top
  end
end
