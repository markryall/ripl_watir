# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "ripl-watir"
  s.version     = '0.0.4'
  s.authors     = ["Mark Ryall"]
  s.email       = ["mark@ryall.name"]
  s.homepage    = "https://github.com/markryall/ripl_watir"
  s.summary     = %q{watir repl for efficiently creating page objects}
  s.description = <<EOF
A ripl plugin to provide an interactive shell for creating page objects
to build an automated testing infrastructure for a site.
EOF

  s.rubyforge_project = "ripl-watir"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "ripl"
  s.add_runtime_dependency "watir-webdriver"

  s.add_development_dependency "rake"
end
