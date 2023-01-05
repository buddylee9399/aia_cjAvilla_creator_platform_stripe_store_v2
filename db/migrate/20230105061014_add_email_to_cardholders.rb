class AddEmailToCardholders < ActiveRecord::Migration[7.0]
  def change
    add_column :cardholders, :email, :string
  end
end
