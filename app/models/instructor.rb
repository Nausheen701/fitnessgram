class Instructor < ActiveRecord::Base
    has_many :courses
    # has_many :users, through: :courses
end