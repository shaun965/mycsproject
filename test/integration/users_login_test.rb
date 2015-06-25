require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

	test "login with invalid information" do
    	get login_path
    	assert_template 'sessions/new'
    	post login_path, session: { email: "", password: "" }
    	assert_template 'sessions/new'
    	assert_not flash.empty?
    	get root_path
    	assert flash.empty?
  	end

  	#test "login with remembering" do
    #	log_in_as(@user, remember_me: '1')
    #	assert_not_nil cookies['remember_token']
  	#end

  	#test "login without remembering" do
    #	log_in_as(@user, remember_me: '0')
    #	assert_nil cookies['remember_token']
  	#end
  # test "the truth" do
  #   assert true
  # end
end
