class User < ActiveRecord::Base    # belongs_to :course
    has_many :daily_updates
    # belongs_to :instructors, th_rough: :courses

    has_secure_password
# adds salt to randomize passwor
# comes from Active Record


end