l = User.create(name:"luke", email:"luke@dbc.com", password_digest:"lop")
c = User.create(name:"clifton", email:"clifton@dbc.com", password_digest:"lop")
d = User.create(name:"dylan", email:"dylan@dbc.com", password_digest:"lop")
j = User.create(name:"jorge", email:"jorge@dbc.com", password_digest:"lop")

def random_question_id
  Question.limit(1).order("RANDOM()").pluck(:id)
end

l.questions.create(title: "runny nose", content: "it's like I pulled my finger out of a dam, help!!", image: "http://www.fasthomeremedy.com/wp-content/uploads/2013/06/174-620x350.jpg")

c.questions.create(title: "my words don't sound like english", content: "hertt aort yeeeee-O", image: "http://www.troll.me/images/engineering-professor/has-a-phd-cant-speak-english-thumb.jpg")

d.questions.create(title: "offered as tribute AGAIN", content: "come on guys. still with this joke?", image: "http://images.rottentomatoes.com/images/movie/gallery/1010532/photo_09_hires.jpg")

j.questions.create(title: "If you think it is cool...", content: "Yes, I am the brain behind this operation.", image: "http://images.teamsugar.com/files/users/1/13839/42_2007/albert-einstein-young-1.jpg")
