class Course < ActiveRecord::Base
    belongs_to :instructor
    has_many :user
end