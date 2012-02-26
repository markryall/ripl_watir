module RiplWatir
  class Page
    attr_reader :browser

    def initialize browser
      @browser = browser
    end
  end
end