require "active_support"
require "user_activity/engine"

module UserActivity
  def tee_method
  	"Kraiyanat"
  end

  def user_for_user_activity
  	@current_user || Struct.new(:name, :id).new("anonymus", "")
  end

  def log_user_activity
  	UserActivityLog.create(
  													user_id: user_for_user_activity.id,
  													user_name: user_for_user_activity.name,
  													action: params[:action],
  													controller: params[:controller],
  													activity: "",
  													http_request: request.body.read
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