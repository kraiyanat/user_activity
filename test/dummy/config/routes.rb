Rails.application.routes.draw do
  mount UserActivity::Engine => "/user_activity"
end
