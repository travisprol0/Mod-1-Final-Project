class CreateSamplerSounds < ActiveRecord::Migration[5.2]
  def change
    create_table :sampler_sounds do |t|
      t.integer :sound_id
      t.integer :sampler_id
    end
  end
end
