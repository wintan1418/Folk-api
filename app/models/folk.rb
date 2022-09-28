class Folk < ApplicationRecord
    validates :name, length: {minimum: 2}
    validates :location, length: {minimum: 5}
    validates :email, length: {minimum: 5}
    validates :twitter, length: {minimum: 2}
    validates :phone, length: {is: 9}, numericality: true
end
