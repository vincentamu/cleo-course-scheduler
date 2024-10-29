RSpec.shared_context 'logged in student', :shared_context => :metadata do
  include UserLoginHelper

  before(:each) do
    mock_current_student_login
  end 
end

RSpec.shared_context 'logged in admin', :shared_context => :metadata do
  include UserLoginHelper

  before(:each) do
    mock_current_student_login_admin
  end
end

RSpec.shared_context 'models setup', :shared_context => :metadata do
  let(:major) { Major.create(mname: 'Computer Science', cname: 'College of Engineering') }
  let(:core_category) { CoreCategory.create(cname: 'Communication') }
  let(:track) { Track.create(tname: 'Software') }
  let(:emphasis) { Emphasis.create(ename: 'Math') }
  let(:course) { Course.create(ccode: 'CSCE', cnumber: 411, cname: 'Software Engineering', credit_hours: 3) }

  let(:course_emphasis) { CourseEmphasis.create(course: course, emphasis: emphasis) }
  let(:course_track) { CourseTrack.create(course: course, track: track) }
  let(:course_core) { CourseCoreCategory.create(course: course, core_category: core_category) }

  let(:student) { Student.create(
    google_id: 123_456_789,
    first_name: 'John',
    last_name: 'Adams',
    email: 'JAdams@gmail.com',
    enrol_year: 2020,
    grad_year: 2024,
    enrol_semester: 0,
    grad_semester: 1,
    major: major)
}
  let(:student_course) { StudentCourse.create(student: student, course: course, sem: 1) }

  let(:degree_requirement) { DegreeRequirement.create(course: course, major: major, sem: 1) }
end