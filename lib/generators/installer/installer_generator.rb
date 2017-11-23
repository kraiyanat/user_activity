class InstallerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    copy_file "user_activity.rb", "config/initializers/user_activity.rb"
  end

  def copy_activity_definition_file
    copy_file "user_activity.yml", "config/user_activity.yml"
  end
end
