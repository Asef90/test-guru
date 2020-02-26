class User < ApplicationRecord
  def passed_tests(level)
    Test.joins("INNER JOIN user_tests ON user_tests.id = tests.id")
        .where(level: level, user_tests: { user_id: id })
  end
end
