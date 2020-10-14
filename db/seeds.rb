Sound.delete_all
Sampler.delete_all
SamplerSound.delete_all


dog = Sound.create(emoji: "🐶", noise: "woof")
cat = Sound.create(emoji: "🐱", noise: "meow")
frog = Sound.create(emoji: "🐸", noise: "ribbit")
lion = Sound.create(emoji: "🦁", noise: "rawr")
cow = Sound.create(emoji: "🐮", noise: "mooo")
duck = Sound.create(emoji: "🦆", noise: "quack")

guitar = Sound.create(emoji: "🎸", noise: "guitar")
piano = Sound.create(emoji: "🎹", noise: "piano")
trumpet = Sound.create(emoji: "🎺", noise: "trumpet")
violin = Sound.create(emoji: "🎻", noise: "violin")
banjo = Sound.create(emoji: "🪕", noise: "banjo")
sax = Sound.create(emoji: "🎷", noise: "saxophone")

animals = Sampler.create(name: "Animals")
music = Sampler.create(name: "Music")


SamplerSound.create(sound: dog, sampler: animals)
SamplerSound.create(sound: cat, sampler: animals)
SamplerSound.create(sound: frog, sampler: animals)
SamplerSound.create(sound: duck, sampler: animals)

SamplerSound.create(sound: guitar, sampler: music)
SamplerSound.create(sound: piano, sampler: music)
SamplerSound.create(sound: trumpet, sampler: music)
SamplerSound.create(sound: violin, sampler: music)

fire = Sound.create(emoji: "🔥", noise: "fire")
bowling = Sound.create(emoji: "🎳", noise: "bowling")
snare = Sound.create(emoji: "🥁", noise: "snare")
heart = Sound.create(emoji: "💗", noise: "heart")