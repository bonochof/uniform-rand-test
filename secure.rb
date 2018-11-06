require 'dxruby'
require 'securerandom'

RANGE = 1000
NUM = 500000

# create rand
cnt = Array.new(RANGE, 0)
NUM.times do
  r = SecureRandom.random_number(RANGE)
  cnt[r] += 1
end

image = Image.new(1, 1, C_WHITE)
Window.caption = "rand test (secure)"
Window.width = RANGE
Window.height = 600
Window.loop do
  break if Input.key_push?(K_ESCAPE)

  # display
  RANGE.times do |x|
    cnt[x].times do |y|
      Window.draw(x, Window.height - y, image)
    end
  end
end
