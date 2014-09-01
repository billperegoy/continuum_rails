class Regression < ActiveRecord::Base
  belongs_to :stage
  belongs_to :release
end
