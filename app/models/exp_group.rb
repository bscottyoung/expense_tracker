class ExpGroup < ActiveRecord::Base
	has_many :expenses
	has_many :transactions
	has_many :vendors

	def self.search(term)
		if term
			self.where("vendor.name LIKE ?", "%#{term}%")
		else
			self.all
		end
	end

end
