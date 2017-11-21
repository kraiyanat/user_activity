require "active_support"
require "user_activity/engine"

module UserActivity
  def tee_method
  	"Kraiyanat"
  end

  def user_for_user_activity
  	@current_user || Struct.new(:name, :id).new("anonymus", "")
  end

  def activity_for_user_activity(controller, method)
    activity_hash = {}
    activity_hash[["aa", "bb"]] = "cc"

    activity_hash[[controller.to_s, method.to_s]].to_s
  end

  def log_user_activity
  	UserActivityLog.create(
  													user_id: user_for_user_activity.id,
  													user_name: user_for_user_activity.name,
  													action: params[:action],
  													controller: params[:controller],
  													activity: activity_for_user_activity("aa", "bb"),
  													http_request: "#{request.method} #{request.url} #{request.params}"
  												)
  end

  def self.included(klass)
  	klass.extend ClassMethods
  end

  module ClassMethods
  end
end

ActiveSupport.on_load(:action_controller) do 
  include UserActivity
  before_action :log_user_activity
end