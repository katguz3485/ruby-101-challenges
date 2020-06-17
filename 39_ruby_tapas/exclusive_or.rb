
def replace_var(text, var_name, value=nil)
  text.gsub!(/\{#{var_name}\}/) { value || yield }
end

replace_var("Hello, {name}", 'name', 'Kasia')

# if not provided can be replaced with block
text = "my {noun} is full of {noun}s"
replace_var(text, 'noun') {
  %w[hovercraft eel macaroon dreidel cabana parrot].sample
}

# [47] pry(main)> false || nil
# => nil
# [48] pry(main)> false ^ nil
# => false

#[49] pry(main)> true || 42
# => true
# [50] pry(main)> true ^ 42
# => false

#[51] pry(main)> true || false
# => true
# [52] pry(main)> true ^ false
# => true

#[55] pry(main)> !!nil                           # => false
# => false
# [56] pry(main)> !!"spam"                        # => true
# => true
# [57] pry(main)> !!"spam" ^ false                # => true
# => true

def replace_var(text, var_name, value=nil)
  unless block_given? ^ value
    raise ArgumentError,
          "Either value or block must be given, but not both"
  end
end

text = "my {noun} is full of {noun}s"
replace_var(text, 'noun') rescue $!
replace_var(text, 'noun', 'world'){'Avdi'} rescue $!

