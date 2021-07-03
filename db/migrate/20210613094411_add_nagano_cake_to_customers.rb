class AddNaganoCakeToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name_kana, :string, null: false, default: ''
  end
end
