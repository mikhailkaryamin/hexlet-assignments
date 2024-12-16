require_relative "lib/blog/version"

Gem::Specification.new do |spec|
  spec.name        = "blog"
  spec.version     = Blog::VERSION
  spec.authors     = ["Alexander Veselov"]
  spec.email       = ["collabsis.g@gmail.com"]
  spec.homepage    = ""
  spec.summary     = "Summary of Blog."
  spec.description = "Description of Blog."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1"
end
