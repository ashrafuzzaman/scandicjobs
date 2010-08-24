Refinery::Plugin.register do |plugin|
  plugin.title = "Job Categories"
  plugin.name = "job_categories"
  plugin.description = "Manage Job Categories"
  plugin.version = 1.0
  plugin.activity = {
    :class => JobCategory,
    :url_prefix => "edit",
    :title => 'title'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end
