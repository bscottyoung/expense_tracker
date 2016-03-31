class Vendor < ActiveRecord::Base
	has_many :transactions
	belongs_to :exp_group
	belongs_to :expense

	def self.search(term)
		if term
			self.where("name LIKE ?", "%#{term}%")
		else
			self.all
		end
	end
end
