class Transaction < ActiveRecord::Base
	belongs_to :expense
	belongs_to :exp_group
	belongs_to :vendor


	def self.search(term)
		if term
#			self.where("vendor.name LIKE ? or expense.name LIKE ?, or exp_group.name LIKE?", "%#{term}%", "%#{term}%", "%#{term}%")
			transactions = Vendor.where("name LIKE ?", "%#{term}%").map { |vendor| vendor.transactions }.flatten
			transactions += self.where("desc LIKE ?", "%#{term}%")
			transactions.uniq
		else
			self.all
		end
	end


	has_attached_file :photo_receipt, styles: { medium: "300x300>", thumb: "100x100>", small: "20x20>" }, default_url: "/images/:style/missing_receipt.png"
  validates_attachment_content_type :photo_receipt, content_type: /\Aimage\/.*\Z/
end
