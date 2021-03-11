class User < ActiveRecord::Base    # belongs_to :course
    has_many :daily_updates

    has_secure_password



end