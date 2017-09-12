Rails.application.config.assets.precompile += %w( docs.js dashboard.css bootstrap3.css bootstrap3.js gmap-settings.js script.js)
Rails.application.config.assets.precompile += %w(templates/* )
Rails.application.config.assets.precompile += %w( *.png *.jpg *.jpeg *.gif svg *.eot *.woff *.woff2 *.ttf templates/identity/fonts/* font-awesome.min.css google_analytics.js )
