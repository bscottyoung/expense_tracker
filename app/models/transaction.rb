class Transaction < ActiveRecord::Base
	belongs_to :expense
	belongs_to :exp_group
	belongs_to :vendor

	def self.search(term)
		if term
			#binding.pry
			self.where("desc LIKE ?", "%#{term}%")
		else
			self.all
		end
	end
#			self.where("vendor.name LIKE ? or expense.name LIKE ?, or exp_group.name LIKE?", "%#{term}%", "%#{term}%", "%#{term}%")
			#transactions = Vendor.where("name LIKE ?", "%#{term}%").map { |vendor| vendor.transactions }.flatten
# binding.pry
			#transactions=self.where("desc LIKE ?", "%#{term}%")
			# binding.pry
			# transactions.uniq
			# binding.pry


	# def self.search1(term)
	# 		 binding.pry
	# 		if term
	# 			transactions = Vendor.where("name LIKE ?", "%#{term}%").map { |vendor| vendor.transactions }.flatten
	# 		# binding.pry
	# 		else
	# 			self.all
	# 		# binding.pry
	# 	end
	# end



	has_attached_file :photo_receipt, styles: { medium: "300x300>", thumb: "100x100>", small: "20x20>" }, default_url: "/images/:style/missing_receipt.png"
  validates_attachment_content_type :photo_receipt, content_type: /\Aimage\/.*\Z/
end
