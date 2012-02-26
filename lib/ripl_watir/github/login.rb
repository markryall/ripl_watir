require 'watir-page-helper'

module RiplWatir::Github
end

module RiplWatir::Github::Login
  extend WatirPageHelper::ClassMethods

  text_field :email, id: 'login_field'
  text_field :password, id: 'password'
  button :submit, value: 'Log in'

  def login email, password
    self.email = email
    self.password = password
    self.submit
  end
end