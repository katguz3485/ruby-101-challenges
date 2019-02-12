def foo(bar, *args)
  args #wrzuca args do tablicy
end

puts foo(1, 2, 3)

# keyword arguments
def create_user!(name:, email:, is_vip: false)

end

create_user!(name: "Kasia", email: "kasia@gmail.com", is_vip: true)

# hash arguments
def link_to(body, url, html_options = {})
  #do smth
end

link_to 'something', sth_path, method: :post

def multiply_by_two(number)
  number
end

def multiply_by_two(number)
  return number * 2
end

#guard clause
def allowed_to_order?(product_type_id, user_id)
  product_type = fetch_product_type(product_type_id)
  user = fetch(user_id)
  return false if product_type.adult_only? && user.age < 18
  true
end


('a'..'j').to_a.sample.upcase

#User
# .where (..)
# .order(..)
# .limit(..)


