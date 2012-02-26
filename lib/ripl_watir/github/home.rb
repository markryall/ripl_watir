require 'watir-page-helper'

module RiplWatir::Github
end

module RiplWatir::Github::Home
  extend WatirPageHelper::ClassMethods

  direct_url 'github.com'
  link :login, text: 'Login'

  def logged_in?
    browser.div(id: 'user').exists?
  end
end