module TestsHelper

  def test_header(test)
    test_title = test.new_record? ? 'Create new' : 'Edit'
    "#{test_title} test"
  end
end
