require 'watir-webdriver'
require 'ripl_watir/page'

module RiplWatir
  class << self
    attr_accessor :browser
  end

  module Array
    def classify
      self.map(&:classify).join('::')
    end
  end

  module Commands
    def classify s
      s.to_s.split('_').map(&:capitalize).join
    end

    def page_class *args
      page = Page.new RiplWatir.browser
      require "ripl_watir/#{args.join '/'}"
      mod = RiplWatir
      args.each do |name|
        mod = mod.const_get classify name
      end
      page.extend mod
      page
    end

    def on_page *args
      page_class(*args).tap do |p|
        yield p if block_given?
      end
    end

    def visit_page *args
      on_page(*args) do |p|
        p.goto
        yield p if block_given?
      end
    end
  end
end