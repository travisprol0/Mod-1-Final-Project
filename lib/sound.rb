class Sound < ActiveRecord::Base
    has_many :sampler_sounds
    has_many :samplers, through: :sampler_sounds
end