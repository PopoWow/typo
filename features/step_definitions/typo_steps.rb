Given /^the blog is set up$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'admin',
                :password => 'aaaaaaaa',
                :email => 'joe@snow.com',
                :profile_id => 1,
                :name => 'admin',
                :state => 'active'})
end

Given /^the following user[s]? exist[s]?:$/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is 
    # the table header.  you should arrange to add that
    # user to the database here.
    User.create!(user)
  end
end

Given /^the following article[s]? exist[s]?:$/ do |article_table|
  article_table.hashes.each do |article_info|
    # each returned element will be a hash whose key is 
    # the table header.  you should arrange to add that
    # user to the database here.
    #article[:type] = 'Article'
    article_info[:allow_comments] = true
    article_info[:published] = true
    Article.create!(article_info)
  end
end

Given /^the following comment[s]? exist[s]?:$/ do |comment_table|
  comment_table.hashes.each do |comment_info|
    # I _THINK_ I NEEDED TO SET THIS USER_ID AND MARK THE ARTICLE
    # AS ALLOWING COMMENTS FOR THIS TO WORK...
    comment_info[:user_id] = 1 # just make them all belong to the admin
    
    Comment.create!(comment_info)
  end
end

Given /^the following categor(y|ies) exist[s]?:$/ do |cat_table|
  cat_table.hashes.each do |cat_info|
    Category.create!(cat_info)
  end
end

And /^I am logged into the admin panel as "(.*)"$/ do |account_name|
  visit '/accounts/login'
  fill_in 'user_login', :with => account_name
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /^articles (\d+) and (\d+) are merged$/ do |parent, child|
  visit "/admin/content/edit/#{parent}"
  fill_in "merge_with", :with => child
  click_button "post_submit"
end

