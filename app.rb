
require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require 'dm-postgres-adapter'

STUDENT_DB ||= 'postgres://e:@localhost/students'

DataMapper.setup(:default,STUDENT_DB)

get '/' do
  @students = Student.all
  erb :students
end

post '/' do
  student = request.POST
  @student = Student.create(params)

  redirect '/'
end




class Student
include DataMapper::Resource
  
  property :id, Serial
  property :first_name, String, :required => true
  property :last_name, String, :required => true
  property :github, Text, :required => true
  property :blog, Text, :required => true
  property :created_at, DateTime

end

DataMapper.finalize.auto_upgrade!