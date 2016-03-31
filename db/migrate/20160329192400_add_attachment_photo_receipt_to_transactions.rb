class AddAttachmentPhotoReceiptToTransactions < ActiveRecord::Migration
  def self.up
    change_table :transactions do |t|
      t.attachment :photo_receipt
    end
  end

  def self.down
    remove_attachment :transactions, :photo_receipt
  end
end
