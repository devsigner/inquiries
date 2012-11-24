class CreateInquiries < ActiveRecord::Migration
  def up
    unless Inquiries::Inquiry.table_exists?
      create_table :inquiries, :force => true do |t|
        t.string   :name
        t.string   :email
        t.text     :message
        t.boolean  :spam,     :default => false
        t.timestamps
      end
    end
  end

  def down
     drop_table :inquiries
  end
end