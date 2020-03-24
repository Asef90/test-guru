module TestsHelper

  def test_header(test)
    test_title = test.new_record? ? t('.create') : t('.edit')
  end
end
