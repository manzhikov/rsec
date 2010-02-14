Gem::Specification.new do |s|
  s.name = "rsec"
  s.version = "0.0.2"
  s.author = "NS"
  s.email = "usurffx@gmail.com"
  s.homepage = "http://wiki.github.com/luikore/rsec"
  s.platform = Gem::Platform::RUBY
  s.summary = "Parsec implementation for ruby, aim to be simple and fast. 1.9 only."
  s.description = "yet another parsec implementation for ruby"
  s.required_ruby_version = ">=1.9.0"

  s.files = Dir.glob("{license.txt,readme.rdoc,lib/**/*.rb,example/*.rb}")
  s.require_paths = ["lib"]
  s.rubygems_version = '1.3.5'
  # s.has_rdoc = true
  s.extra_rdoc_files = ["readme.rdoc"]
end

