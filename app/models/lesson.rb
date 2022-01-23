class Lesson < ApplicationRecord
    validates_presence_of :name , :content
end
