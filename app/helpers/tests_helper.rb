module TestsHelper

  def test_header(test)
    test_title = action_name == 'new' ? 'Create new' : 'Edit'
    "#{test_title} test"
  end
end
