require 'config/boot'

$:.unshift("#{RAILS_ROOT}/../../../../../rails/plugin_dependencies/lib")
begin
  require 'plugin_dependencies'
rescue Exception => e
end

Rails::Initializer.run do |config|
  config.plugin_paths.concat([
    "#{RAILS_ROOT}/../../..",
    "#{RAILS_ROOT}/../../../../migrations",
    "#{RAILS_ROOT}/../../../../../rails",
    "#{RAILS_ROOT}/../../../../../test",
    "#{RAILS_ROOT}/../../../../../third_party"
  ])
  config.plugins = [
    'loaded_plugins',
    'appable_plugins',
    'plugin_migrations',
    'has_states',
    'has_messages',
    'acts_as_tokenized',
    'nested_has_many_through',
    File.basename(File.expand_path("#{RAILS_ROOT}/../..")),
    'dry_validity_assertions'
  ]
  config.cache_classes = false
  config.whiny_nils = true
end
