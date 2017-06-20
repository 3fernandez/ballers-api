interactions_path = "#{Rails.configuration.root}/app/interactions/*"
Rails.configuration.autoload_paths += Dir.glob(interactions_path)
