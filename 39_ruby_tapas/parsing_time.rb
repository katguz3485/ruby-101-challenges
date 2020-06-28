require 'time'

Time.parse('Apr 28, 2013 9:00am')
# => 2013-04-28 09:00:00 +0200
#
require 'date'
print_format = '%-m/%-d/%Y %k:%M'
Time.new(2013, 4, 28, 9, 0).strftime(print_format)
# => "4/28/2013  9:00"
#
#
format = '%m/%d/%Y %k:%M'
DateTime.strptime('4/28/2013 9:00', format).to_time
# / => 2013-04-28 09:00:00 +0000
#
format = '%m/%d/%Y %k:%M'
time_parts = DateTime._strptime('4/28/2013 9:00', format)
#2.7.1 :240 > _
#  => {:mon=>4, :mday=>28, :year=>2013, :hour=>9, :min=>0}
#
format = '%m/%d/%Y %k:%M'
time_parts = DateTime._strptime('4/28/2013 9:00', format)
time = Time.local(
    time_parts[:year],
    time_parts[:mon],
    time_parts[:mday],
    time_parts[:hour],
    time_parts[:min])

# 2.7.1 :250 > _
#  => 2013-04-28 09:00:00 +0200

require 'chronic'
time = Chronic.parse('4/28/2013 9:00')
time # => 2013-04-28 09:00:00 -0400