# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cdn_image_helper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["xdite"]
  gem.email         = ["xdite@techbang.com.tw"]
  gem.description   = %q{CDN image replacement helper for tinymce's content}
  gem.summary       = %q{CDN image replacement helper for tinymce's content}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "cdn_image_helper"
  gem.require_paths = ["lib"]
  gem.version       = CdnImageHelper::VERSION
end
