dog = Sound.create(emoji: "🐶", noise: "woof")
cat = Sound.create(emoji: "🐱", noise: "meow")
frog = Sound.create(emoji: "🐸", noise: "ribbbbiiiit")
fox = Sound.create(emoji: "🦊", noise: "rooooor")
cow = Sound.create(emoji: "🐮", noise: "mooo")
duck = Sound.create(emoji: "🦆", noise: "quack!!!")

guitar = Sound.create(emoji: "🎸", noise: "guitar")
piano = Sound.create(emoji: "🎹", noise: "piano")
trumpet = Sound.create(emoji: "🎺", noise: "trumpet")
violen = Sound.create(emoji: "🎻", noise: "violin")
banjo = Sound.create(emoji: "🪕", noise: "banjo")
sax = Sound.create(emoji: "🎷", noise: "Saxophone")

animals = Sampler.create(name: "Animals")
music = Sampler.create(name: "Music")

animals_sampler = SamplerSound.create(sound_id: 38, sampler_id: 8)

# SamplerSound.new()


-----------
| 🐶 | 🐱 |
-----------
| 🐸 | 🦊 |
-----------

Use numbers to select an emoji. 1 is the top left, 4 is the bottom right.