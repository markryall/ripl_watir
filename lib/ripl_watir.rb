require 'watir-webdriver'
require 'forwardable'

module Pages
end

module RiplWatir
  class << self
    attr_accessor :browser

    def create
      @browser = ::Watir::Browser.new ENV['WEBDRIVER'] || :firefox
    end
  end

  class Page
    attr_reader :browser
    extend Forwardable

    def_delegators :@browser, :title, :url, :html, :status, :refresh, :back

    def initialize browser
      @browser = browser
    end
  end

  module Commands
    def classify s
      s.to_s.split('_').map(&:capitalize).join
    end

    def page_class *args
      page = RiplWatir::Page.new RiplWatir.browser
      if ENV['RIPL_WATIR_RELOAD']
        load "pages/#{args.join '/'}.rb"
      else
        require "pages/#{args.join '/'}"
      end
      mod = Pages
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