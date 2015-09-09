class ScoperGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  def generate_scoper
    template 'scoper.rb', File.join('app', 'scopers', class_path, "#{file_name}_scoper.rb")
  end
  
end
