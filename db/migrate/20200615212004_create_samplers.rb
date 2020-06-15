class CreateSamplers < ActiveRecord::Migration[5.2]
  def change
    create_table :samplers do |t|
      t.string :name
    end
  end
end
