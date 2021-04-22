require 'mini_magick'

background = MiniMagick::Image.open('proc_imgs/white.jpg')
img_collection = MiniMagick::Image.open('proc_imgs/white.jpg')

img_collection.combine_options do |c|
  c.resize '400x400'
  c.border 10
  c.bordercolor('blue')
end
x_dim = img_collection.dimensions[0]
y_dim = img_collection.dimensions[1]
images = []

1.upto(5) do |num|
  images[num - 1] = MiniMagick::Image.open("imgs/#{num}.jpeg")
  images[num - 1].combine_options do |c|
    c.border 20
    c.bordercolor('black')
    c.resize '100x100'
  end
end

random_order = images.sample(5)

background.combine_options do |c|
  c.resize '1000x1000'
end
x = 0
y = 0
0.upto(4) do |num|
  if num < 3
    img_collection = img_collection.composite(random_order[num]) do |c|
      c.compose 'Over' # OverCompositeOp
      c.geometry "+#{x}+#{y_dim / 6}" # copy second_image onto first_image from (20, 20)
      x += (x_dim / 3.to_f) % x_dim
    end
  elsif num < 5
    img_collection = img_collection.composite(random_order[num]) do |c|
      c.compose 'Over' # OverCompositeOp
      c.geometry "+#{y}+#{y_dim / 2}" # copy second_image onto first_image from (20, 20)
      y += (x_dim / 3.to_f) % x_dim
    end
  end
end

# 3.upto(4) do |num|
#   y = 200 / 8.to_f
#   y += num * 60
#   img_collection = img_collection.composite(random_order[num]) do |c|
#     c.compose 'Over' # OverCompositeOpend
#     c.geometry "+#{y}+80" # copy second_image onto first_image from (20, 20)
#   end
# end

# img_collection = img_collection.composite(random_order[0]) do |c|
#   c.compose 'Over' # OverCompositeOp
#   c.geometry '+10+20' # copy second_image onto first_image from (20, 20)
# end

# img_collection = img_collection.composite(random_order[1]) do |c|
#   c.compose 'Over'    # OverCompositeOp
#   c.geometry '+80+20' # copy second_image onto first_image from (20, 20)
# end

# img_collection = img_collection.composite(random_order[2]) do |c|
#   c.compose 'Over'    # OverCompositeOp
#   c.geometry '+140+20' # copy second_image onto first_image from (20, 20)
# end

# img_collection = img_collection.composite(random_order[3]) do |c|
#   c.compose 'Over' # OverCompositeOp
#   c.geometry '+10+80' # copy second_image onto first_image from (20, 20)
# end

# img_collection = img_collection.composite(random_order[4]) do |c|
#   c.compose 'Over' # OverCompositeOp
#   c.geometry '+80+80' # copy second_image onto first_image from (20, 20)
# end

# img_collection = img_collection.composite(random_order[0]) do |c|
#   c.compose 'Over' # OverCompositeOp
#   c.geometry '+140+80' # copy second_image onto first_image from (20, 20)
# end

background = background.composite(img_collection)

background.write('proc_imgs/output.jpg')
