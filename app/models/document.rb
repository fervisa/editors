class Document < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :pages
end
