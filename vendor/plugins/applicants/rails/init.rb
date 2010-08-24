Refinery::Plugin.register do |plugin|
  plugin.title = "Applicants"
  plugin.name = "applicants"
  plugin.description = "Manage Applicants"
  plugin.version = 1.0
  plugin.activity = {
    :class => Applicant,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end
