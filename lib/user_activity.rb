require "active_support"
require "user_activity/engine"

module UserActivity
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :activity_define

    def initialize
      @activity_define =  {}
    end
  end

  def tee_method
  	"Kraiyanat"
  end

  def user_for_user_activity
  	Struct.new(:name, :id).new("anonymus", "")
  end

  def activity_for_user_activity(controller, method)
    begin 
      configuration.activity_define[controller][method]
    rescue
      ""
    end
  end

  def log_user_activity
  	UserActivityLog.create(
  													user_id: user_for_user_activity.id,
  													user_name: user_for_user_activity.name,
  													action: params[:action],
  													controller: params[:controller],
  													activity: activity_for_user_activity(params[:controller], params[:action]),
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
end