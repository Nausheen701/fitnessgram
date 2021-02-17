class Course < ActiveRecord::Base
    belongs_to :instructors
    has_many :users
end