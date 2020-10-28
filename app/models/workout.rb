class Workout < ActiveRecord::Base
    belongs_to :user
    validates :name, :time, :workout_type, presence: true
end