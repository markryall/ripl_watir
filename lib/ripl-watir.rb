require 'ripl'
require 'watir-webdriver'

module Ripl
  module Watir
    @browser = ::Watir::Browser.new
    class << self
      attr_reader :browser
    end

    module Commands
      def on_page *args
        puts "creating page #{args.inspect}"
      end

      def visit_page *args
        puts "visiting #{args.inspect}"
      end
    end
  end
end

Ripl::Commands.include Ripl::Watir::Commands
browser = Ripl::Watir.browser
Ripl.start :binding => binding