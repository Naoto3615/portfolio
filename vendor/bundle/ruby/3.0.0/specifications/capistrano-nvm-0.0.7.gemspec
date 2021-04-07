# -*- encoding: utf-8 -*-
# stub: capistrano-nvm 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-nvm".freeze
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Koen Punt".freeze]
  s.date = "2017-03-22"
  s.description = "nvm support for Capistrano 3.x".freeze
  s.email = ["me@koen.pt".freeze]
  s.homepage = "https://github.com/koenpunt/capistrano-nvm".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.15".freeze
  s.summary = "nvm support for Capistrano 3.x".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<capistrano>.freeze, ["~> 3.1"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<capistrano>.freeze, ["~> 3.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
