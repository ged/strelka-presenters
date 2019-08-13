# -*- encoding: utf-8 -*-
# stub: strelka-presenters 0.1.0.pre20190812202657 ruby lib

Gem::Specification.new do |s|
  s.name = "strelka-presenters".freeze
  s.version = "0.1.0.pre20190812202657"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Granger".freeze]
  s.cert_chain = ["certs/ged.pem".freeze]
  s.date = "2019-08-13"
  s.description = "".freeze
  s.email = ["ged@FaerieMUD.org".freeze]
  s.extra_rdoc_files = ["History.md".freeze, "LICENSE.txt".freeze, "Manifest.txt".freeze, "README.md".freeze, "History.md".freeze, "README.md".freeze]
  s.files = [".document".freeze, ".rdoc_options".freeze, ".simplecov".freeze, "ChangeLog".freeze, "History.md".freeze, "LICENSE.txt".freeze, "Manifest.txt".freeze, "README.md".freeze, "Rakefile".freeze, "lib/strelka/app/presenters.rb".freeze, "lib/strelka/httpresponse/presenters.rb".freeze, "lib/strelka/presenters.rb".freeze, "spec/spec_helper.rb".freeze, "spec/strelka/app/presenters_spec.rb".freeze, "spec/strelka/httpresponse/presenters_spec.rb".freeze, "spec/strelka/presenters_spec.rb".freeze, "spec/testlib.rb".freeze, "spec/testlib/base.rb".freeze, "spec/testlib/fixtures.rb".freeze, "spec/testlib/fixtures/groups.rb".freeze, "spec/testlib/fixtures/users.rb".freeze, "spec/testlib/group.rb".freeze, "spec/testlib/presenters.rb".freeze, "spec/testlib/user.rb".freeze]
  s.homepage = "https://bitbucket.org/ged/strelka-presenters".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<strelka>.freeze, ["~> 0.16"])
      s.add_runtime_dependency(%q<yaks>.freeze, ["~> 0.13"])
      s.add_runtime_dependency(%q<faker>.freeze, ["~> 2.1"])
      s.add_runtime_dependency(%q<fluent_fixtures>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
      s.add_development_dependency(%q<hoe-deveiate>.freeze, ["~> 0.10"])
      s.add_development_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.17"])
      s.add_development_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0.1"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.18"])
    else
      s.add_dependency(%q<strelka>.freeze, ["~> 0.16"])
      s.add_dependency(%q<yaks>.freeze, ["~> 0.13"])
      s.add_dependency(%q<faker>.freeze, ["~> 2.1"])
      s.add_dependency(%q<fluent_fixtures>.freeze, ["~> 0.8"])
      s.add_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
      s.add_dependency(%q<hoe-deveiate>.freeze, ["~> 0.10"])
      s.add_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.17"])
      s.add_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0.1"])
      s.add_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.18"])
    end
  else
    s.add_dependency(%q<strelka>.freeze, ["~> 0.16"])
    s.add_dependency(%q<yaks>.freeze, ["~> 0.13"])
    s.add_dependency(%q<faker>.freeze, ["~> 2.1"])
    s.add_dependency(%q<fluent_fixtures>.freeze, ["~> 0.8"])
    s.add_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
    s.add_dependency(%q<hoe-deveiate>.freeze, ["~> 0.10"])
    s.add_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.17"])
    s.add_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0.1"])
    s.add_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.18"])
  end
end
