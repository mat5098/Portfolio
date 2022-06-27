class Skill < ApplicationRecord
    validates_presence_of :title, :skill_level
end
