headers = <<END
Accept: */*
Set-Cookie: foo=42
Set-Cookie: bar=23
END


def parse_headers(headers)
  headers.lines.reduce({}) do |result, line|
    name, value = line.split(":")
    result.merge(name.strip => value.strip)
  end
end

# p parse_headers(headers)
# {"Accept"=>"*/*", "Set-Cookie"=>"bar=23"}
#  => {"Accept"=>"*/*", "Set-Cookie"=>"bar=23"}
#
#
def parse_headers(headers)
  headers.lines.reduce({}) do |result, line|
    name, value = line.split(":")
    result.merge(name.strip => value.strip) {
      |key, left, right|
      Array(left) + Array(right)
    }
  end
end

p parse_headers(headers)
#2.7.1 :039 > p parse_headers(headers)
# {"Accept"=>"*/*", "Set-Cookie"=>["foo=42", "bar=23"]}
#  => {"Accept"=>"*/*", "Set-Cookie"=>["foo=42", "bar=23"]}
#
accounting = {
    "burger" => 3,
    "cheesesteak" => 1,
    "veggie wrap" => 2
}

engineering = {
    "burger" => 2,
    "gyro" => 3
}

marketing = {
    "burger" => 1,
    "veggie wrap" => 2,
    "gyro" => 1
}

order = [accounting, engineering, marketing].reduce({}) {
    |result, dept|
  result.merge(dept) {
      |key, left, right|
    left + right
  }
}
order
# => {"burger"=>6, "cheesesteak"=>1, "veggie wrap"=>4, "gyro"=>4}
require "active_support/core_ext"

options = { genre: "drum&bass" }
full_options = options.reverse_merge(genre: "trance", bpm: 140)
full_options
# => {:genre=>"drum&bass", :bpm=>140}
#
options = { genre: "drum&bass" }
full_options = options.merge(genre: "trance", bpm: 140){|_, left, _| left}
full_options
# => {:genre=>"drum&bass", :bpm=>140}