require 'forwardable'

module RiplWatir
  class Page
    attr_reader :browser
    extend Forwardable

    def_delegators :@browser, :title, :url, :html, :status, :refresh, :back

    def initialize browser
      @browser = browser
    end
  end
end