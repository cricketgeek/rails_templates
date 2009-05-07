run "echo TODO > README"
run "rm public/index.html"
generate :nifty_layout

gem "thoughtbot-factory_girl", :lib => "factory_girl", :source =>  "http://gems.github.com"
gem "authlogic"
gem "lockdown", :version => "0.9.5"

rake "gems:install"

plugin "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
plugin "limerick_rake", :git => "git://github.com/thoughtbot/limerick_rake.git"
plugin "hoptoad_notifier", :git => "git://github.com/thoughtbot/hoptoad_notifier.git"

generate :rspec

git :init

file ".gitignore", <<-END
*.log
db/schema.rb
config/development.sphinx.conf
db/sphinx/*
log/*
tmp/**/*
db/*.sqlite3
public/system
*.DS_Store
coverage/*
*.swp
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => "."
git :commit => "-m 'initial commit'"




