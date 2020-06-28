h = {}
h['fnord']


h = {'fnord' => nil}
h['fnord']


result = if (2 + 2) == 5
           "uh-oh"
         end
result
#2.7.1 :331 > result
#  => nil
#
pe = case :foo
       when String then "string"
       when Integer then "integer"
       end
type

if (2 + 2) == 5
  tip = "follow the white rabbit"
end
tip

[1, 2, 3].detect{|n| n == 5}


require 'yaml'
SECRETS = File.exist?('secrets.yml') && YAML.load_file('secrets.yml')

def get_password_for_user(username=ENV['USER'])
  secrets = SECRETS || @secrets
  entry = secrets && secrets.detect{|entry| entry['user'] == username}
  entry && entry['password']
end

get_password_for_user
