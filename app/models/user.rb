class User < ActiveRecord::Base
    belongs_to :courses
    # belongs_to :instructors, through: :courses
end