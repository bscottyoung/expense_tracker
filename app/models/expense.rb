class Expense < ActiveRecord::Base
	belongs_to :exp_group
	has_many :transactions
	has_many :vendors

	def self.search(term)
		if term
#			self.where("vendor.name LIKE ? or expense.name LIKE ?, or exp_group.name LIKE?", "%#{term}%", "%#{term}%", "%#{term}%")
			self.where("name LIKE ?", "%#{term}%")
		else
			self.all
		end
	end


end
