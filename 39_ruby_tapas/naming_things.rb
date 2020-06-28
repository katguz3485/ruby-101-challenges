# Attendee = Struct.new(:email)
#
# Attendance = Struct.new(:event, :attendee, :plus_one)
#
# Event = Struct.new(:name, :capacity, :attendances) do
#   def initialize(*)
#     super
#     self.attendances ||= []
#   end
#
#   def attendees
#     attendances.reduce(0) {|count, attendance|
#       if attendance.plus_one
#         count + 2
#       else
#         count + 1
#       end
#     }
#   end
#
#   def add_attendance(attendance)
#     new_attendees = if attendance.plus_one
#                       2
#                     else
#                       1
#                     end
#     if attendees + new_attendees > capacity
#       raise "Sorry, this event is full!"
#     else
#       attendances << attendance
#     end
#   end
# end
Event = Struct.new(:name, :capacity, :attendances) do
  def initialize(*)
    super
    self.attendances ||= []
  end

  def head_count
    attendances.reduce(0) {|count, attendance|
      count + attendance.heads
    }
  end

  def add_attendance(attendance)
    if head_count + attendance.heads > capacity
      raise "Sorry, this event is full!"
    else
      attendances << attendance
    end
  end
end