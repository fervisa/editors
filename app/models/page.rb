class Page < ActiveRecord::Base
  belongs_to :document
  attr_accessible :body, :header
end
