require 'mini_magick'

background = MiniMagick::Image.open('proc_imgs/white.jpg')
img_collection = MiniMagick::Image.open('proc_imgs/white.jpg')

img_collection.combine_options do |c|
  c.resize '500x500'
  c.border 1
  c.bordercolor('black')
end

x_dim = img_collection.dimensions[0]
y_dim = img_collection.dimensions[1]
images = []

1.upto(6) do |num|
  images[num - 1] = MiniMagick::Image.open("imgs/#{num}.jpeg")
  images[num - 1].combine_options do |c|
    c.border 20
    c.bordercolor('black')
    c.resize '100x100'
  end
end

random_order = images.sample(6)

background.combine_options do |c|
  c.resize '1000x1000'
end

def create_collection(img_collection, random_images, x_dim, y_dim)
  x = 0
  y = 0
  0.upto(6) do |num|
    if num < 3
      img_collection = img_collection.composite(random_images[num]) do |c|
        c.compose 'Over' # OverCompositeOp
        c.geometry "+#{x}+#{y_dim / 6}" # copy second_image onto first_image from (20, 20)
        x += (x_dim / 3.to_f) % x_dim
      end
    elsif num < 6
      img_collection = img_collection.composite(random_images[num]) do |c|
        c.compose 'Over' # OverCompositeOp
        c.geometry "+#{y}+#{y_dim / 2}" # copy second_image onto first_image from (20, 20)
        y += (x_dim / 3.to_f) % x_dim
      end
    end
  end
  img_collection
end


print (1..30).to_a.sample(16)

mainx = background.dimensions[0]
mainy = background.dimensions[1]

background = background.composite(create_collection(img_collection, images.sample(6), x_dim, y_dim)) do |c|
  c.compose 'Over' 
  c.geometry "+0+0" 
end
background = background.composite(create_collection(img_collection, images.sample(6), x_dim, y_dim)) do |c|
  c.compose 'Over' 
  c.geometry "+#{mainx / 2}+0" 
end
background = background.composite(create_collection(img_collection, images.sample(6), x_dim, y_dim)) do |c|
  c.compose 'Over' 
  c.geometry "+0+#{mainy / 2}" 
end
background = background.composite(create_collection(img_collection, images.sample(6), x_dim, y_dim)) do |c|
  c.compose 'Over' 
  c.geometry "+#{mainx / 2}+#{mainy / 2}" 
end
# background = background.composite(create_collection(img_collection, random_order, x_dim, y_dim)) do |c|
#   c.compose 'Over' 
#   c.geometry "+#{mainx * 2}+#{mainy / 6}" 
# end

background.write('proc_imgs/output.jpg')
