# Diagram: https://gist.github.com/JoshCheek/e60015c983bbe842cffeb02b75452937
require_relative 'setup'
ActiveRecord::Schema.define do
  self.verbose = false

  # MIGRATIONS
  # <-- your work goes here
end


# MODELS
# <-- your work goes here


# TESTS
class BlogTest < Minitest::Test
  def test_users_know_their_posts
    User.create! name: 'Josh' do |josh|
      josh.posts.build title: 'Things I do for fun', body: 'waterski'
      josh.posts.build title: 'random thoughts', body: 'random cannot exist in a deterministic universe'
    end
    User.create! name: 'Brant' do |josh|
      josh.posts.build title: '3 ways to get better', body: '1) practice, 2) practice, 3) practice'
      josh.posts.build title: 'One more way to get better', body: 'practice'
    end

    # Josh's posts
    josh  = User.find_by name: 'Josh'
    assert_equal ['Things I do for fun', 'random thoughts'],
                 josh.posts.pluck(:title)
    assert_equal ['waterski', 'random cannot exist in a deterministic universe'],
                 josh.posts.pluck(:body)

    # Brant's posts
    brant = User.find_by name: 'Brant'
    assert_equal ['3 ways to get better', 'One more way to get better'],
                 brant.posts.pluck(:title)
    assert_equal ['1) practice, 2) practice, 3) practice', 'practice'],
                 brant.posts.pluck(:body)
  end

  def test_posts_know_their_user
    rod = User.create! name: 'Rod', posts: [Post.new(title: 'Rod says', body: 'Practice more!')]
    assert_equal rod, Post.last.user
  end

  def test_posts_can_have_comments
    mei  = User.create! name: 'Mei'
    sara = User.create! name: 'Sara' do |sara|
      sara.posts.build title: 'I am posting!' do |post|
        post.comments.build comment: 'This is a comment!', user: mei
        post.comments.build comment: 'Thanks for the comment!', user: sara
      end
    end

    post = sara.posts.first

    assert_equal ['This is a comment!', 'Thanks for the comment!'],
                 post.comments.pluck(:comment)
  end

  def test_comments_know_their_user
    rod     = User.new(name: 'Rod')
    comment = Comment.create! comment: 'hello', user: rod
    assert_equal rod, comment.user
  end


  def test_users_know_about_the_comments_they_wrote
    # To get this one, I used:
    #   has_many :comments_written, class_name: 'Comment'
    # instead of the standard:
    #   has_many :comments
    # This option and others are listed at:
    #   http://guides.rubyonrails.org/association_basics.html#options-for-has-many
    jim  = User.create! name: 'Jim'
    jan  = User.create! name: 'Jan'
    jane = User.create! name: 'Jane' do |jane|
      jane.posts.build title: 'This is a post!' do |post|
        post.comments.build comment: 'first',  user: jim
        post.comments.build comment: 'second', user: jan
      end
    end
    assert_equal ['first'],  jim.comments_written.pluck(:comment)
    assert_equal ['second'], jan.comments_written.pluck(:comment)
  end


  def test_posts_can_have_commenters
    # From the same url (http://guides.rubyonrails.org/association_basics.html#options-for-has-many)
    # But this time, I used the "source" option
    mei  = User.create! name: 'Mei'
    sara = User.create! name: 'Sara' do |sara|
      sara.posts.build title: 'I am posting!' do |post|
        post.comments.build comment: 'This is a comment!', user: mei
        post.comments.build comment: 'Thanks for the comment!', user: sara
      end
    end

    post = sara.posts.first

    assert_equal ['Mei', 'Sara'], post.commenters.pluck(:name)
  end

  def test_users_know_about_the_comments_they_received_on_their_posts
    jim  = User.create! name: 'Jim'
    jan  = User.create! name: 'Jan'
    jane = User.create! name: 'Jane' do |jane|
      jane.posts.build title: 'This is a post!' do |post|
        post.comments.build comment: 'first',  user: jim
        post.comments.build comment: 'second', user: jan
      end
    end
    assert_equal ['first', 'second'], jane.comments_received.pluck(:comment)
  end

  def test_users_know_about_the_commenters_on_their_posts
    jim  = User.create! name: 'Jim'
    jan  = User.create! name: 'Jan'
    jane = User.create! name: 'Jane' do |jane|
      jane.posts.build title: 'This is a post!' do |post|
        post.comments.build comment: 'first',  user: jim
        post.comments.build comment: 'second', user: jan
      end
    end

    assert_equal ['Jim', 'Jan'], jane.commenters.pluck(:name)
  end
end
