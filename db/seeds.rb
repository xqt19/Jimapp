# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying..."

Instruction.destroy_all
Session.destroy_all
Exercise.destroy_all

puts "seeding exercises..."

a = Exercise.new(
  name: "Pushups",
  description: "A push-up is a common calisthenics exercise beginning from the prone position by raising and lowering the body using the arms. Push-ups are a basic exercise used in civilian athletic training or physical education and commonly in military physical training.",
  image_url: "https://www.verywellfit.com/thmb/A-zPYweCbj2QpJ8Fu39lEBfyLo0=/2560x2000/filters:no_upscale():max_bytes(150000):strip_icc()/13-DiveBombPushup2-56fc409c5f9b586195ab0b65.jpg"
  )
a.save

b = Exercise.new(
  name: "Running",
  description:
   "Jogging is a form of running at a slow or leisurely pace, maintaining a steady speed for longer periods of time. Performed over long distances, it is a form of aerobic endurance training.",
  image_url:
   "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Ludovic_and_Lauren_%288425515069%29.jpg/800px-Ludovic_and_Lauren_%288425515069%29.jpg"
   )
b.save

b = Exercise.new(
  name: "Situps",
  description:
   "The sit-up (or curl-up) is an abdominal endurance training exercise to strengthen and tone the abdominal muscles.",
  image_url:
   "https://previews.123rf.com/images/afendikoff/afendikoff1804/afendikoff180400024/98820991-sit-ups-sport-exercises-stage-of-sit-up-exercises-with-free-weight-illustration-of-an-active-lifesty.jpg"
   )
b.save

b = Exercise.new(
  name: "Squats",
  description:
   "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up. ",
  image_url:
   "https://garagegymplanner.com/wp-content/uploads/2017/01/Regular-squat.jpg"
   )
b.save

puts "seeding sessions..."

c = Session.new(
  completed: false,
  difficulty: "Easy",
  category: "Circuit",
  deadline: DateTime.new(2019, 12, 31, 23, 59, 00),
  name: "IPPT in 3 months"
 )
c.save

c = Session.new(
  completed: false,
  difficulty: "Tough",
  category: "Endurance",
  deadline: DateTime.new(2019, 11, 30, 23, 59, 00),
  name: "Mt Faber Trail w/ friends"
 )
c.save

c = Session.new(
  completed: false,
  difficulty: "Spartan",
  category: "Aerobics",
  deadline: DateTime.new(2019, 11, 20, 23, 59, 00),
  name: "Do You Lift Challenge"
 )
c.save


puts "seeding instructions..."
7.times {
  num = (rand(1..5) * 10).to_s
  space = " "
  string = num + space + "reps"

  e = Instruction.new()
  e.session = Session.all.sample
  e.exercise = Exercise.all.sample
  string = num + space + "reps"
  string = num + space + "mins" if e.exercise.name == "Running"
  e.instruction = string
  e.save
}

puts "finished!"
