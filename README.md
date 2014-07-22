# [CDN Image Helper](https://github.com/techbang/cdn_image_helper)

## Installation

In the `Gemfile`:

    gem "cdn_image_helper", :git => "git://github.com/techbang/cdn_image_helper.git", :tag => "0.0.2"

In an initilizer, e.g. `config/initializers/asset_host.rb`:

    CdnImageHelper.app_url  = "http://www.techbang.com"
    CdnImageHelper.cdn_host = "http://cdn%d.techbang.com"

## Changelog

### 0.0.3

* `render_with_cdn_images` helper now defually does not resize images

### 0.0.2

* Match *.tw and escape dots
* The same path should have the same cdn host

### 0.0.1

* extract cdn_image_helper from techbang

## License

Copyright (c) 2012 Techbang, http://www.techbang.com/

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
