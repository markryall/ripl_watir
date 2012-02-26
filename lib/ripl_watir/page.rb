require 'delegate'

module RiplWatir
  class Page < DelegateClass Watir::Browser
    def initialize browser
      @browser = browser
      super browser
    end
  end
end