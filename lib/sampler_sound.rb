class SamplerSound < ActiveRecord::Base
    belongs_to :sound
    belongs_to :sampler
end