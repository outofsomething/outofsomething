#!/usr/bin/env ruby
# encoding: UTF-8
# run with the command 'rackup'
require 'sinatra/base'
require 'sinatra/assetpack'
require 'less'

class OutOfSomething < Sinatra::Base
  set :root, File.dirname(__FILE__) # You must set app root
  configure do
    set :site_name, "Out of Something, LLC"
  end

  register Sinatra::AssetPack

  assets {
    serve '/js',     from: 'app/js'        # Default
    serve '/css',    from: 'app/css'       # Default
    serve '/fonts',  from: 'app/fonts'     # Default
    serve '/images', from: 'app/images'    # Default

    # The second parameter defines where the compressed version will be served.
    # (Note: that parameter is optional, AssetPack will figure it out.)
    # The final parameter is an array of glob patterns defining the contents
    # of the package (as matched on the public URIs, not the filesystem)
    js :app, '/js/app.js', [
      '/js/vendor/**/*.js',
      '/js/lib/**/*.js'
    ]

    css :application, '/css/application.css', [
      '/css/*.css'
    ]

    js_compression  :jsmin
    css_compression :simple
  }

  get '/' do
    @projects = [
        { slug: "out-of-pages",
          href: "outofpages.com",
          hero: "out-of-pages-hero.png",
          wordmark: "out-of-pages-wordmark.svg",
          tagline: "Subscriptions to notebooks for people who like to think on paper." },
        { slug: "out-of-the-loop",
          href: "ootheloop.com",
          hero: "out-of-the-loop-hero.png",
          wordmark: "out-of-the-loop-wordmark.svg",
          tagline: 'Simple facts about <span style="no-wrap;">the greatest city on Earth.</span>' },
      ]
    erb :index, :locals => {projects: @projects}
  end
end
