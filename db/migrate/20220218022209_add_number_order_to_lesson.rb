class AddNumberOrderToLesson < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :number_order, :integer
  end
end
