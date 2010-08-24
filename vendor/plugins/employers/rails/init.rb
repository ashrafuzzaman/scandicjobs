Refinery::Plugin.register do |plugin|
  plugin.title = "Employers"
  plugin.name = "employers"
  plugin.description = "Manage Employers"
  plugin.version = 1.0
  plugin.activity = {
    :class => Employer,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end
