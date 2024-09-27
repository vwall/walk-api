puts ''
print 'Creating shift...'

user = User.find_by(email: 'anakin@example.com')

%i[monday tuesday wednesday thursday friday].each do |day|
  shift = Shifts::Assign.call(walker: user, day: day)

  10.times.each do
    ShiftAssignments::Assign.call(
      dog: Dog.order('RANDOM()').limit(1).first,
      shift: shift.result,
      status: rand(5),
    )
  end

  print '.'
end
