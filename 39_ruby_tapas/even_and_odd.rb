

bucket_a = []
bucket_b = []

[:thing1, :thing2, :thing3, :thing4].each_with_index do |thing, i|
  if
  bucket_a << thing
  else
    bucket_b << thing
  end
end

2.even?
2.odd?