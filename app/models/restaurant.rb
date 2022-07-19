class Restaurant < ApplicationRecord 
	has_many :menus , dependent: :destroy
	 accepts_nested_attributes_for :menus
end
