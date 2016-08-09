crumb :home do
  link t(:home), home_path
end

crumb :user do |user|
  link user.displayname, user
  parent :home
end

crumb :issues do
  link t(:crumb_issues), issues_path
  parent :home
end

crumb :issue do |issue|
  link "#" + issue.id.to_s, issue
  parent :issues
end
