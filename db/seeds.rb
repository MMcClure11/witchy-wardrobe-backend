# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c1 = Category.create(name: "Outer Wear")
c2 = Category.create(name: "Tops")
c3 = Category.create(name: "Bottoms")
c4 = Category.create(name: "Foot Wear")
c5 = Category.create(name: "Accessories")
c6 = Category.create(name: "Intimates")

i1 = Item.create(name: "Ace Tux Blazer", 
  color: "Grey",
  image: "https://www.wildfang.com/media/catalog/product/cache/image/555x777/beff4985b56e3afdbeabfc89641a4582/8/-/8-xacetuxblazerinlightgrey.jpg", 
  cost: 178.00,
  times_used: 4,
  date_purchased: "2020-08-21",
  manufacture_location: "Vietnam",
  store: "Wildfang",
  category_id: 1)

i2 = Item.create(name: "3/4 Striped Shirt", 
  color: "Blue",
  image: "https://i.ebayimg.com/images/g/6cUAAOSwoPBdPHtg/s-l300.jpg", 
  cost: 4.99,
  times_used: 23,
  date_purchased: "2019-10-12",
  manufacture_location: "Idia",
  store: "Goodwill",
  category_id: 2)

i3 = Item.create(name: "Kasey Short Sleeve", 
  color: "Navy",
  image: "https://images.squarespace-cdn.com/content/v1/54715a5ee4b0222913424334/1590292994746-XUC4FVBKJC5WZG9GKC4L/ke17ZwdGBToddI8pDm48kAifWbT7ZXvvxsciUv0S7ux7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UQjpbEo6XTTrgB-htA25bBEy0oLK84603rJROfj_2IiEJZ0tmJreWGAR6J0td7EoUw/The%2BKacey%2BButton%2BUp%2BAndrogynous%2BFox%2B3.jpg?format=500w", 
  cost: 59.35,
  times_used: 2,
  date_purchased: "2020-08-21",
  manufacture_location: "Vietnam",
  store: "Androgynous Fox",
  category_id: 2)

i4 = Item.create(name: "Tan Skinny Jeans", 
  color: "Tan",
  image: "https://assets.theplace.com/image/upload/t_plp_img_m,f_auto,q_auto/v1/ecom/assets/products/tcp/2057032/2057032_FX.jpg", 
  cost: 3.99,
  times_used: 56,
  date_purchased: "2019-08-30",
  manufacture_location: "China",
  store: "Goodwill",
  category_id: 3)

i5 = Item.create(name: "Gray and White Striped Long Sleeve", 
  color: "Grey", 
  image: "https://cdn.shopify.com/s/files/1/0783/3649/products/VANS_MENS_SHIRT_STRIPED-LS_410.jpg?v=1570229150", 
  cost: 5.99, 
  times_used: 24, 
  category_id: 2, 
  date_purchased: "2017-05-24", 
  manufacture_location: "China", 
  store: "Goodwill")

i6 = Item.create(name: "Beanie", 
  color: "Turquoise", 
  image: "https://lp2.hm.com/hmgoepprod?set=quality[79],source[/f8/71/f871be78b1b5c16111934ad1b8d7542d397eaf17.jpg],origin[dam],category[men_accessories_hatscaps_beanie],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]", 
  cost: 4.99, 
  times_used: 36, 
  category_id: 1, 
  date_purchased: "2016-08-16", 
  manufacture_location: "China", 
  store: "Claire's")

i7 = Item.create(name: "Army Hoody", 
  color: "Gray", 
  image: "https://images-na.ssl-images-amazon.com/images/I/71OYRsSmzvL._AC_UX385_.jpg", 
  cost: 0.0, 
  times_used: 22, 
  category_id: 1, 
  date_purchased: "1987-09-12", 
  manufacture_location: "Unknown", 
  store: "Mom Hand-me-down")

  i8 = Item.create(name: "Jeans", 
  color: "Blue", 
  image: "https://slimages.macysassets.com/is/image/MCY/products/8/optimized/8185688_fpx.tif?op_sharpen=1&wid=500&hei=613&fit=fit", 
  cost: 12.0, 
  times_used: 38, 
  category_id: 3, 
  date_purchased: "2015-08-23", 
  manufacture_location: "China", 
  store: "Goodwill")

i9 = Item.create(name: "Converse Hightops", 
color: "Black", 
image: "https://www.famousfootwear.com/productimages/shoes_ia69924.jpg?trim.threshold=105&width=630&height=480&paddingWidth=60", 
cost: 55.0, 
times_used: 12, 
category_id: 4, 
date_purchased: "2015-08-23", 
manufacture_location: "Vietnam", 
store: "Footwear Plus")  

o1 = Outfit.create(name: "Interview Ready",
  likes: 0)

o1.items << [i1, i3, i4, i9]

o2 = Outfit.create(name: "Casual 1", likes: 5)

o2.items << [i2, i6, i7, i8, i9]

