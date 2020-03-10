module TestPassagesHelper
  SUCCESS_RESULT = 85

  def success(test_passage)
    test_passage.result >= SUCCESS_RESULT
  end
end
